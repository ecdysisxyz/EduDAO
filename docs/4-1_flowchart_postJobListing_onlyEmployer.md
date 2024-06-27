```mermaid
flowchart TD
    A[Start] --> B[Check Job Description]
    B --> C[Check Proposed Salary]
    C --> D[Check Escrow Amount]
    D --> E{Valid Inputs and Not Banned?}
    E -->|Yes| F[Post Job Listing]
    F --> G[Change State to Reviewing Learners]
    G --> H[Emit JobPosted Event]
    H --> I[End]
    E -->|No| J[Revert Transaction]
    J --> I
