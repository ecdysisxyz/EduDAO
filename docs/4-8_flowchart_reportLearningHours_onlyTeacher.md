```mermaid
flowchart TD
    A[Start] --> B[Check Teacher ID]
    B --> C[Check Learner ID]
    C --> D[Check Hours]
    D --> E{Valid Inputs and Not Banned?}
    E -->|Yes| F[Store Report Data]
    F --> G{Both Parties Submitted?}
    G -->|Yes| H[Compare Data]
    H --> I{Data Match?}
    I -->|Yes| J[Record Learning Hours]
    J --> K[Emit LearningHoursReported Event]
    K --> L[End]
    I -->|No| M[Revert Transaction]
    M --> L
    G -->|No| L[Wait for Other Party]
    E -->|No| N[Revert Transaction]
    N --> L
