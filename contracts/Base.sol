// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract BaseContract {


    mapping(address => uint256) public nonces;


    /**
     * @dev Replay attack protection
     * @param _nonce The nonce of the sender
     */
    modifier nonReentrantNonce(uint256 _nonce) {
        require(nonces[msg.sender] + 1 == _nonce, "Invalid nonce");
        nonces[msg.sender] = _nonce;
        _;
    }

    /**
     * @dev Get the nonce of the sender
     * @param _sender The address of the sender
     */
    function getNonce(address _sender) view public returns (uint256) {
        return nonces[_sender];
    }

}