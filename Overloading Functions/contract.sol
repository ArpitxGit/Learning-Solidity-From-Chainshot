pragma solidity ^0.6.2;

contract Contract {
    function double(uint d) external pure returns(uint){
        return 2*d;
    }
    function double(uint a, uint b) external pure returns(uint , uint){
        return (2*a, 2*b);
    }
}
