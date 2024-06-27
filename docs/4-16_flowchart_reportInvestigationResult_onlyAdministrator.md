```mermaid
flowchart TD
    A[Start] --> B[Input MatchID and Off-chain investigation result]
    B --> C{Is less than two month?}
    C -->|Yes| D[Check investigation result]
    C -->|No| H
    D --> E{Matching was malicious?}
    E -->|Yes| F[Flag teacher, learner, and employer Banned]
    E -->|No| H
    F --> G
    D -->|No| H[Revert Transaction]
    H --> G
