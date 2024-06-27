```mermaid
flowchart TD
    A[Start] --> B[Check Match ID]
    B --> C[Check Result]
    C --> D{Valid Inputs?}
    D -->|Yes| E[Report Results]
    E --> F[Emit InvestigationReported Event]
    F --> G[End]
    D -->|No| H[Revert Transaction]
    H --> G
