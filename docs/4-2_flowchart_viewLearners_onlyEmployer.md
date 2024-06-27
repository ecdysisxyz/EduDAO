```mermaid
flowchart TD
    A[Start] --> B[Check Employer ID]
    B --> C{Valid Employer and Not Banned?}
    C -->|Yes| D[Retrieve Learners List]
    D --> E[Emit LearnersViewed Event]
    E --> F[End]
    C -->|No| G[Revert Transaction]
    G --> F
