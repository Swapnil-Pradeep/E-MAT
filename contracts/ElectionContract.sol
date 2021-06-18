pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract ElectionContract {
    
    address admin;

    struct Candidate {
        string name;
        uint voteCount;
    }
    
    struct Voter {
        string name;
        bool hasVoted;
    }
    
    struct Election {
        address id;
        uint startedAt;
        uint endedAt;
        uint candidateCount;
        uint voterCount;
        string electionName;
        bool hasEnded;
    }
    

    mapping(address => mapping(address=>Candidate)) public candidates;
    mapping(address => mapping(address=>Voter)) public voters;
    mapping(address => Election) public elections;

    
    event votedEvent(
        uint indexed _candidateId
    );
    event startElectionEvent(string _message);
    
    
    constructor() public {
        admin = msg.sender;
    }
    
    function createElection(string memory _electionName) public returns (address) {
        address _id = address(bytes20(sha256(abi.encodePacked(msg.sender, now))));
        elections[_id] = Election(_id, 0, 0, 0, 0, _electionName, false);
        return _id;
    }
    
    function getElection(address _electionId) public view returns(Election memory){
        return elections[_electionId];
    }
    
    function startElection(address _electionId) public {
        require(elections[_electionId].hasEnded == false, "The election has already ended!");
        elections[_electionId].startedAt = now;
        emit startElectionEvent("Election started!");
    }
    
    function endElection(address _electionId) public {
        require(elections[_electionId].hasEnded == false, "The election has already ended!");
        elections[_electionId].endedAt = now;
        elections[_electionId].hasEnded = true;
        emit startElectionEvent("Election started!");
    }


    function addCandidate(address _electionId, string memory _name, address _candidateAddress) public {
        uint _no = elections[_electionId].candidateCount;
        candidates[_electionId][_candidateAddress] = Candidate(_name, 0);
        _no += 1;
        elections[_electionId].candidateCount = _no;
    }
    
    function addVoter(address _electionId, string memory _name, address _voterAddress) public {
        uint _no = elections[_electionId].voterCount;
        voters[_electionId][_voterAddress] = Voter(_name, false);
        _no += 1;
        elections[_electionId].voterCount = _no;
    }
    

    function vote(address _voterAddress, address _candidateAddress, address _electionId) public {
        require(elections[_electionId].hasEnded == false, "Election has ended!");
        require(voters[_electionId][_voterAddress].hasVoted == false, "User has already voted!");
        uint _count = candidates[_electionId][_candidateAddress].voteCount;
        _count += 1;
        candidates[_electionId][_candidateAddress].voteCount = _count;        
        voters[_electionId][_voterAddress].hasVoted = true; 
    }
}