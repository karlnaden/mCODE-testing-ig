### Execution Semantics

This extension is used within a TestScript assert action. It tells the engine to determine whether the assertion passed based on whether the specified TestScript passes. It optionally includes variable bindings, tying the value of specific variables in the TestScript making the invocation to variables in the target TestScript. Once execution of the invoked TestScript completes, a TestReport instance is generated, and the engine continues with execution of the invoking TestScript.
