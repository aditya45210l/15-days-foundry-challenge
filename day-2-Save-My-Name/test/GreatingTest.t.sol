// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Greating} from "../src/Greating.sol";
import {DeployGreating} from "../script/DeployGreating.s.sol";

contract TestGreating is Test {
    Greating greating;

    function setUp() external {
        DeployGreating deployGreating = new DeployGreating();
        greating = deployGreating.run();
    }
}
