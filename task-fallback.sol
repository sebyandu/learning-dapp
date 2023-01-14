// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

/**
 * @title SavingsPayableFallback
 * @dev Deposit savings
 * TO demonstrate fallback & receive, we'll make our deposit function internal and call it to acumulate from sender
 * Even if the TASK is about "create a fallback or receive payable function" I wanted to demonstrate the difference
 * of calling with/without CALLDATA by emitting the "Log" event in both special functions
 */
contract SavingsPayableFallback {
    event Log(
        string functionality,
        address indexed sender,
        uint256 val,
        bytes data
    );
    mapping(address => uint256) public balance;

    constructor() {}

    /**
     * @dev Deposit the value,
     * @param amount -> amount to store for the current sender
     */
    function deposit(uint256 amount) internal {
        balance[msg.sender] += amount;
    }

    /**
     *@dev Get the sender balance
     */
    function checkBalance() external view returns (uint256) {
        return balance[msg.sender];
    }

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
        deposit(msg.value);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
        deposit(msg.value);
    }
}
