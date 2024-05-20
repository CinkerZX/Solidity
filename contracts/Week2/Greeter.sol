// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Greeter {
    /* Define variable greeting of the type string */
    string public yourName;

    /* This runs when the contract is executed */
    function Greeter() public {
        yourName = "World";
    }

    function set(string name) public {
        yourName = name;
    }

    function hello() constant public returns (string){
        return yourName;
    }
}