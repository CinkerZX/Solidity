// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Ballot{

    //struct, define a voter
    struct Voter{
        uint weight;
        bool voted; // one voter can vote only once
        uint8 vote; // vote for whom
    }

    struct Proposal{
        uint voteCount; // could add oter data about proposal
    }

    address chairperson;
    mapping (address => Voter) voters;
    Proposal[] proposals;

    // Constructor: Create a new ballot with n proposals, namely there are n candidates
    function Ballot(uint8 _numProposals) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 2; // the weight of chairperson is 2
        proposals.length = _numProposals;
    }

    // Initialize as a valid voter (not the chairperson and never voted before
    function register(address toVoter) public{
        if(msg.sender!= chairperson || voters[toVoter].voted) {return;}
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }

    // A sender vote for candidate 'toProposal'
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender]; // ???
        if (sender.voted || toProposal >= proposals.length) return; // if the sender voted before or vote for an invalid candidate, cannot vote
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }

    function winningProposal() public constant returns (uint _winningProposal){
        uint256 winningVoteCount = 0;
        for (uint8 prop = 0; prop < proposals.length; prop++) 
        {
            if (proposals[prop].voteCount > winningVoteCount){
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
        return _winningProposal;
    }

}