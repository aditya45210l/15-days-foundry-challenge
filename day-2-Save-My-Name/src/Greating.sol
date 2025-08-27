// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract Greating {
    string private great;

    function setGreet(string memory _greet) external {
        great = _greet;
    }

    function getGreet() public view returns (string memory) {
        return great;
    }
}
