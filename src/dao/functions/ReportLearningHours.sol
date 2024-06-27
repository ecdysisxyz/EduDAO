// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract ReportLearningHours {
    function reportLearningHours(
        address teacherID,
        address learnerID,
        uint256 learningHours
    ) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");
        require(!s.banned[teacherID], "Teacher is banned");
        require(!s.banned[learnerID], "Learner is banned");

        uint256 matchID = s.nextLearningMatchID++;
        Schema.LearningMatch storage learningMatch = s.learningMatches[matchID];
        learningMatch.matchID = matchID;
        learningMatch.teacherID = teacherID;
        learningMatch.learnerID = learnerID;
        learningMatch.learningHours = learningHours;
        learningMatch.timestamp = block.timestamp;

        emit LearningHoursReported(teacherID, learnerID, learningHours);
    }

    event LearningHoursReported(address indexed teacher, address indexed learner, uint256 learningHours);
}
