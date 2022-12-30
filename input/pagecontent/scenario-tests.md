Standards seek to improve the reliability and reduce the cost of system interoperability. One way in which they do so is by providing a single set of data structures that different systems can all use to represent the same information. If a standard is to achieve its goal, then a critical property that different implementations represent the same information consistently within the language the standard. Imagine one provider evaluating a patient and documenting their findings within two different mCODE-enabled systems. In that situation, the FHIR representation made available by the two systems should closely coincide (certainly in terms of the clinical content, system metadata and specific timestamps will still differ). Achieving this property across all mCODE server would enable clients consuming data from these servers to handle all servers uniformly, greatly reducing the cost of interoperability with any of them (in contrast, if there are meaningful, but unknown differences, significant effort must be spent when connecting two systems to identify and handle the discrepancies). 

In practice, it will not be possible to guarantee that all mCODE server implementations represent all scenarios covered by mCODE in a highly consistent way. However, confirming this property for some scenarios would help to further clarify the intended encoding of information covered by the IG and establish a "fixed point" of consistency across implementations that would likely result in a higher degree of consistency and lower integration costs overall. 

Exploring the design space and challenges of these *scenario consistency tests* is the goal of this set of tests. At this time, they are still in the exploration phase, with
- an initial scenario to target
- a potential representation of that scneario in mCODE
- notional ideas about challenges of this sort of testing

Feedback welcome on all of these, in particular in the form of a mCODE representation of the scenario from an mCODE compliant system.

### Target Scenario

**Oncologist Adding Clinical Staging Information to Cancer Dx**
 
*mCODE IG description*: The patient is referred to an oncologist who clinically reviews the mammogram and tumor marker results, and clinically staged the [breast] cancer diagnosis as cT3N0 (from the mCODE [extended example](http://hl7.org/fhir/us/mcode/examples.html)).
 
*Detailed data description*
- Cancer Diagnosis details:
  - Problem list entry
  - For a Primary malignant neoplasm of female left breast
  - Verification: confirmed
  - Clinical Status: active
  - Histology Morphology Behavior: Adenocarcinoma, no subtype, intermediate grade 
  - Staging: IIB (based on TNM approach)
- Specific staging details (TNM)
  - Stage: IIB
  - Primary Tumor (T): cT3
  - Regional Lymph Nodes (N): cN0
  - Distant Metastases (M): cM0

### Potential Representation

Examples in this IG provide a potential representation:
- [Primary Diagnosis](Condition-scenario-clinicalDxAndStaging-primaryCondition.html)
- [TNM Staging Details](Observation-scenario-clinicalDxAndStaging-tnmStage.html)
  - [Primary Tumor (T)](Observation-scenario-clinicalDxAndStaging-tnmStage-tumor.html)
  - [Regional Lymph Nodes (N)](Observation-scenario-clinicalDxAndStaging-tnmStage-regionalLymphNodes.html)
  - [Distant Metastases (M)](Observation-scenario-clinicalDxAndStaging-tnmStage-distantMetastases.html)

### Challenges and Open Questions

Operationalizing this sort of testing will require overcoming several challenges, including
- Agreeing on a set of widely-relevant scenarios with a clear consistent representation: this testing pre-supposes that there is a set of scenarios that can be agreed-upon from the clinical perspective. The hope is that different possible scenarios and documentation approaches can be recognized while still identifying specific approaches on which the tests can help validate consistency across implementations.
- Data entry: For these tests to be valid, data must be entered into the system as expected from workflows. For the above scenario that would be entered by a clinician. This means that as a part of the test, this data entry will need to be performed (or potentially simulated), which is potentially costly. The hope is that by showing the value of this type of testing, systems will see the benefit in investing in tools to support it and make the process easier.
- Acceptable differences: the precise definition of "closely coincide" will be tricky. The goal is to help engender consistency, not inflexibility. We know that some aspects like temporality, system metadata, and specific instance ids should not be expected to be consistent or fixed. The hope is that experience with this kind of testing will help to clarify what checks are actually needed.
- Identifying the reason for discrepancies and fixing it: if a test run identifies a difference, is that due to a problem in the implementation, or simply a data entry problem? A process for determining the answer and resolving it in a way that preserves the semantics of the data will be needed. The hope is that defining the scenarios well will make it possible to distinguish. 