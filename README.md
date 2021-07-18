# Learning-Solidity-From-Chainshot

## General Structure:-

In OnOffSwitch.sol, we are declaring isOn as a member variable of the OnOffSwitch contract. In Solidity these variables are generally referred to as *state variables*.

Just like in JavaScript classes, the constructor is *run only once*. For contracts, the constructor is run *when it is deployed*. The isOn state variable will be set to true on the deployment of this contract.

The isOn variable is accessible anywhere in this contract by name. Unlike JavaScript class variables, there is no need to use this. inside of the contract itself to gain access to the state variables.

# the *this* keyword is still used in Solidity as a reference to the *contract account*.

Since *state variables* are referred to by name, constructor arguments using underscores to disambiguate is oftenly used.

It's important to recognize that when we make a change to a state variable on a deployed smart contract, we are *modifying permanent storage* on the blockchain.

Local variables defined inside of a code block {} or passed in as arguments live in memory only for the length of their particular scope.

## Control Structures:-

Solidity also has the *return* statement for passing back values from a function. One difference in Solidity is that multiple values can be returned from a Solidity function as a *tuple*:

</>function getValues() public pure returns (int, bool) {
    return (49, true);
}</>

The following statement is perfectly valid in Solidity. Similarly, tuples can be used to destructure assignments similar to destructuring in JavaScript.

#  a tuple simply as a group of values in parenthesis. They are not a formal structure in Solidity so they are primarily used for returning and destructuring as shown above.

Along with the *return* keyword, Solidity also has *if, else, while, do, for, break, and continue* with the same semantics as JavaScript.

## Visibility:-

*public, private, internal, external* keywords are called *visibility specifiers* because they determine from where functions can be accessed.

As you might expect, a *public* function is one that can be accessed from anywhere. A *private* function is one that cannot be. When a variable is declared *public*, a *getter* function is generated that will allow access to the variable state.

## static Typing:-

Solidity is a *statically typed language*, all variable *must declare their type*.
By default, boolean values are *false*.

# what if we tried storing a number in a *bool*? bool num = 10; //think..think..?
=> Ok So you will see *Solidity won't even compile with a statement like this*. 
The compiler will raise a *"TypeError: Type int_const 10 is not implicitly convertible to expected type bool."*

# an exception raised at compile time is called a *compile-time exception*:-

This means that the compiler was unable to generate *bytecode* from the program, so we would not even be able to *deploy this contract!*

# this is opposed to a *run-time exception*:-
Which would happen when someone tried to interact with a contract on the blockchain in some expected way. 
The exception would occur when a miner tries to validate the transaction. Unless the exception is caught, the transaction will fail and the miner will consume all the gas. 
