// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Storage } from "../storage/Storage.sol";
import { Schema } from  "../storage/Schema.sol";
import { AllocateScore } from "./AllocateScore.sol";

contract ReportEmploymentMatch {
    function reportEmploymentMatch(address employerID, address learnerID, string memory status, uint256 timeframeID) external {
        Schema.GlobalState storage $s = state();
        require(!$s.banned[msg.sender], "User is banned");
        require(!$s.banned[employerID], "Employer is banned");
        require(!$s.banned[learnerID], "Learner is banned");

        uint256 employmentID = $s.nextEmploymentMatchID++;
        Schema.EmploymentMatch storage employmentMatch = $s.employmentMatches[employmentID];
        employmentMatch.employmentID = employmentID;
        employmentMatch.employerID = employerID;
        employmentMatch.learnerID = learnerID;
        employmentMatch.status = status;

        AllocateScore(address(this)).allocateScore(timeframeID, 1); // Assuming 1 score for reporting an employment match

        emit EmploymentMatchReported(employerID, learnerID, status, timeframeID);
    }

    event EmploymentMatchReported(address employerID, address learnerID, string status, uint256 timeframeID);

    function state() internal pure returns (Schema.GlobalState storage s) {
        uint256 slot = uint
