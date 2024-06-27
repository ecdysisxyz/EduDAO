```mermaid
flowchart TD
    A[Start] --> B[Check Learner ID]
    B --> C{Valid Learner and Not Banned?}
    C -->|Yes| D[Update Sponsor Flag]
    D --> E[Emit SponsorshipConfirmed Event]
    E --> F[End]
    C -->|No| G[Revert Transaction]
    G --> F
