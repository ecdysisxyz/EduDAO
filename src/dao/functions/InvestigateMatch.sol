// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract InvestigateMatch {
    function investigateMatch(uint256 matchID, bool isMalicious) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        // Check if match is within 2 months
        Schema.LearningMatch storage learningMatch = s.learningMatches[matchID];
        require(block.timestamp <= learningMatch.timestamp + 2 months, "Investigation period has passed");

        if (isMalicious) {
            s.banned[learningMatch.teacherID] = true;
            s.banned[learningMatch.learnerID] = true;
        }

        emit InvestigationReported(msg.sender, matchID, isMalicious);
    }

    event InvestigationReported(address indexed user, uint256 matchID, bool isMalicious);
}
