```mermaid
flowchart TD
    A[Start] --> B[Check Teacher ID]
    B --> C{Valid Teacher and Not Banned?}
    C -->|Yes| D[Retrieve Sponsored Learners List]
    D --> E[Emit LearnersViewed Event]
    E --> F[End]
    C -->|No| G[Revert Transaction]
    G --> F
