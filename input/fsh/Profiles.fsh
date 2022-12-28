
Profile:        TestScriptEngineScript
Parent:         TestScript
Id:             testscript-engine-testscript
Title:          "TestScript Engine TestScript"
Description:    "TestScript with extensions specific to the MITRE FHIR Foundry testscript-engine and testscript-generator"
* setup.action.assert.extension contains 
	assert-subtest named AssertSubtest 0..1 and
    assert-subtest-each named AssertSubtestEach 0..1

Profile:        TestScriptEngineReport
Parent:         TestReport
Id:             testscript-engine-testreport
Title:          "TestScript Engine TestReport"
Description:    "TestReport with extensions specific to the MITRE FHIR Foundry testscript-engine and testscript-generator"
* extension contains dynamic-input named DynamicInput 0..*