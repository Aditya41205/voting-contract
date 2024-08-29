// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract voting{

bool public isvoting;

    struct Vote{
     address reciever;
     uint256 timestamp;
    }
    mapping (address=>Vote) public vote;

    /*events*/
    event AddVote(address indexed  voter,address reciever,uint256 timestamp);
    event Removevote(address voter);
    event startvoting(address startedby);
    event stopvoting(address stoppedby);

    constructor(){
        isvoting=false;
    }

    function StartVoting() external returns(bool){
        isvoting=true;
        emit startvoting(msg.sender);
        return true;
    }

    function Stopvoting()external returns (bool){
        isvoting=false;
        emit startvoting(msg.sender);
        return true;
    }

    function addvote(address reciever) external returns(bool){
        vote[msg.sender].reciever=reciever;
        vote[msg.sender].timestamp=block.timestamp;
        emit AddVote(msg.sender, vote[msg.sender].reciever,  vote[msg.sender].timestamp);
        return true;

    }


    function removvoter() external returns(bool){
        delete vote[msg.sender];
        emit Removevote(msg.sender);
        return true;
    }

    function getvote(address voteraddress)external view returns(address candidate){
        return vote[voteraddress].reciever;
    }
}


