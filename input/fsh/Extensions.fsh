Extension: AssertSubtest
Description: "Execute a TestScript instance as a subtest"
Id: assert-subtest
* ^context.type = #element
* ^context.expression = "TestScript.setup.action.assert"
* value[x] 0..0
* extension contains 
    testName 1..1 and
    bindVariable 0..*
* extension[testName] ^short = "Name of the TestScript to execute"
* extension[testName].value[x] only string
* extension[bindVariable] ^short = "Binding of a source TestScript variable to a target TestScript variable"
* extension[bindVariable].value[x] 0..0
* extension[bindVariable].extension contains
    bindSource 1..1 and
    bindTarget 1..1
* extension[bindVariable].extension[bindSource] ^short = "Executing TestScript variable name that provides the value"
* extension[bindVariable].extension[bindSource].value[x] only string
* extension[bindVariable].extension[bindTarget] ^short = "Executed TestScript variable name that receives the value"
* extension[bindVariable].extension[bindTarget].value[x] only string

Extension: AssertSubtestEach
Description: "Execute a TestScript instance as a subtest for each of a set of inputs."
Id: assert-subtest-each
* ^context.type = #element
* ^context.expression = "TestScript.setup.action.assert"
* value[x] 0..0
* extension contains 
    testName 1..1 and
    bindEachTarget 1..1 and
    allMustPass 0..1 and
    bindVariable 0..*
* extension[testName] ^short = "Name of the TestScript to execute"
* extension[testName].value[x] only string
* extension[bindEachTarget] ^short = "Variable name in the executed test that the input value will be bound to"
* extension[bindEachTarget].value[x] only string
* extension[allMustPass] ^short = "Determines whether all runs of the executed subtest must pass for this assertion to succeed"
* extension[allMustPass].value[x] only boolean
* extension[bindVariable] ^short = "Binding of a source TestScript variable to a target TestScript variable"
* extension[bindVariable].value[x] 0..0
* extension[bindVariable].extension contains
    bindSource 1..1 and
    bindTarget 1..1
* extension[bindVariable].extension[bindSource] ^short = "Executing TestScript variable name that provides the value"
* extension[bindVariable].extension[bindSource].value[x] only string
* extension[bindVariable].extension[bindTarget] ^short = "Executed TestScript variable name that receives the value"
* extension[bindVariable].extension[bindTarget].value[x] only string

Extension: DynamicInput
Description: "Input bound to a TestScript variable at execution time."
Id: dynamic-input
* ^context.type = #element
* ^context.expression = "TestReport"
* value[x] 0..0
* extension contains 
	variableName 1..1 and
	value 1..1
* extension[variableName] ^short = "Name of the dynamically bound variable"
* extension[variableName].value[x] only string
* extension[value] ^short = "Dynamically bound value"
* extension[value].value[x] only string