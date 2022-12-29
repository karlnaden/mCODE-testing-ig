This IG documents the extensions and behaviors of the MITRE FHIR Foundry [TestScript Engine](https://github.com/fhir-crucible/testscript-engine) and [TestScript Generator](https://github.com/fhir-crucible/testscript-generator).

## Non-standard functionality

### TestScript Subtest Execution

The FHIR TestScript resource supports a linear and concrete execution mode, where operations and assertions are executed in the order in which they are defined and without any ability to change the execution path based on data received from the server under test. For example, after performing a search operation, TestScript provides no way to run further operations based on the returned entries, such as reading an instance from a reference element on each returned entry. FHIRPath in assertions provides some possible ways to interact with referenced instances, e.g., through the `resolve` function, but these are not consistently implemented and involve request context challenges as well. Other engines provide a way to attach external scripts to the TestScript execution through extensions, however this hampers interoperability and moves checks that could otherwise be handled by TestScript features to separate language. On the other hand, escape hatches to scripting language provide significant flexibility and keep the TestScript language itself simple.

The TestScript Engine takes the approach of providing targeted extensions to allow TestScript authors to react to anticipated differences across execution, while keeping tests specified using the TestScript language. It currently supports two extensions for subtest execution, both one for [direct execution](StructureDefinition-assert-subtest.html) and one supporting [multiple executions](StructureDefinition-assert-subtest-each.html) on each result of an FHIRPath expression (in the future, dynamic fixture binding may be supported as well).

### TestReport Variable Input Record

The value of some variables may be provided at execution time, either through user input or binding during subtest execution. To ensure that the TestReport instance contains all the information about the test execution, the TestScript Engine adds an [extension](StructureDefinition-dynamic-input.html) to TestReport instances for each dynamically provided input variable.