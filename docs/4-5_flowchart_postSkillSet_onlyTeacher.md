```mermaid
flowchart TD
    A[Start] --> B[Check Skill Description]
    B --> C[Check Hourly Rate]
    C --> D{Valid Inputs and Not Banned?}
    D -->|Yes| E[Post Skill Set]
    E --> F[Emit SkillSetPosted Event]
    F --> G[End]
    D -->|No| H[Revert Transaction]
    H --> G
