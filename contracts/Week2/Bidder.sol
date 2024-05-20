// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Bidder {
    string public name = "Buffale";
    uint public bidAmount;
    bool public eligible;
    uint constant minBid = 1000;

    function setName(string na) public{
        name = na;
    }

    function setBidAmount(uint x) public{
        bidAmount = x;
    }

    function determineEligibility() public{
        if (bidAmount >= minBid) eligible = true;
        else eligible =false;
    }

}