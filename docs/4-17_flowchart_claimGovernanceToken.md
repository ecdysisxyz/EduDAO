```mermaid
flowchart TD
    A[Start] --> B[Check User ID]
    B --> C{Valid User?}
    C -->|Yes| D[Get Current Timeframe]
    D --> E[Calculate Mintable Tokens]
    E --> F{Mintable Tokens > 0?}
    F -->|Yes| G[Update Minted Amount]
    G --> H[Reset User Score]
    H --> I[Mint Tokens to User]
    I --> J[Emit TokensClaimed Event]
    J --> K[End]
    F -->|No| L[Revert Transaction]
    L --> K
    C -->|No| M[Revert Transaction]
    M --> K
