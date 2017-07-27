pragma solidity ^0.4.4;

import "./api.sol";

contract Basecoinit {
    
    // Owner of this contract
    address public owner;
    DateTimeAPI public dateTimeUtils;

    uint public startDate = 0;
    uint public stopDate = 0;
    
    bool started = false;
    bool ended = false;

    uint price = 1 ether / 500;
    uint week1 = 168;
    uint week2 = 336;
    uint week3 = 504;
    uint week4 = 672;

    // Balances for each account
    mapping(address => uint256) balances;
    
    uint256 _totalSupply = 700000;
    uint256 _tokensSold = 0;

    // Functions with this modifier can only be executed by the owner
    modifier onlyOwner() {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }

    // Constructor
    function Basecoinit(address dateTimeAddress) {
        owner = msg.sender;
        balances[owner] = 300000;
        dateTimeUtils = DateTimeAPI(dateTimeAddress);
    }

    // What is the balance of a particular account?
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function setStartDate(uint16 year, uint8 month, uint8 day) onlyOwner {
        startDate = dateTimeUtils.toTimestamp(year, month, day);
        started = true;
    }

    function setStopDate(uint16 year, uint8 month, uint8 day) onlyOwner {
        stopDate = dateTimeUtils.toTimestamp(year, month, day);
    }

    function invest() payable{
        uint amount = msg.value;

        if(price > amount) throw;

        if(!started || startDate==0) throw;

        if(now < startDate) throw;

        if(now > stopDate) throw;

		uint numTokens = amount / price;

        uint bonus = getBonus();

        numTokens = numTokens + ((numTokens * bonus)/100);
		
        if((numTokens + _tokensSold)>700000){
            throw;
        }

        _tokensSold += numTokens;

        balances[msg.sender] = numTokens;
    }

    //When a user buys our token they will recieve:,
    //    - Week 1 - they will recieve 25% bonus
    //    - Week 2 - they will revieve 15% bonus
    //    - Week 3 - They will recieve 10% bonus
    //    - Week 4 - they will recieve no bonus
    function getBonus() constant returns (uint256 price){
        uint diffInSeconds = now - startDate;
        uint diffInHours = (diffInSeconds/60)/60;
        
        if(diffInHours < week1){
            return 25;
        }

        if(diffInHours > week1 && diffInHours < week2){
            return 15;
        }

        if(diffInHours > week2 && diffInHours < week3){
            return 10;
        }

        return 0; 
    }
}