```mermaid
erDiagram
    USER {
        int userID PK
        string userName
        string userType
        string status
    }
    
    JOBLISTING {
        int jobID PK
        int employerID FK
        string jobDescription
        uint256 proposedSalary
        uint256 escrowAmount
    }

    SKILLSET {
        int skillID PK
        int teacherID FK
        string skillDescription
        uint256 hourlyRate
    }

    RESUME {
        int resumeID PK
        int learnerID FK
        string desiredSkills
        string projectIdeas
    }

    SPONSORFLAG {
        int flagID PK
        int employerID FK
        int learnerID FK
        string status
    }

    LEARNINGMATCH {
        int matchID PK
        int teacherID FK
        int learnerID FK
        uint256 learningHours
        uint256 timestamp
    }

    EMPLOYMENTMATCH {
        int employmentID PK
        int employerID FK
        int learnerID FK
        string status
    }

    GOVERNANCETOKEN {
        int tokenID PK
        int userID FK
        uint256 tokenAmount
        uint256 unclaimedAmount
    }

    STAKE {
        int stakeID PK
        int userID FK
        uint256 amount
        uint256 timestamp
        string status
    }

    TIMEFRAME {
        int timeframeID PK
        uint256 startTime
        uint256 endTime
        uint256 totalMintableAmount
        uint256 totalMintedAmount
    }

    SCORE {
        int scoreID PK
        int userID FK
        int timeframeID FK
        uint256 score
        uint256 share
    }

    USER ||--o{ JOBLISTING : "posts"
    USER ||--o{ SKILLSET : "offers"
    USER ||--|| RESUME : "has"
    USER ||--o{ SPONSORFLAG : "sets"
    USER ||--o{ LEARNINGMATCH : "participates in"
    USER ||--o{ EMPLOYMENTMATCH : "engages in"
    USER ||--o{ GOVERNANCETOKEN : "holds"
    USER ||--o{ STAKE : "makes"
    USER ||--o{ SCORE : "owns"
    JOBLISTING ||--|{ USER : "employer"
    SKILLSET ||--|{ USER : "teacher"
    RESUME ||--|{ USER : "learner"
    SPONSORFLAG ||--|{ USER : "employer"
    SPONSORFLAG ||--|{ USER : "learner"
    LEARNINGMATCH ||--|{ USER : "teacher"
    LEARNINGMATCH ||--|{ USER : "learner"
    EMPLOYMENTMATCH ||--|{ USER : "employer"
    EMPLOYMENTMATCH ||--|{ USER : "learner"
    GOVERNANCETOKEN ||--|{ USER : "holder"
    STAKE ||--|{ USER : "staker"
    TIMEFRAME ||--o{ SCORE : "contains"
