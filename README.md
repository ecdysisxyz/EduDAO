## EduDAO

This repository contains the smart contracts and components for EduDAO, a decentralized education and employment platform on Ethereum. EduDAO connects employers, learners, and teachers, facilitating job postings, skill matching, learning sponsorships, and governance through a token-based system.

### Overview

EduDAO aims to streamline the process of job hunting, skill development, and learning sponsorships in a decentralized manner. The platform enables users to post job listings, submit resumes, propose and sponsor learning opportunities, and govern the ecosystem through token-based voting mechanisms.

### Features

#### Job Postings
- Employers can post job listings with proposed salaries and required skill sets.

#### Skill Matching
- Teachers can list their skill sets and hourly rates.
- Learners can submit resumes and desired skills for matching.

#### Learning Sponsorships
- Employers can sponsor learners by flagging them for potential employment.

#### Governance
- Users with governance tokens can vote on various proposals, including freezing or unfreezing users based on behavior and performance.

#### Token Economics
- Governance tokens are used for voting and staking.
- Tokens can be earned through participation in the platform and successful completion of learning or job assignments.

### User Roles

#### Employers
- **Functionality:** Post job listings, sponsor learners, and report employment matches.
- **Governance:** Can participate in voting to freeze or unfreeze users.

#### Teachers
- **Functionality:** Post skill sets and hourly rates, report learning hours, and select learners for training.
- **Governance:** Can participate in governance activities if they hold governance tokens.

#### Learners
- **Functionality:** Submit resumes, propose learning goals, and report learning matches.
- **Governance:** Eligible to vote if they hold governance tokens.

#### Administrators
- **Functionality:** Oversee the platform, issue and distribute governance tokens, and handle governance proposals.
- **Governance:** Facilitate and manage the overall governance process.

### Contracts

#### Main Bundle

##### Initializer.sol
- **Purpose:** Initializes the protocol with essential parameters like token name, symbol, and decimals.
- **Setup:** Configures the fee rate, collateral token, minimum collateralization ratio, and integrates the PriceConsumer for fetching the latest price.

##### PostJobListing.sol
- **Purpose:** Allows employers to post job listings with job descriptions, proposed salaries, and escrow amounts.

##### PostSkillSet.sol
- **Purpose:** Enables teachers to list their skills and hourly rates.

##### SubmitResume.sol
- **Purpose:** Allows learners to submit resumes and desired skills.

##### SponsorLearner.sol
- **Purpose:** Employers can flag and sponsor learners they are interested in hiring.

##### ReportLearningHours.sol
- **Purpose:** Teachers report the hours they have taught a learner.

##### ReportEmploymentMatch.sol
- **Purpose:** Employers and learners report successful employment matches.

##### AllocateScore.sol
- **Purpose:** Allocates scores to users based on their participation and performance.

#### Governance Token Bundle

##### GovernanceToken.sol
- **Purpose:** Implements the governance token that can be staked to gain voting power.

##### Stake.sol
- **Purpose:** Allows users to stake their governance tokens for a period of 4 years to gain voting power.

##### Initializer.sol
- **Purpose:** Initializes the governance token with the name, symbol, and decimals.

### Storage

#### Schema.sol (Main Bundle)
- **Purpose:** Defines data structures used by the main protocol, including user data, job listings, skill sets, resumes, and matches.

#### Storage.sol (Main Bundle)
- **Purpose:** Provides storage access for the main protocol's state.

#### Schema.sol (Governance Bundle)
- **Purpose:** Defines data structures used by the governance protocol, including balances, allowances, staked balances, and votes.

#### Storage.sol (Governance Bundle)
- **Purpose:** Provides storage access for the governance protocol's state.

### Architecture
The protocol is built using a modular architecture, where each functionality is encapsulated in a separate contract. This approach allows for easier maintenance and upgrades.

### Diagrams

For a detailed overview of the protocol's structure and flow, refer to the UML diagrams in the `docs` directory.

---

### Getting Started

1. **Install Foundry:** Ensure you have [Foundry](https://github.com/foundry-rs/foundry) installed.
2. **Initialize Project:** Initialize your project with:
    ```sh
    $ forge init <Your Project Name> -t metacontract/template
    ```
3. **Deploy Contracts:** Use the deployment scripts provided to deploy the contracts on your preferred Ethereum network.

### Contributing

Contributions are welcome! Please follow the guidelines in the `CONTRIBUTING.md` file.

### License

This project is licensed under the MIT License. See the `LICENSE` file for details.
