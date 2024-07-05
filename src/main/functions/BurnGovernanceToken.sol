// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Storage } from "../storage/Storage.sol";
import { Schema } from  "../storage/Schema.sol";

contract BurnGovernanceToken {
    function burnGovernanceToken(uint256 amount) external {
        Schema.GlobalState storage $s = Storage.state();
        require(!$s.banned[msg.sender], "User is banned");

        IERC20 governanceToken = IERC20($s.governanceTokenAddr);
        require(governanceToken.balanceOf(msg.sender) >= amount, "Insufficient tokens");

        governanceToken.burn(msg.sender, amount);

        emit TokensBurned(msg.sender, amount);
    }

    event TokensBurned(address indexed user, uint256 amount);
}
