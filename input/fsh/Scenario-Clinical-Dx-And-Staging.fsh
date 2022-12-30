Instance: scenario-clinicalDxAndStaging-primaryCondition
InstanceOf: Condition
Description: "Scenario Consistency Test - Clinical Diagnosis and Staging - Primary Condition"
Usage: #example
* extension.url = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-histology-morphology-behavior"
* extension.valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008"
* extension.valueCodeableConcept.coding = http://snomed.info/sct#413448000 "Adenocarcinoma, no subtype, intermediate grade (morphologic abnormality)"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category[+].coding.version = "http://snomed.info/sct/900000000000207008"
* category[=].coding = http://snomed.info/sct#372087000 "Primary malignant neoplasm (disorder)"
* code.coding.version = "http://snomed.info/sct/900000000000207008"
* code.coding = http://snomed.info/sct#353431000119107 "Primary malignant neoplasm of female left breast (disorder)"
* subject = Reference(Patient/scenario-patient)
* onsetDateTime = "2018-03-16"
* asserter = Reference(Practitioner/scenario-oncologist)
* stage.summary.coding.version = "http://snomed.info/sct/900000000000207008"
* stage.summary.coding = http://snomed.info/sct#1222806001 "American Joint Committee on Cancer stage IIB (qualifier value)"
* stage.assessment = Reference(Observation/scenario-clinicalDxAndStaging-tnmStage)
* stage.type.coding.version = "http://snomed.info/sct/900000000000207008"
* stage.type.coding = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"

Instance: scenario-clinicalDxAndStaging-tnmStage
InstanceOf: Observation
Description: "Scenario Consistency Test - Clinical Diagnosis and Staging - TNM Staging"
Usage: #example
* status = #final
* category.coding.version = "http://snomed.info/sct/900000000000207008"
* category.coding = http://snomed.info/sct#385356007 "Tumor stage finding (finding)"
* code = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* subject = Reference(Patient/scenario-patient)
* focus = Reference(Condition/scenario-clinicalDxAndStaging-primaryCondition)
* effectiveDateTime = "2018-03-16"
* valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008"
* valueCodeableConcept.coding = http://snomed.info/sct#1222769001 "American Joint Committee on Cancer stage IIB (qualifier value)"
* method.coding.version = "http://snomed.info/sct/900000000000207008"
* method.coding = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"
* hasMember[0] = Reference(Observation/scenario-clinicalDxAndStaging-tnmStage-tumor)
* hasMember[+] = Reference(Observation/scenario-clinicalDxAndStaging-tnmStage-regionalLymphNodes)
* hasMember[+] = Reference(Observation/scenario-clinicalDxAndStaging-tnmStage-distantMetastases)

Instance: scenario-clinicalDxAndStaging-tnmStage-distantMetastases
InstanceOf: Observation
Description: "Scenario Consistency Test - Clinical Diagnosis and Staging - TNM Staging, Distant Metastases"
Usage: #example
* status = #final
* category.coding.version = "http://snomed.info/sct/900000000000207008"
* category.coding = http://snomed.info/sct#385356007 "Tumor stage finding (finding)"
* code = http://loinc.org#21907-1 "Distant metastases.clinical [Class] Cancer"
* subject = Reference(Patient/scenario-patient)
* effectiveDateTime = "2018-03-16"
* valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008"
* valueCodeableConcept.coding = http://snomed.info/sct#1229901006 "American Joint Committee on Cancer cM0 (qualifier value)"
* method.coding.version = "http://snomed.info/sct/900000000000207008"
* method.coding = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"

Instance: scenario-clinicalDxAndStaging-tnmStage-regionalLymphNodes
InstanceOf: Observation
Description: "Scenario Consistency Test - Clinical Diagnosis and Staging - TNM Staging, Regional Lymph Nodes"
Usage: #example
* status = #final
* category.coding.version = "http://snomed.info/sct/900000000000207008"
* category.coding = http://snomed.info/sct#385356007 "Tumor stage finding (finding)"
* code = http://loinc.org#21906-3 "Regional lymph nodes.clinical [Class] Cancer"
* subject = Reference(Patient/scenario-patient)
* effectiveDateTime = "2018-03-16"
* valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008"
* valueCodeableConcept.coding = http://snomed.info/sct#1229967007 "American Joint Committee on Cancer cN0 (qualifier value)"
* method.coding.version = "http://snomed.info/sct/900000000000207008"
* method.coding = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"

Instance: scenario-clinicalDxAndStaging-tnmStage-tumor
InstanceOf: Observation
Description: "Scenario Consistency Test - Clinical Diagnosis and Staging - TNM Staging, Tumor"
Usage: #example
* status = #final
* category.coding.version = "http://snomed.info/sct/900000000000207008"
* category.coding = http://snomed.info/sct#385356007 "Tumor stage finding (finding)"
* code = http://loinc.org#21905-5 "Primary tumor.clinical [Class] Cancer"
* subject = Reference(Patient/scenario-patient)
* effectiveDateTime = "2018-03-16"
* valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008"
* valueCodeableConcept.coding = http://snomed.info/sct#1228938002 "American Joint Committee on Cancer cT3 (qualifier value)"
* method.coding.version = "http://snomed.info/sct/900000000000207008"
* method.coding = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"