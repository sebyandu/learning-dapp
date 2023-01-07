// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;
struct User {
    string name;
    uint256 age;
}
error AmountTooSmall();

/**
 * @title MySavings
 * @dev Deposit savings
 */
contract MySavings {
    address public owner;

    mapping(address => uint256) public balance;
    mapping(address => User) public userInfo;
    uint256 private constant _fee = 10; // missing fee value specification

    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Modifier to check that the caller is the owner of the contract.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    /**
     * @dev Check that the caller used previously the deposit functionality(with strictly positiv amounts).
     */
    modifier hasDeposit() {
        require(checkBalance() > 0, "Balance is 0");
        _;
    }
    /**
     * @dev Check that the amount covers the fees at least.
     * @param _amount ->value to compare with the fee
     */
    modifier greaterThanFee(uint256 _amount) {
        // more efficient alternative for
        // require(_amount > _fee, "AmountTooSmall");
        if (_amount < _fee) revert AmountTooSmall();
        _;
    }

    /**
     * @dev Deposit the value,
     * @param amount -> amount to store for the current sender
     */
    function deposit(uint256 amount) public payable {
        balance[msg.sender] += amount;
        emit FundsDeposited(msg.sender, amount);
    }

    /**
     *@dev Get the sender balance
     */
    function checkBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    /**
     * @dev set KYC for User(caller)
     * @param name -> name of the curent user
     * @param age -> age of the curent user
     */
    function setUserDetails(string calldata name, uint256 age) external {
        userInfo[msg.sender] = User(name, age);
        emit ProfileUpdated(msg.sender);
    }

    /**
     *@dev get KYC infos for User(caller)
     */
    function getUserDetail() external view returns (User memory) {
        return userInfo[msg.sender];
    }

    /**
     *@dev Withdraw the funds(owner)
     */
    function withdraw() external onlyOwner {}

    /**
     * @dev Existing users can add ne funds,
     * @param _amount -> amount to deposit for the current sender
     */
    function addFund(uint256 _amount)
        external
        hasDeposit
        greaterThanFee(_amount)
    {
        deposit(_amount);
    }
}
