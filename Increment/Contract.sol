pragma solidity ^0.6.2;

contract Contract {
    uint public x;
    constructor(uint _x) public {
        x = _x;
    }
    function increment() external {
    x += 1;
    }
}
