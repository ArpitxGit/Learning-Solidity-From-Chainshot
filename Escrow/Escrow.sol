// SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

contract Escrow {
    //@1 Create three public state variables for the addresses of the depositor, beneficiary and arbiter.
    address public depositor;
    address payable public beneficiary;
    address public arbiter;

    //@4c1  Create a boolean public state variable called isApproved which is initially set to false.
    bool public isApproved;

    //@2a Create a constructor which takes two arguments: an address for the arbiter and an address for the beneficiary (in that order). 
    //@3 Modify the constructor function to make it payable.
    constructor(address _arbiter, address payable _beneficiary) public payable {
        //@2b Store these variables in the corresponding state variables.
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        //@2c The depositor is the address deploying the contract, so take this address and store it in the depositor state variable.
        depositor = msg.sender;
    }
    event Approved(uint);

    //@4a Create an external function called approve.
    function approve()  external {
        //@4b This function should move the contract's balance to the beneficiary's address.
        //@4b1 Decalring an uint balance that is the contract balance, so using "this" we are paasing the contract address.
        uint balance = address(this).balance;
        //@4b2 Moving the Contract balance to the beneficiary's address.
        beneficiary.transfer(balance);
        //@4c2 then changed to true after the contract has been approved.
        isApproved = true;
        //@5 If anyone tries to call approve other than the arbiter address, revert the transaction.
        require(msg.sender == arbiter);
        //@6b Emit this event from within the approve function.
        emit Approved(balance);
    }
}
