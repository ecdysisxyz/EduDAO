// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract PostJobListing {
    function postJobListing(
        string memory jobDescription,
        uint256 proposedSalary,
        uint256 escrowAmount
    ) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        uint256 jobID = s.nextJobListingID++;
        Schema.JobListing storage jobListing = s.jobListings[jobID];
        jobListing.jobID = jobID;
        jobListing.employerID = msg.sender;
        jobListing.jobDescription = jobDescription;
        jobListing.proposedSalary = proposedSalary;
        jobListing.escrowAmount = escrowAmount;

        emit JobPosted(msg.sender, jobID);
    }

    event JobPosted(address indexed employer, uint256 jobID);
}
