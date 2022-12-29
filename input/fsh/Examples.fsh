Instance: subtest-execution-example
InstanceOf: TestScriptEngineScript
Description: "TestScript instance demonstrating subtest and subtest-each assertions"
Usage: #example
* url = "https://github.com/fhir-crucible/testscript-generator/SubtestExecutionExample"
* version = "0.1"
* name = "SubtestExecutionExample"
* title = "Subtest execution example"
* status = #draft
* experimental = true
* date = "2022-12-27T13:00:51-04:00"
* publisher = "The MITRE Corporation"
* contact.name = "Karl Naden"
* variable.name = "directExecuteInput"
* variable.defaultValue = "wrong"
* variable.description = "value that will be compared on direct execution"
* fixture.id = "testPatient"
* fixture.autocreate = false
* fixture.autodelete = false
* fixture.resource = Reference(Patient/patient-fixture)
* test[0].name = "Direct subtest execution"
* test[=].action.assert.label = "Directly_execute"
* test[=].action.assert.description = "Execute subtest directly"
* test[=].action.assert.extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/assert-subtest"
* test[=].action.assert.extension.extension[0].url = "testName"
* test[=].action.assert.extension.extension[=].valueString = "SubtestToExecuteExample"
* test[=].action.assert.extension.extension[+].url = "bindVariable"
* test[=].action.assert.extension.extension[=].extension[0].url = "bindSource"
* test[=].action.assert.extension.extension[=].extension[=].valueString = "directExecuteInput"
* test[=].action.assert.extension.extension[=].extension[+].url = "bindTarget"
* test[=].action.assert.extension.extension[=].extension[=].valueString = "checkValue"
* test[=].action.assert.warningOnly = false
* test[+].name = "Each value subtest execution one required"
* test[=].action.assert.label = "Execute_subtest_on_list_of_values"
* test[=].action.assert.description = "Execute_subtest_on_list_of_values"
* test[=].action.assert.extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/assert-subtest-each"
* test[=].action.assert.extension.extension[0].url = "testName"
* test[=].action.assert.extension.extension[=].valueString = "SubtestToExecuteExample"
* test[=].action.assert.extension.extension[+].url = "bindEachTarget"
* test[=].action.assert.extension.extension[=].valueString = "checkValue"
* test[=].action.assert.extension.extension[+].url = "allMustPass"
* test[=].action.assert.extension.extension[=].valueBoolean = false
* test[=].action.assert.expression = "name.family"
* test[=].action.assert.sourceId = "testPatient"
* test[=].action.assert.warningOnly = false

Instance: subtest-to-execute-example
InstanceOf: TestScriptEngineScript
Description: "TestScript instance executed as a subtest"
Usage: #example
* url = "https://github.com/fhir-crucible/testscript-generator/SubtestToExecuteExample"
* version = "0.1"
* name = "SubtestToExecuteExample"
* title = "Subtest to execute example"
* status = #draft
* experimental = true
* date = "2022-12-27T13:00:51-04:00"
* publisher = "The MITRE Corporation"
* contact.name = "Karl Naden"
* variable.name = "checkValue"
* variable.defaultValue = "example"
* variable.description = "value that will be compared"
* fixture.id = "notUsed"
* fixture.autocreate = false
* fixture.autodelete = false
* fixture.resource = Reference(Patient/patient-fixture)
* test.name = "string compare"
* test.action.assert.description = "compare received value"
* test.action.assert.label = "compare_receiver_value"
* test.action.assert.warningOnly = false
* test.action.assert.expression = "'Chalmers'"
* test.action.assert.value = "${checkValue}"
* test.action.assert.sourceId = "notUsed"

