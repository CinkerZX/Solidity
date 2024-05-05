// SPDX-License-Identifier: MIT
// pragma solidity >=0.6.12 <0.9.0;
pragma solidity ^0.4.0;

contract Greeter {
  /**
   * @dev Define variable greeting of the type string
   */
  string public yourName;

  function Greeter() public {
    yourName = "World";
  }

  function set(string name) public{
    yourName = name;
  }

  function hello() public returns (string){
    return yourName;
  }
}
