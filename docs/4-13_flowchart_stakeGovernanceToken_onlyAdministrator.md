```mermaid
flowchart TD
    A[Start] --> B[Check Token Amount]
    B --> C{Valid Token Amount?}
    C -->|Yes| D[Check User ID]
    D --> E{Valid User?}
    E -->|Yes| F[Stake Tokens]
    F --> G[Record Timestamp]
    G --> H[Emit TokensStaked Event]
    H --> I[End]
    E -->|No| J[Revert Transaction]
    J --> I
    C -->|No| J
