// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract AddLiquidity {
    function addLiquidity(uint256 amountA, uint256 amountB) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        // Add liquidity logic would be here

        emit LiquidityAdded(msg.sender, amountA, amountB);
    }

    event LiquidityAdded(address indexed user, uint256 amountA, uint256 amountB);
}
