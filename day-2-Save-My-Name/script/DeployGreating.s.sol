// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {Greating} from "../src/Greating.sol";

contract DeployGreating is Script {
    Greating greating;

    function run() external returns(Greating){
        vm.startBroadcast();
        greating = new Greating();
        vm.stopBroadcast();
        return greating;
    }
}
