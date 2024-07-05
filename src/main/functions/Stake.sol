// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Stake {
    function stake(uint256 amount) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        IERC20 governanceToken = IERC20(s.governanceTokenAddr);
        require(governanceToken.allowance(msg.sender, address(this)) >= amount, "Insufficient allowance");

        uint256 stakeID = s.nextStakeID++;
        Schema.Stake storage newStake = s.stakes[stakeID];
        newStake.stakeID = stakeID;
        newStake.userID = msg.sender;
        newStake.amount = amount;
        newStake.timestamp = block.timestamp;
        newStake.status = "Staked";

        require(governanceToken.transferFrom(msg.sender, address(this), amount), "Token transfer failed");

        emit TokensStaked(msg.sender, amount);
    }

    event TokensStaked(address indexed user, uint256 amount);
}
