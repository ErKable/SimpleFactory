//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Vehicle {
    uint256 public wheel;
    string public color;


    constructor(uint _wheel, string memory _color) {
        wheel = _wheel;
        color = _color;
    }


}