// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;
import {SimpleDeposite} from '../src/SimpleDeposit.sol';

contract TestSimpleDeposite{
    SimpleDeposite simpleDeposite;
    function setUp() public {
        simpleDeposite = new SimpleDeposite();
    }

    function testDepositeAmount() public {
        simpleDeposite.deposit(100);
        uint256 depositeAmount = simpleDeposite.amount();

        assert(depositeAmount == 100);

        
    }
}