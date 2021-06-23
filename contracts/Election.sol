// Build by Puzzle Verma

pragma solidity ^0.4.11;

contract Election {
    // Model candidate
    // Struct stores three different data
    // ID, Name and Vote count
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store voter
    //Set bool to true if voted
    mapping(address => bool) public voters;
    // Store candidate
    // Read candidate
    mapping(uint => Candidate) public candidates;
    // Store candidate count
    // No way to iterate over mapping
    // Any id not used returns blank Candidate
    uint public candidatesCount;

    // Contructor
    function Election() public {
        addCandidate("Modi");
        addCandidate("Kejriwal");
    }
    
    // Function for adding candidate
    // Private because we dont want 
    // anyone else see votecount
    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    //Function for casting votes
    //Public because we want
    //everyone to access this
    function vote (uint _candidateId) public {
        //Recording the voter has voted
        voters[msg.sender] = true;

        //Update candidate vote count
        candidates[_candidateId].voteCount++;
    }
}
