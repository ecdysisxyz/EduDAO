```mermaid
flowchart TD
    A[Start] --> B[Check Employer ID]
    B --> C[Check Learner ID]
    C --> D[Check Employment Details]
    D --> E{Valid Inputs and Not Banned?}
    E -->|Yes| F[Store Report Data]
    F --> G{Both Parties Submitted?}
    G -->|Yes| H[Compare Data]
    H --> I{Data Match?}
    I -->|Yes| J[Record Employment Match]
    J --> K[Emit EmploymentMatchReported Event]
    K --> L[End]
    I -->|No| M[Revert Transaction]
    M --> L
    G -->|No| L[Wait for Other Party]
    E -->|No| N[Revert Transaction]
    N --> L
