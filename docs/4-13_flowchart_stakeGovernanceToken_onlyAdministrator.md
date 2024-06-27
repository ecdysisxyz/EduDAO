```mermaid
flowchart TD
    A[Start] --> B[Check Token Amount]
    B --> C{Valid Token Amount?}
    C -->|Yes| D[Check Allowance]
    D --> E{Sufficient Allowance?}
    E -->|Yes| F[Transfer Tokens to Contract]
    F --> G[Memorize Staked Amount]
    G --> H[Emit TokensStaked Event]
    H --> I[End]
    E -->|No| J[Revert Transaction]
    J --> I
    C -->|No| J
