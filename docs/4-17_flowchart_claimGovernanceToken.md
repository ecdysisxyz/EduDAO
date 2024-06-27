```mermaid
flowchart TD
    A[Start] --> B[Claim All]
    B --> C{Check Banned?}
    C -->|Yes| G[Revert Transaction]
    C -->|No| D[Claim process]
    D --> E{Check unclaimed?}
    E -->|No| G[Revert Transaction]
    E -->|Yes| H[Withdraw minted governance token pool and set unclaimed zero.]
    H --> I[Emit TokensClaimed Event]
    I --> J[End]
    G --> J
