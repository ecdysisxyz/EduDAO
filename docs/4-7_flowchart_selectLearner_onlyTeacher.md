```mermaid
flowchart TD
    A[Start] --> B[Check Learner ID]
    B --> C{Valid Learner and Not Banned?}
    C -->|Yes| D[Select Learner]
    D --> E[Emit LearnerSelected Event]
    E --> F[End]
    C -->|No| G[Revert Transaction]
    G --> F
