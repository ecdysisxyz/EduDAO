// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../storage/Storage.sol";
import "../storage/Schema.sol";

contract Swap {
    function swap(address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut) external {
        Schema.GlobalState storage s = Storage.state();
        require(!s.banned[msg.sender], "User is banned");

        // Swap logic using an AMM would be here

        emit TokensSwapped(msg.sender, tokenIn, tokenOut, amountIn, minAmountOut);
    }

    event Swapped(address indexed user, address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut);
}
