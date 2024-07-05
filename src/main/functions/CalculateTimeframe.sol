// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Storage } from "../storage/Storage.sol";
import { Schema } from  "../storage/Schema.sol";

contract CalculateTimeframe {
    function calculateTimeframe() internal view returns (uint256) {
        Schema.GlobalState storage $s = Storage.state();
        return block.timestamp / $s.timeframeDurationInSec;
    }
}
