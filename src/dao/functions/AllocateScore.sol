// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";
import "./CalculateTimeframe.sol";

contract AllocateScore {
    function allocateScore(uint256 score) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        uint256 timeframeID = CalculateTimeframe(address(this)).calculateTimeframe();
        Schema.Timeframe storage timeframe = s.timeframes[timeframeID];
        Schema.Score storage userScore = s.scores[timeframeID][msg.sender];

        require(block.timestamp >= timeframe.startTime && block.timestamp <= timeframe.endTime, "Outside of timeframe");

        userScore.score += score;
        userScore.share += (score * 1e18) / timeframe.totalMintableAmount;

        emit ScoreAllocated(msg.sender, timeframeID, score);
    }

    event ScoreAllocated(address indexed user, uint256 timeframeID, uint256 score);
}
