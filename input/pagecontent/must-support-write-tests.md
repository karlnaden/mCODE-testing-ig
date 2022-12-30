When data is written to a FHIR server, the FHIR specification provides relatively minimal guarantees about what a subsequent read of the written resource will look like. FHIR servers are allowed to change the data as needed to fit their system requirements. In practice, changes to the data written may indicate an issue with or gaps in the implementation.

The must support write tests aim to help identify potential issues by focusing on `MustSupport` elements and testing whether data written into these fields are preserved when writing. Cases where data changes can be flagged for further review.

### Status

These tests have not been created yet. Feedback on whether these tests would be useful are welcome. Getting the right balance around what differences to flag will be tricky.