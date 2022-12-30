FHIR Implementation Guides use the `MustSupport` flag to indicate elements that are important and need to be supported even if they are not required because they aren't pertinent in all cases or for all uses. The mCODE IG provides a [precise definition](http://hl7.org/fhir/us/mcode/conformance-profiles.html#must-implement-versus-must-support) of what `MustSupport` connotes within the context of the IG. This definition is complex and nuanced and difficult to completely evaluate and test.

These tests aim lower. They aim to validate which `MustSupport` elements a server can actually produce, meaning populate in a conformant way on at least one profile-conformant resource instance. The idea is that this provides validation of support for a set of `MustSupport` element. This can be used
- By implementers to check for gaps in their expectations.
- By integration partners to check for gaps in mutual support

Since the goal is to test what the server can produce, data entry should be done in the way(s) that will be typical for data to enter the system, whether that be manual data entry or integration, via FHIR or otherwise.

### Usage

#### Execution

1. Install the TestScript Engine using instructions [here](https://github.com/fhir-crucible/testscript-engine#running-the-engine).
2. Download the [execution package](mCODEMustSupportTests.zip), unzip it, and put the resulting `mCODEMustSupportTests` folder into the `testscript-engine` folder where you installed the engine.
3. Edit the `mCODEMustSupportTests/test-config.yml` file, adjusting the following configuration keys
  - `server_url`: The target FHIR server
  - `variable`: update the variables to point to instances on the target FHIR server. Each entry may be updated to point it instances for the profile indicated in the variable name (`targetResourceId[profile name]`).
  - (optionally) update the `ext_validator` and `ext_fhirpath` variables if test data cannot be sent to a public server (see additional details [here](search-and-read-tests.html#local-validator-and-fhirpath-support))
4. From the command line in the installed `testscript-engine` directory, execute command `bundle exec ruby bin/testscript_engine execute --config mCODEMustSupportTests/test-config.yml`

The above steps will execute all tests for all profiles. There are two ways to configure a smaller scope in the`mCODEMustSupportTests/test-config.yml` file:
- Update the `testscript_path` key to `mCODEMustSupportTests/TestScripts/[profile name]` to execute only tests for a specific profile. In this case, only the corresponding profile's variable is used and needs to be set. Revert back to `mCODEMustSupportTests/TestScripts` to execute all tests.
- Update the `testscript_name` key to a specific TestScript `name` to execute only a specific test. Must be found within the `testscript_path`

#### Results Interpretation

Results of the execution will be placed under the `mCODEMustSupportTests/Results` directory. The generated files include timestamps in their paths so that multiple runs were necessary, all the results will be kept. See the TestScript Engine documentation for [details on the output](https://github.com/fhir-crucible/testscript-engine#feedback-and-result-interpretation).

Assuming that all tests did not pass, which would indicate full support for all must support elements across all profiles (not currently possible), the following proceedure can be used to determine which must support elements on which profiles the test execution(s) verified support for:
1. Open the summary file(s) (form `mCODEMustSupportTests/Results/execution_summary_[timestamp].csv`) using excel or another spreadsheet program. If there are multiple, consider combining them into a single file. You can do so for example by running command `cat mCODEMustSupportTests/Results/execution_summary_* >> mCODEMustSupportTests/Results/execution_summary_combined.csv`. You will need to clear out duplicate header rows, but will otherwise have all the results. Clear out execution summary files you don't want to include before running the command.
2. Sort by `title` column.
3. For each profile and element that is expected to be supported, filter the list to just those tests for that profile using a text filter on the `title` column.
  - If any tests in the filtered list passed, then support for the element was validated
  - If all tests in the filtered list failed, then open the corresponding reports indicated in the `testReportFilePath` column to get more information (text search for `fail` to find error messages).

See other ideas for interpretation approaches [here](https://github.com/fhir-crucible/testscript-engine#interpretation-approach).

### Status

These tests are a work in progress. While they can be executed as is, they are ready only for limited proof-of-concept work because
1. Instance ids must be specified for each profile. 
2. Some tests will fail. 
  - There may be bugs. 
  - Some must support patterns, such as required profiles on multiple response items, or multiple options for profiles, are not currently supported and the generated tests will always fail.
  - Other patterns currently use FHIRPath features, such as checking membership in a value set, that aren't supported by the FHIRPath options supported by the TestScript Engine.
3. The feedback and interpretation mechanisms are still in progress.

Features in the TestScript Engine could provide ways past some of these problems with an investment of time. Feedback on whether these test would be helpful to implementers if improved welcome.