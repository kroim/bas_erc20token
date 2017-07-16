pragma solidity ^0.4.4;

contract Basecoinit {
    
    // Owner of this contract
    address public owner;

    // Balances for each account
    mapping(address => uint256) balances;
    
    uint256 _totalSupply = 1000000;

    // Constructor
    function Basecoinit() {
        owner = msg.sender;
        balances[owner] = _totalSupply;
    }

    // What is the balance of a particular account?
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
}