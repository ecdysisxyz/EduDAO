```mermaid
flowchart TD
    A[Start] --> B[Check Learner ID]
    B --> C{Valid Learner and Not Banned?}
    C -->|Yes| D[Record Employment Match]
    D --> E[Change State to Employment Confirmed]
    E --> F[Emit EmploymentMatch Event]
    F --> G[End]
    C -->|No| H[Revert Transaction]
    H --> G
