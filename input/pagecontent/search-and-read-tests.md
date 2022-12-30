When testing and validating a FHIR server for conformance to a particular implementation guide, one important piece of information is which IG profiles the server supports. While a server's CapabilityStatement can list those supported, this set of tests can provide evidence of that support by identifying instances that actually conform to different profiles. To avoid the need for the user to identify an instance for each profile, the tests make use of the [search criteria](http://hl7.org/fhir/us/mcode/conformance-general.html#support-querying-mcode-conforming-resources) the mCODE IG specifies for querying instances of each profile to search for entries of interest within the context of a provided patient. It then checks the instances returned for conformance.

### Usage

To execute, the user indicates a single patient id available on the server under test. The tests use the [profile scope queries](http://hl7.org/fhir/us/mcode/conformance-general.html#support-querying-mcode-conforming-resources) provided in the mCODE IG to identify instances to check for conformance against the corresponding profiles. Each found instance is read and validated separately and the results documented for review later.

Note that some mCODE profiles do not have a set of search criteria that returns a tight set of resource that will be conformant (e.g., [CancerRelatedMedicationRequest](http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-related-medication-request.html)). In some cases, the tests use a more general query and expect that not all returned instances will conform. In others where the number of returned instances is expected to be large and the conformant instances sparse, the tests request that individual instance ids to check be provided.

#### Execution

1. Install the TestScript Engine using instructions [here](https://github.com/fhir-crucible/testscript-engine#running-the-engine).
2. Download the [execution package](mCODESearchAndReadTests.zip), unzip it, and put the resulting `mCODESearchAndReadTests` folder into into the `testscript-engine` folder where you installed the engine.
3. Edit the `mCODESearchAndReadTests/test-config.yml` file, adjusting the following configuration keys
  - `server_url`: The target FHIR server
  - `variable`: update the variables to point to instances on the target FHIR server. The `rootus-mCODEIGPatientId=` entry should be set to the id of the target patient. Other entries may be updated to point it instances for the profile indicated in the variable name (`targetResourceId[profile name]`).
  - (optionally) update the `ext_validator` and `ext_fhirpath` variables if test data cannot be sent to a public server (see additional details [below](search-and-read-tests.html#local-validator-and-fhirpath-support))
4. From the command line in the installed `testscript-engine` directory, execute command `bundle exec ruby bin/testscript_engine execute --config mCODESearchAndReadTests/test-config.yml`

If there are multiple patients that the tests should be executed against, update the `variable` entries as in step 3 and repeat step 4 for each additional patient.

#### Interpreting Results

Results of the execution will be placed under the `mCODESearchAndReadTests/Results` directory. The generated files include timestamps in their paths so that multiple runs were necessary, all the results will be kept. See the TestScript Engine documentation for [details on the output](https://github.com/fhir-crucible/testscript-engine#feedback-and-result-interpretation).

Assuming that all tests did not pass, which would indicate full support for all profiles, the following proceedure can be used to determine which profiles the test execution(s) verified support for:
1. Open the summary file(s) (form `mCODESearchAndReadTests/Results/execution_summary_[timestamp].csv`) using excel or another spreadsheet program. If there are multiple, consider combining them into a single file. You can do so for example by running command `cat mCODESearchAndReadTests/Results/execution_summary_* >> mCODESearchAndReadTests/Results/execution_summary_combined.csv`. You will need to clear out duplicate header rows, but will otherwise have all the results. Clear out execution summary files you don't want to include before running the command.
2. Sort by `title` column.
3. For each profile that is expected to be supported, filter the list to just those tests for that profile using a text filter on the `title` column.
  - If all tests in the filtered list passed, then support for the profile was validated
  - If some tests in the filtered list failed, but the `mustPass?` column is false, then check to make sure the failed test were on instances that should actually conform to the profile. These are cases where the query was not guaranteed to return only instances conformant to the target profile.
  - If all tests in the filtered list failed, then open the corresponding reports indicated in the `testReportFilePath` column to get more information (text search for `fail` to find error messages).
  - If no tests remained in the filtered list, then the filter query(s) returned no instances to test and the query should be run outside of the context of the test to determine what is happening.

See other ideas for interpretation approaches [here](https://github.com/fhir-crucible/testscript-engine#interpretation-approach).

### Additional Options

The above approach to usage and execution provides a "happy path" that will work for most systems. For some systems, the following options may make more sense.

#### Local Validator and FHIRPath Support

The MITRE FHIR Foundry [TestScript Engine](https://github.com/fhir-crucible/testscript-engine) relies on Inferno's [fhir-validator-wrapper](https://github.com/inferno-framework/fhir-validator-wrapper) and by default is configured to send instances and queries to the [ONC-hosted version](https://inferno.healthit.gov/validator/). If the system under test contains PHI or other sensitive data, a local copy of the validator should be deployed using instructions [here](https://github.com/inferno-framework/fhir-validator-wrapper). In order to point the TestScript Engine to the local copy, update the `ext_validator` and `ext_fhirpath` configuration keys in the `test-config.yml` file with the local host and port.

#### Test Data
 
These tests take a "bring your own data" approach for several reasons
1. Write capabilities are not always supported for all resources that can be read.
2. For system that support data entry through a UI, it is beneficial to validate the data that they generate.

Systems that do not generate their own data can load [mCODE IG sample data](http://hl7.org/fhir/us/mcode/examples.html) for use with these tests, though these instances do not all pass validation without modification (e.g., due to example domains in identifiers). [This Bundle instance](mcode-patient-bundle-jenny-m_transactionBundle_preSTU3-2022-12-16.json) contains all data from the extended Jenny M example and successfully loads on the [HAPI test server](http://hapi.fhir.org/).

#### Specific-instances Execution Mode

Systems that don't support query functionality may still want to validate support for specific profiles. In specific-instances mode, the user provides a instance id for each profile to read and check. This bypasses the search and any uncertainty there, but requires up-front work to identify specific instances to provide to the test execution. Each specified instance is read and validated separately and the results documented for review later.

To execute using this mode, make the following modifications to the execution instructions described [above](search-and-read-tests.html#execution)
- In step 2,
  - Remove the `mCODESearchAndReadTests/TestScripts/UsMCODESearchAndReadProfilesFromRootPatient.json` file
- In step 3,
  - Remove the value from configuration key `testscript_name`
  - Replace the list under the `variable` configuration key with this list and replace the values as described. No specific root patient is needed in this case

```
  - targetResourceIdCancerDiseaseStatus=cancer-disease-status-jenny-m
  - targetResourceIdCancerPatient=cancer-patient-jenny-m
  - targetResourceIdCancerRelatedMedicationAdministration=TODO
  - targetResourceIdCancerRelatedMedicationRequest=cancer-related-medication-request-paclitaxel-jenny-m
  - targetResourceIdCancerRelatedSurgicalProcedure=cancer-related-surgical-procedure-jenny-m
  - targetResourceIdCancerStageGroup=TODO
  - targetResourceIdComorbidities=cancer-related-comorbidities-jenny-m
  - targetResourceIdECOGPerformanceStatus=ecog-performance-status-jenny-m
  - targetResourceIdGenomicRegionStudied=genomic-region-studied-jenny-m
  - targetResourceIdGenomicsReport=genomics-report-jenny-m
  - targetResourceIdGenomicVariant=genomic-variant-jenny-m
  - targetResourceIdHumanSpecimen=tumor-specimen-left-breast-jenny-m
  - targetResourceIdKarnofskyPerformanceStatus=TODO
  - targetResourceIdMCODEPatientBundle=TODO
  - targetResourceIdMCODEPatientGroup=TODO
  - targetResourceIdPrimaryCancerCondition=primary-cancer-condition-jenny-m
  - targetResourceIdRadiotherapyCourseSummary=radiotherapy-treatment-summary-chest-wall-jenny-m
  - targetResourceIdRadiotherapyVolume=TODO
  - targetResourceIdSecondaryCancerCondition=TODO
  - targetResourceIdTNMDistantMetastasesCategory=tnm-clinical-distant-metastases-category-jenny-m
  - targetResourceIdTNMPrimaryTumorCategory=tnm-clinical-primary-tumor-category-jenny-m
  - targetResourceIdTNMRegionalNodesCategory=tnm-pathologic-regional-nodes-category-jenny-m
  - targetResourceIdTNMStageGroup=tnm-clinical-stage-group-jenny-m
  - targetResourceIdTumorMarkerTest=tumor-marker-test-er-jenny-m
  - targetResourceIdTumor=TODO
  - targetResourceIdTumorSize=tumor-size-jenny-m
```

Interpret as explained [above](search-and-read-tests.html#interpreting-results).

#### Execution on Other TestScript-enabled Systems

These execution instructions assume that the MITRE FHIR Foundry [TestScript Engine](https://github.com/fhir-crucible/testscript-engine) is being used. However, the specific-instances mode does not use any implementation-specific instructions, so could be executed on other TestScript-enabled platforms. Refer to the documentation of those platforms for how to load and execute the tests and access and interpret the results.

#### Generation for Other mCODE versions

The tests available on this page were generated by the MITRE FHIR Foundry [TestScript Generator](https://github.com/fhir-crucible/testscript-generator), specifically the [profile read tests](https://github.com/fhir-crucible/testscript-generator#profile-read-tests). They were generated from and target the mCODE pre-STU3 build version as of mid-December 2022 ([current build version](http://build.fhir.org/ig/HL7/fhir-mCODE-ig/)), using the following assets:
- package file containing StructureDefinition instances: [package-us-mCODE-preSTU3-2022-12-16.tgz](package-us-mCODE-preSTU3-2022-12-16.tgz)
- Profile scope queries encoding: [profile_scope_search_spec-us-mCODE-preSTU3-2022-12-16.csv](profile_scope_search_spec-us-mCODE-preSTU3-2022-12-16.csv)

Using the TestScript Generator, it is possible to create similar tests for other mCODE IG versions. Instructions follow:
1. Gather materials for generation
  - Obtain the `package.tgz` file with StructureDefinition files defining the profiles from the downloads page (e.g., http://hl7.org/fhir/us/mcode/downloads.html for the current published version)
  - Create the `profile_scope_search_spec.csv` file (format described [here](https://github.com/fhir-crucible/testscript-generator#profile-read-tests)) with the correct list of profiles and search criteria for them using the [Support Querying mCODE-Conforming Resources](http://build.fhir.org/ig/HL7/fhir-mCODE-ig/conformance-general.html#support-querying-mcode-conforming-resources) and additional information on the individual profile pages. See the version created for pre-STU3 tests [here](profile_scope_search_spec-us-mCODE-preSTU3-2022-12-16.csv) as an example.
2. Install, configure, and run the [TestScript Generator](https://github.com/fhir-crucible/testscript-generator)
  - Install using [these instructions](https://github.com/fhir-crucible/testscript-generator#running-the-generator)
  - Clear out the `igs` directory
  - Rename the `package.tgz` file to `us-mCODE.tgz` and place it in the cleared `igs` directory
  - Place the created `profile_scope_search_spec.csv` file into directory `extra_input/us-mCODE` directory
  - From the command line in the installed `testscript-generator` directory, execute command `bundle exec bin/testscript_generator read`
3. Create execution package
  - Download and extract [this execution package](mCODESearchAndReadTests.zip) to use as a template or use a copy that you have modified with your own configuration already.
  - Clear the `mCODESearchAndReadTests/TestScripts` and `mCODESearchAndReadTests/Profiles` folders.
  - Take the generated tests from `[testscript-generator-root]/generated_testscripts/us-mCode/ReadProfileTemplate` and put them into template folder `mCODESearchAndReadTests/TestScripts`.
  - Extract the `us-mCODE.tgz` file and put all `StructureDefinition-*.json` files into template folder `mCODESearchAndReadTests/Profiles`
  - If you marked any profiles as requiring the target id to be specified in the `profile_scope_search_spec.csv`, then add the profile-specific id variable (`targetResourceId[profile name]`) to the list in the `test-config.yml` file under the `variable` section so users know to specify a value.

With those steps, you can use the updated template to execute the tests as described above.

### Status

These tests are complete and usable as described [above](search-and-read-tests.html#execution). Work remains on helping users to execute and interpret the results. Feedback and ideas welcome.