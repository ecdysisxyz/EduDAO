// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract PostSkillSet {
    function postSkillSet(
        string memory skillDescription,
        uint256 hourlyRate
    ) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        uint256 skillID = s.nextSkillSetID++;
        Schema.SkillSet storage skillSet = s.skillSets[skillID];
        skillSet.skillID = skillID;
        skillSet.teacherID = msg.sender;
        skillSet.skillDescription = skillDescription;
        skillSet.hourlyRate = hourlyRate;
    }
}
