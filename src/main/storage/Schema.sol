// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

library Schema {
    /// @custom:storage-location erc7201:ecdysisxyz.edudao.globalstate
    struct GlobalState {
        uint256 nextJobListingID;
        uint256 nextSkillSetID;
        uint256 nextResumeID;
        uint256 nextSponsorFlagID;
        uint256 nextLearningMatchID;
        uint256 nextEmploymentMatchID;
        uint256 nextGovernanceTokenID;
        uint256 nextStakeID;
        uint256 nextTimeframeID;
        uint256 timeframeDurationInSec;
        address governanceTokenAddr;
        mapping(uint256 => JobListing) jobListings;
        mapping(uint256 => SkillSet) skillSets;
        mapping(uint256 => Resume) resumes;
        mapping(uint256 => SponsorFlag) sponsorFlags;
        mapping(uint256 => LearningMatch) learningMatches;
        mapping(uint256 => EmploymentMatch) employmentMatches;
        mapping(uint256 => GovernanceToken) governanceTokens;
        mapping(uint256 => Stake) stakes;
        mapping(uint256 => Timeframe) timeframes;
        mapping(uint256 => mapping(address => Score)) scores; // Mapping timeframes to user scores
        mapping(address => bool) banned;
    }

    struct JobListing {
        uint256 jobID;
        address employerID;
        string jobDescription;
        uint256 proposedSalary;
        uint256 escrowAmount;
    }

    struct SkillSet {
        uint256 skillID;
        address teacherID;
        string skillDescription;
        uint256 hourlyRate;
    }

    struct Resume {
        uint256 resumeID;
        address learnerID;
        string desiredSkills;
        string projectIdeas;
    }

    struct SponsorFlag {
        uint256 flagID;
        address employerID;
        address learnerID;
        string status;
    }

    struct LearningMatch {
        uint256 matchID;
        address teacherID;
        address learnerID;
        uint256 learningHours;
        uint256 timestamp;
    }

    struct EmploymentMatch {
        uint256 employmentID;
        address employerID;
        address learnerID;
        string status;
    }

    struct GovernanceToken {
        uint256 tokenID;
        address userID;
        uint256 tokenAmount;
        uint256 unclaimedAmount;
    }

    struct Stake {
        uint256 stakeID;
        address userID;
        uint256 amount;
        uint256 timestamp;
        string status;
    }

    struct Timeframe {
        uint256 timeframeID;
        uint256 startTime;
        uint256 endTime;
        uint256 totalMintableAmount;
        uint256 totalMintedAmount;
    }

    struct Score {
        uint256 scoreID;
        address userID;
        uint256 score;
        uint256 share;
    }
}
