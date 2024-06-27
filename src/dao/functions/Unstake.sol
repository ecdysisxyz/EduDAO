// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Unstake {
    function unstake(uint256 stakeID) external {
        Schema.GlobalState storage s = Storage.state();
        Schema.Stake storage userStake = s.stakes[stakeID];
        require(!s.banned[msg.sender], "User is banned");
        require(userStake.userID == msg.sender, "Not the staker");
        require(block.timestamp >= userStake.timestamp + 2 weeks, "Stake period not yet passed");

        uint256 amount = userStake.amount;
        userStake.status = "Unstaked";

        IERC20 governanceToken = IERC20(s.governanceTokenAddr);
        require(governanceToken.transfer(msg.sender, amount), "Token transfer failed");

        emit TokensUnstaked(msg.sender, amount);
    }

    event TokensUnstaked(address indexed user, uint256 amount);
}
