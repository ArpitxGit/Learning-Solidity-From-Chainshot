An escrow is an agreement often used when transferring funds in exchange for a good or service. Funds can be held in escrow and a third party can be chosen to "arbitrate" or approve the transfer when the service or good is provided.

# 1 :-> State Variable

We'll have three parties involved in the Escrow:

## Depositor 
- The payer of the Escrow, makes the initial deposit that will eventually go to the beneficiary.
## Beneficiary 
- The receiver of the funds. They will provide some service or good to the depositor before the funds are transferred by the arbiter.
## Arbiter 
- The approver of the transaction. They alone can move the funds when the goods/services have been provided.

### @1 For this first stage, let's create these addresses as public state variables!

# 2 :-> Constructor

Each time that a depositor, arbiter and beneficiary come to an agreement upon Escrow terms, they can deploy a contract.

The depositor will be the signer deploying the contract. They will ask the arbiter and beneficiary for addresses that those two parties have access to. Then the depositor will provide those addresses as the arguments to the Escrow contract for storage.

### @2a Create a constructor which takes two arguments: an address for the arbiter and an address for the beneficiary (in that order). 
### @2b Store these variables in the corresponding state variables.
### @2c The depositor is the address deploying the contract, so take this address and store it in the depositor state variable.

# 3 :-> Funding

It's time to fund the contract!

The depositor will send some ether to the contract, which will be used to pay the beneficiary after the transfer is approved by the arbiter.

### @3 Modify the constructor function to make it payable.

# 4 :-> Approval

After the contract has been deployed with the appropriate amount of funds, the beneficiary will provide the good or service. They are now secure in knowing that the money is on its way! 

Once the good or service is provided, the arbiter needs a way to approve the transfer of the deposit over to the beneficiary's account. 

Let's add this mechanism to our contract!

### @4a Create an external function called approve.
### @4b This function should move the contract's balance to the beneficiary's address.
### @4c Create a boolean public state variable called isApproved which is initially set to false, then changed to true after the contract has been approved.

# 5 :-> Security

## Lock It Down

There's only one address that should be able to call the approve method: the arbiter. 

This is their role in the escrow transaction, to decide when the funds can be transferred.

### @5 If anyone tries to call approve other than the arbiter address, revert the transaction.

# 6 :-> Events

When the Escrow is approved, the User Interface will want to show some indication.

Let's create an event so it is easy for the interface to subscribe to such an occurrence.

### @6a Create an event called Approved which takes a single uint parameter: the balance that is sent to the beneficiary.
### @6b Emit this event from within the approve function.
