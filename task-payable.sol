// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

/**
 * @title SavingsPayable
 * @dev Deposit savings
 */
contract SavingsPayable {
    mapping(address => uint256) public balance;

    constructor() {}

    /**
     * @dev Deposit the value,
     */
    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    /**
     *@dev Get the sender balance
     */
    function checkBalance() external view returns (uint256) {
        return balance[msg.sender];
    }
}
