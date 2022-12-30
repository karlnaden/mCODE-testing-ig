// This version works on the MITRE TestScript Engine (except for resource validation), 
// but not AEGIS Touchstone (doesn't like the use of url to specify the resource type on the read)
Instance: us-mcode-identify-cancer-patients-by-group-url
InstanceOf: TestScript
Usage: #definition
* url = "https://github.com/fhir-crucible/testscript-generator/UsMcodeIdentifyCancerPatientsByGroupUrl"
* version = "0.1"
* name = "UsMcodeIdentifyCancerPatientsByGroupUrl"
* title = "Us Mcode Identify Cancer Patients By Group (using URL)"
* status = #draft
* experimental = true
* date = "2022-09-21T13:00:51-04:00"
* publisher = "The MITRE Corporation"
* contact.name = "Karl Naden"
* variable[+].name = "firstGroupMemberRef"
* variable[=].expression = "entry[0].resource.member[0].entity.reference"
* variable[=].sourceId = "groupBundle"
* profile[+].id = "profileCancerPatient"
* profile[=].reference = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* test[+].name = "Group Search"
* test[=].action[+].operation.description = "Search For Cancer Group"
* test[=].action[=].operation.label = "Search_For_Cancer_Group"
* test[=].action[=].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #Group
* test[=].action[=].operation.encodeRequestUrl = false
* test[=].action[=].operation.params = "?code=C19700"
* test[=].action[=].operation.responseId = "groupBundle"
* test[=].action[+].assert.description = "Assert Response OK"
* test[=].action[=].assert.label = "Assert_Response_OK"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.response = #okay
* test[=].action[+].assert.description = "Assert Bundle Returned"
* test[=].action[=].assert.label = "Assert_Bundle_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.resource = #Bundle
* test[=].action[+].assert.description = "Assert At Least One Entry Returned"
* test[=].action[=].assert.label = "Assert_At_Least_One_Entry_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "entry.count() > 0"
* test[=].action[+].assert.description = "Assert At Least One Entry In the First Group"
* test[=].action[=].assert.label = "Assert_At_Least_One_Entry_Entry_In_the_First_Group"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "entry[0].resource.member.count() > 0"
* test[=].action[+].operation.description = "Read Group Member"
* test[=].action[=].operation.label = "Read_Group_Member"
* test[=].action[=].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#read
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.url = "/${firstGroupMemberRef}"
* test[=].action[=].operation.responseId = "cancerPatient"
* test[=].action[+].assert.description = "Assert Read Response OK"
* test[=].action[=].assert.label = "Assert_Read_Response_OK"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.response = #okay
* test[=].action[+].assert.description = "Assert Patient Returned"
* test[=].action[=].assert.label = "Assert_Patient_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.resource = #Patient
* test[=].action[+].assert.description = "Patient Conforms to Cancer Patient Profile"
* test[=].action[=].assert.label = "Assert_Patient_Conforms_to_Cancer_Patient_Profile"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.validateProfileId = "profileCancerPatient"

// This version works on AEGIS Touchstone (I think - need to get the profile uploaded)
// It does not work on the MITRE TestScript Engine due to incomplete FHIR Path implementation (and missing resource validation)
Instance: us-mcode-identify-cancer-patients-by-group
InstanceOf: TestScript
Usage: #definition
* url = "https://github.com/fhir-crucible/testscript-generator/UsMcodeIdentifyCancerPatientsByGroup"
* version = "0.1"
* name = "UsMcodeIdentifyCancerPatientsByGroup"
* title = "Us Mcode Identify Cancer Patients By Group (using Params)"
* status = #draft
* experimental = true
* date = "2022-09-21T13:00:51-04:00"
* publisher = "The MITRE Corporation"
* contact.name = "Karl Naden"
* variable[+].name = "firstGroupMemberId"
* variable[=].expression = "entry[0].resource.member[0].entity.reference.substring(iif(contains('/'),indexOf('/')+1,0),length())"
* variable[=].sourceId = "groupBundle"
* profile[+].id = "profileCancerPatient"
* profile[=].reference = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* test[+].name = "Group Search"
* test[=].action[+].operation.description = "Search For Cancer Group"
* test[=].action[=].operation.label = "Search_For_Cancer_Group"
* test[=].action[=].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #Group
* test[=].action[=].operation.encodeRequestUrl = false
* test[=].action[=].operation.params = "?code=C19700"
* test[=].action[=].operation.responseId = "groupBundle"
* test[=].action[+].assert.description = "Assert Response OK"
* test[=].action[=].assert.label = "Assert_Response_OK"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.response = #okay
* test[=].action[+].assert.description = "Assert Bundle Returned"
* test[=].action[=].assert.label = "Assert_Bundle_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.resource = #Bundle
* test[=].action[+].assert.description = "Assert At Least One Entry Returned"
* test[=].action[=].assert.label = "Assert_At_Least_One_Entry_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "entry.count() > 0"
* test[=].action[+].assert.description = "Assert At Least One Entry In the First Group"
* test[=].action[=].assert.label = "Assert_At_Least_One_Entry_Entry_In_the_First_Group"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "entry[0].resource.member.count() > 0"
* test[=].action[+].assert.description = "Assert First Group Entry Is A Patient"
* test[=].action[=].assert.label = "Assert_First_Group_Entry_Is_A_Patient"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "entry[0].resource.member[0].entity.reference.substring(0, iif(contains('/'),indexOf('/'),length())) = 'Patient'"
* test[=].action[+].operation.description = "Read Group Member"
* test[=].action[=].operation.label = "Read_Group_Member"
* test[=].action[=].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#read
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.params = "/${firstGroupMemberId}"
* test[=].action[=].operation.resource = #Patient
* test[=].action[=].operation.responseId = "cancerPatient"
* test[=].action[+].assert.description = "Assert Read Response OK"
* test[=].action[=].assert.label = "Assert_Read_Response_OK"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.response = #okay
* test[=].action[+].assert.description = "Assert Patient Returned"
* test[=].action[=].assert.label = "Assert_Patient_Returned"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.resource = #Patient
* test[=].action[+].assert.description = "Patient Conforms to Cancer Patient Profile"
* test[=].action[=].assert.label = "Assert_Patient_Conforms_to_Cancer_Patient_Profile"
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.validateProfileId = "profileCancerPatient"
