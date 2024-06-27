// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./Schema.sol";

contract Storage {
    uint256 private constant STORAGE_SLOT = uint256(keccak256("schema.globalstate"));

    function state() internal pure returns (Schema.GlobalState storage s) {
        uint256 slot = STORAGE_SLOT;
        assembly {
            s.slot := slot
        }
    }
}
