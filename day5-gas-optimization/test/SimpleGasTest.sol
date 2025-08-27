// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Store.sol";

contract SimpleStoreGasTest is Test {
    SimpleStore public store;
    address public owner = address(0x1);
    address public user1 = address(0x2);
    address public user2 = address(0x3);

    function setUp() public {
        vm.prank(owner);
        store = new SimpleStore();

        // Give users some ETH
        vm.deal(user1, 10 ether);
        vm.deal(user2, 10 ether);
    }

    // 🔥 BASIC GAS TEST: Measure single operation
    function test_gas_addItem() public {
        vm.prank(owner);

        uint256 gasBefore = gasleft();      // Get gas remaining before operation
        store.addItem("Apple", 1 ether, 100);
        uint256 gasUsed = gasBefore - gasleft();  // Calculate gas consumed

        console.log("Gas used for addItem:", gasUsed);
    }

    // 🔥 COMPARATIVE GAS TEST: Multiple operations
    // This shows how gas costs can vary between similar operations
    function test_gas_multiplePurchases() public {
        // Setup
        vm.prank(owner);
        store.addItem("Apple", 1 ether, 100);

        // Test first purchase - often most expensive due to storage initialization
        vm.prank(user1);
        uint256 gasBefore = gasleft();
        store.purchaseItem{value: 1 ether}(0, 1);
        uint256 firstPurchaseGas = gasBefore - gasleft();

        // Test second purchase - usually cheaper because storage slots are already "warm"
        vm.prank(user2);
        gasBefore = gasleft();
        store.purchaseItem{value: 1 ether}(0, 1);
        uint256 secondPurchaseGas = gasBefore - gasleft();

        console.log("First purchase gas:", firstPurchaseGas);
        console.log("Second purchase gas:", secondPurchaseGas);
        console.log("Difference:", int256(firstPurchaseGas) - int256(secondPurchaseGas));

        // The first purchase is typically more expensive because:
        // 1. First time writing to storage costs more (cold storage)
        // 2. Initializing new storage slots costs ~20,000 gas each
        // 3. Subsequent writes to same slots cost only ~5,000 gas
    }
}