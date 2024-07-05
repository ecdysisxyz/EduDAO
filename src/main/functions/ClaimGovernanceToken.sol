// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Storage } from "../storage/Storage.sol";
import { Schema } from  "../storage/Schema.sol";
import { CalculateTimeframe } from "./CalculateTimeframe.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ClaimGovernanceToken {
    function claimGovernanceToken() external {
        Schema.GlobalState storage $s = Storage.state();
        require(!$s.banned[msg.sender], "User is banned");

        uint256 timeframeID = CalculateTimeframe(address(this)).calculateTimeframe();
        Schema.Timeframe storage timeframe = $s.timeframes[timeframeID];
        Schema.Score storage userScore = $s.scores[timeframeID][msg.sender];

        require(userScore.score > 0, "No score in this timeframe");
        require(block.timestamp > timeframe.endTime, "Timeframe not yet ended");

        uint256 mintableAmount = (timeframe.totalMintableAmount * userScore.share) / 1e18; // Assuming share is scaled by 1e18
        require(mintableAmount > 0, "No tokens to claim");

        timeframe.totalMintedAmount += mintableAmount;
        require(timeframe.totalMintedAmount <= timeframe.totalMintableAmount, "Exceeds mintable amount");

        userScore.score = 0;
        userScore.share = 0;

        IERC20 governanceToken = IERC20($s.governanceTokenAddr);
        governanceToken.mint(msg.sender, mintableAmount);

        emit TokensClaimed(msg.sender, mintableAmount);
    }

    event TokensClaimed(address indexed user, uint256 amount);
}
