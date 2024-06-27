```mermaid
flowchart TD
    A[Start] --> B[Check Token Amounts]
    B --> C[Check Token Types (Governance/Native)]
    C --> D{Valid Token Amounts and Not Banned?}
    D -->|Yes| E[Add Liquidity to AMM]
    E --> F[Emit LiquidityAdded Event]
    F --> G[End]
    D -->|No| H[Revert Transaction]
    H --> G
