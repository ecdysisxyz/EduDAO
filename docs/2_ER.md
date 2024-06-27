```mermaid
erDiagram
    USER {
        int UserID PK
        string UserName
        string UserType
        string Status
    }
    
    JOBLISTING {
        int JobID PK
        int EmployerID FK
        string JobDescription
        float ProposedSalary
        float EscrowAmount
    }

    SKILLSET {
        int SkillID PK
        int TeacherID FK
        string SkillDescription
        float HourlyRate
    }

    RESUME {
        int ResumeID PK
        int LearnerID FK
        string DesiredSkills
        string ProjectIdeas
    }

    SPONSORFLAG {
        int FlagID PK
        int EmployerID FK
        int LearnerID FK
        string Status
    }

    LEARNINGMATCH {
        int MatchID PK
        int TeacherID FK
        int LearnerID FK
        float LearningHours
        datetime Timestamp
    }

    EMPLOYMENTMATCH {
        int EmploymentID PK
        int EmployerID FK
        int LearnerID FK
        string Status
    }

    GOVERNANCETOKEN {
        int TokenID PK
        int UserID FK
        float TokenAmount
        float UnclaimedAmount
    }

    STAKE {
        int StakeID PK
        int UserID FK
        float Amount
        datetime Timestamp
        string Status
    }

    USER ||--o{ JOBLISTING : "投稿する"
    USER ||--o{ SKILLSET : "提示する"
    USER ||--|| RESUME : "持つ"
    USER ||--o{ SPONSORFLAG : "立てる"
    USER ||--o{ LEARNINGMATCH : "教える/学ぶ"
    USER ||--o{ EMPLOYMENTMATCH : "雇う/雇われる"
    USER ||--o{ GOVERNANCETOKEN : "保有する"
    USER ||--o{ STAKE : "ステークする"
    JOBLISTING ||--|{ USER : "雇用主"
    SKILLSET ||--|{ USER : "教師"
    RESUME ||--|{ USER : "学習者"
    SPONSORFLAG ||--|{ USER : "雇用主"
    SPONSORFLAG ||--|{ USER : "学習者"
    LEARNINGMATCH ||--|{ USER : "教師"
    LEARNINGMATCH ||--|{ USER : "学習者"
    EMPLOYMENTMATCH ||--|{ USER : "雇用主"
    EMPLOYMENTMATCH ||--|{ USER : "学習者"
    GOVERNANCETOKEN ||--|{ USER : "保有者"
    STAKE ||--|{ USER : "ステーク者"
