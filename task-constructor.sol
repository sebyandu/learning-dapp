// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    address private immutable owner;
    uint256 private FEE;

    constructor(uint256 _fee) {
        owner = msg.sender;
        FEE = _fee;
    }
}

contract B is A {
    address private immutable owner;

    constructor() A(20) {
        owner = msg.sender;
    }
}
