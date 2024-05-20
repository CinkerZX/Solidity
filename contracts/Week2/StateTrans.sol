pragma solidity ^0.4.0;

contract StateTrans{
    enum Stage {Init, Reg, Vote, Done} // define such new data type
    Stage public stage;
    uint startTime;
    uint public timeNow;

    // Constructor
    function StateTrans() public {
        stage = Stage.Init;
        startTime = now;
    }

    function advanceState() public{
        timeNow = now;
        if (timeNow > (startTime+10 seconds)){
            startTime = timeNow;
            if (stage == Stage.Init) {stage = Stage.Reg; return;}
            if (stage == Stage.Reg) {stage = Stage.Vote; return;}
            if (stage == Stage.Vote) {stage = Stage.Done; return;}
            return;
        }
    }
}