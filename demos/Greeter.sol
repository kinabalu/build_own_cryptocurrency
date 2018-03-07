pragma solidity ^0.4.11;


contract Greeter {

    /* Define variable owner of the type address */
    address owner;

    /* Define variable greeting of the type string */
    string greeting;

    /* A modifier acts as a filter on other functions */
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    /* Constructor sets the owner of the contract and stores a greeting string given on deployment*/
    function Greeter(string _greeting) public {
        owner = msg.sender;
        greeting = _greeting;
    }

    /* Main function */
    function greet() public constant returns (string) {
        return greeting;
    }

    /* This function allows the owner to set a new greeting string */
    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }

    /* This function destroys the contract instance and returns its funds to the owner. Notice how the modifier acts a sort of access control on this function */
    function kill() public onlyOwner {
        selfdestruct(owner);
    }

}
