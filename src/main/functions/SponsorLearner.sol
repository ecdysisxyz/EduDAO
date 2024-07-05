// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Storage } from "../storage/Storage.sol";
import { Schema } from  "../storage/Schema.sol";

contract Stake {
    function stake(uint256 amount) external {
        Schema.GlobalState storage $s = Storage.state();
        require(!$s.banned[msg.sender], "User is banned");

        uint256 stakeID = $s.nextStakeID++;
        Schema.Stake storage newStake = $s.stakes[stakeID];
        newStake.stakeID = stakeID;
        newStake.userID = msg.sender;
        newStake.amount = amount;
        newStake.timestamp = block.timestamp;
        newStake.status = "Staked";

        emit TokensStaked(msg.sender, amount);
    }

    event TokensStaked(address indexed user, uint256 amount);
}
