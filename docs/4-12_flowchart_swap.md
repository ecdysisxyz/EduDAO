```mermaid
flowchart TD
    A[Start] --> B[Check Token Amount]
    B --> C[Check Token Type (Governance/Native)]
    C --> D{Valid Token Amount and Not Banned?}
    D -->|Yes| E[Perform Swap in AMM]
    E --> F[Emit TokensSwapped Event]
    F --> G[End]
    D -->|No| H[Revert Transaction]
    H --> G
