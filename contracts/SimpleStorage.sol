pragma solidity ^0.4.0;

contract SimpleStorage{
    uint storedData;

    function set(uint x) public{
        storedData = x;
    }

    function get() constant public returns(uint){
        return storedData;
    }

    function increament (uint n) public{
        storedData = storedData + n;
        return;
    }

    function decreatment (uint n) public{
        storedData = storedData - n;
        return;
    }
}