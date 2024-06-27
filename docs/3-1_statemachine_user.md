```mermaid
stateDiagram-v2
    [*] --> Active
    Active --> Banned : Investigation finds malicious behavior
    Active --> Staked : stake()
    Staked --> Active : unstake()
    Banned --> [*]
