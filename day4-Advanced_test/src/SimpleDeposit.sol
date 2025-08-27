// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SimpleDeposite {
    uint256 public amount;
    error Insuffient_Balance(uint256 balance);

    function deposit(uint256 _amt) public returns (uint256){
        amount += _amt;
        return amount;
    }

    function withdraw(uint256 _amt) public returns(uint256) {
        if( _amt > amount) revert Insuffient_Balance(amount);
        amount -= _amt;
        return amount;
    }
}