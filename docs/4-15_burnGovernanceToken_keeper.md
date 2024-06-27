```mermaid
flowchart TD
    A[Start] --> B[Check Token Amount]
    B --> C{Valid Token Amount?}
    C -->|Yes| D[Burn Tokens]
    D --> E[Emit TokensBurned Event]
    E --> F[End]
    C -->|No| G[Revert Transaction]
    G --> F
