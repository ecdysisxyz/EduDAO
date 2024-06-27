```mermaid
flowchart TD
    A[Start] --> B[Check User ID]
    B --> C{Valid User?}
    C -->|Yes| D[Check Staked Token Amount]
    D --> E{Valid Staked Amount?}
    E -->|Yes| F[Check Stake Duration]
    F --> G{Stake Duration >= 2 weeks?}
    G -->|Yes| H[Transfer Tokens to User]
    H --> I[Emit TokensUnstaked Event]
    I --> J[End]
    G -->|No| K[Revert Transaction]
    K --> J
    E -->|No| L[Revert Transaction]
    L --> J
    C -->|No| M[Revert Transaction]
    M --> J
