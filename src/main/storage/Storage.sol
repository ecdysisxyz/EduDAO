// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./Schema.sol";

contract Storage {
    // cast index-erc7201 ecdysisxyz.edudao.globalstate
    function state() internal pure returns (Schema.GlobalState storage s) {
        assembly {
            s.slot := 0x6ee13987fcce5855d43f7d1fd0c7be47753eb3e4b08fa7b2f789c44ffd3a2100
        }
    }
}
