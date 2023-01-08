// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyToken
 * @dev My first ERC20 token launch (Uncapped Lazy Supply)
 */
contract MyToken is ERC20, Ownable {
    uint256 private constant scalar = 10**18; // needs to take care of the decimals => a big number to avoid decimals ex 1000000000000000000 represents 1 ETH

    constructor() ERC20("SebiTokent", "SBI") {}

    function issueToken() public onlyOwner {
        // to: address of the wallet/contract that will receive the tokens
        // amount: amount of tokens to send  ,
        // _mint(to,amount);
        _mint(msg.sender, 1000 * scalar);
    }
}
