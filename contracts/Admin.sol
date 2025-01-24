// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract Election is Ownable {

    using EnumerableSet for EnumerableSet.AddressSet;
    // voter and candidate mapping
    mapping(address => address) public voter_to_candidate;

    bool public is_start;
    bool public is_end;

    EnumerableSet.AddressSet private candidateSet;

    event VoteStarted(address owner);
    event VoteEnded(address owner);
    event Vote(address voter, address candidate);

    error InvalidCandidateAddress();
    error InvalidVoterAddress();

    constructor() Ownable(msg.sender) {

    }

    modifier voteCheck() {
        require(is_start && !is_end, "The current status cannot vote!");
        _;
    }

    /**
     * @dev Vote for candidate
     * @param voter The address of the voter
     * @param candidate The address of the candidate
     */
    function voteForcandidate(address voter, address candidate) public voteCheck returns (bool) {

        // Invalid candidate address
        if (!candidateSet.contains(candidate)) {
            revert InvalidCandidateAddress();
        }
        if (voter == address(0)) {
            revert InvalidVoterAddress();
        }

        require(voter_to_candidate[voter] == address(0), "The voter has already voted");

        // vote to candidate, record mapping
        voter_to_candidate[voter] = candidate;
        emit Vote(voter, candidate);
        return true;
    }


    /**
     * @dev Get candidate
     * @return The address of the candidate
     */
    function getCandidate() public view returns (address[] memory) {
        return candidateSet.values();
    }

    /**
     * @dev Add candidate
     * @param candidateAddress The address of the candidate
     */
    function addCandidate(address candidateAddress) public onlyOwner {
        require(!is_start, "Voting has already begun");
        require(candidateAddress != address(0), "Invalid candidate address");
        if (!candidateSet.contains(candidateAddress)) {
            candidateSet.add(candidateAddress);
        }
    }



    function startVote() public onlyOwner {
        require(!is_start, "The voting has already begun");
        is_start = true;

        emit VoteStarted(msg.sender);
    }


    function stopVote() public onlyOwner voteCheck {
        require(!is_end, "The voting has stopped");
        is_end = true;

        emit VoteEnded(msg.sender);
    }

    function health() public pure returns (string memory) {
        return "ok";
    }

}