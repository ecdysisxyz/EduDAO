```mermaid
flowchart TD
    A[Start] --> B[Check Teacher ID]
    B --> C{Valid Teacher?}
    C -->|Yes| D[Check Learner ID]
    D --> E{Valid Learner?}
    E -->|Yes| F[Check Learning Hours]
    F --> G{Valid Hours?}
    G -->|Yes| H[Store Report Data]
    H --> I{Both Parties Submitted?}
    I -->|Yes| J[Compare Data]
    J --> K{Data Match?}
    K -->|Yes| L[Allocate Score]
    L --> M[Emit LearningHoursReported Event]
    M --> N[End]
    K -->|No| O[Revert Transaction]
    O --> N
    I -->|No| N[Wait for Other Party]
    G -->|No| P[Revert Transaction]
    P --> N
    E -->|No| P
    C -->|No| P