Instance: subtest-executed-each-fail
InstanceOf: TestScriptEngineReport
Description: "Failing TestReport instance with bound value from a subtest-each execution"
Usage: #example
* extension.extension[0].url = "variableName"
* extension.extension[=].valueString = "checkValue"
* extension.extension[+].url = "value"
* extension.extension[=].valueString = "Windsor"
* extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/dynamic-input"
* name = "TestReport for SubtestToExecuteExample"
* status = #completed
* testScript = Reference(https://github.com/fhir-crucible/testscript-generator/SubtestToExecuteExample) "SubtestToExecuteExample"
* testScript.type = "TestScript"
* result = #fail
* score = 0
* tester = "The MITRE Corporation"
* issued = "2022-12-28T17:14:30-05:00"
* test.action.assert.id = "compare_receiver_value"
* test.action.assert.result = #fail
* test.action.assert.message = "Expression: Expected Expression equals [\"Windsor\"], but found [\"Chalmers\"]."

Instance: subtest-executed-each-pass
InstanceOf: TestScriptEngineReport
Description: "Passing TestReport instance with bound value from a subtest-each execution"
Usage: #example
* extension.extension[0].url = "variableName"
* extension.extension[=].valueString = "checkValue"
* extension.extension[+].url = "value"
* extension.extension[=].valueString = "Chalmers"
* extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/dynamic-input"
* name = "TestReport for SubtestToExecuteExample"
* status = #completed
* testScript = Reference(https://github.com/fhir-crucible/testscript-generator/SubtestToExecuteExample) "SubtestToExecuteExample"
* testScript.type = "TestScript"
* result = #pass
* score = 100
* tester = "The MITRE Corporation"
* issued = "2022-12-28T17:14:30-05:00"
* test.action.assert.id = "compare_receiver_value"
* test.action.assert.result = #pass
* test.action.assert.message = "compare received value"

Instance: subtest-executed-direct-pass
InstanceOf: TestScriptEngineReport
Description: "Passing TestReport instance with bound value from a subtest execution"
Usage: #example
* extension.extension[0].url = "variableName"
* extension.extension[=].valueString = "checkValue"
* extension.extension[+].url = "value"
* extension.extension[=].valueString = "Chalmers"
* extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/dynamic-input"
* name = "TestReport for SubtestToExecuteExample"
* status = #completed
* testScript = Reference(https://github.com/fhir-crucible/testscript-generator/SubtestToExecuteExample) "SubtestToExecuteExample"
* testScript.type = "TestScript"
* result = #pass
* score = 100
* tester = "The MITRE Corporation"
* issued = "2022-12-28T17:14:30-05:00"
* test.action.assert.id = "compare_receiver_value"
* test.action.assert.result = #pass
* test.action.assert.message = "compare received value"

Instance: subtest-executing-pass
InstanceOf: TestReport
Description: "Passing TestReport instance with bound value from a direct execution"
Usage: #example
* extension.extension[0].url = "variableName"
* extension.extension[=].valueString = "directExecuteInput"
* extension.extension[+].url = "value"
* extension.extension[=].valueString = "Chalmers"
* extension.url = "https://fhir-crucible.github.io/testscript-engine-ig/StructureDefinition/dynamic-input"
* name = "TestReport for SubtestExecutionExample"
* status = #completed
* testScript = Reference(https://github.com/fhir-crucible/testscript-generator/SubtestExecutionExample) "SubtestExecutionExample"
* testScript.type = "TestScript"
* result = #pass
* score = 100
* tester = "The MITRE Corporation"
* issued = "2022-12-28T17:14:30-05:00"
* test[0].action.assert.id = "Directly_execute"
* test[=].action.assert.result = #pass
* test[=].action.assert.message = "Execute subtest directly"
* test[+].action.assert.id = "Execute_subtest_on_list_of_values"
* test[=].action.assert.result = #pass
* test[=].action.assert.message = "Execute_subtest_on_list_of_values"

Instance: patient-fixture
InstanceOf: Patient
Description: "Patient instance for use as fixture in TestScript"
Usage: #example
* name[0].use = #official
* name[=].family = "Chalmers"
* name[=].given[0] = "Peter"
* name[=].given[+] = "James"
* name[+].use = #usual
* name[=].given = "Jim"
* name[+].use = #maiden
* name[=].family = "Windsor"
* name[=].given[0] = "Peter"
* name[=].given[+] = "James"
* name[=].period.end = "2002"