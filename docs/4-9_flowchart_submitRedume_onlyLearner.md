```mermaid
flowchart TD
    A[Start] --> B[Check Desired Skills]
    B --> C[Check Project Ideas]
    C --> D{Valid Inputs and Not Banned?}
    D -->|Yes| E[Submit Resume]
    E --> F[Emit ResumeSubmitted Event]
    F --> G[End]
    D -->|No| H[Revert Transaction]
    H --> G
