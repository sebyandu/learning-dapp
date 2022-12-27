// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

/**
 * @title MySavings
 * @dev Deposit savings
 */
contract MySavings {
    mapping(address => uint256) public balance;

    constructor() {}

    /**
     * @dev Deposit the value,
     * @param amount -> amount to store for the current sender
     */
    function deposit(uint256 amount) external payable {
        balance[msg.sender] += amount;
    }

    /**
     *@dev Get the sender balance
     */
    function checkBalance() external view returns (uint256) {
        return balance[msg.sender];
    }
}
