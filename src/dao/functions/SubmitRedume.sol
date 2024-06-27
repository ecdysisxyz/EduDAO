// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract SubmitResume {
    function submitResume(
        string memory desiredSkills,
        string memory projectIdeas
    ) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        uint256 resumeID = s.nextResumeID++;
        Schema.Resume storage resume = s.resumes[resumeID];
        resume.resumeID = resumeID;
        resume.learnerID = msg.sender;
        resume.desiredSkills = desiredSkills;
        resume.projectIdeas = projectIdeas;
    }
}
