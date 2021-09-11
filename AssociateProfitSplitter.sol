pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    address payable employee_one; //= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable employee_two; //= 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address payable employee_three; //= 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    
    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c
    address payable owner = msg.sender;
    uint public employee_one_balance;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable onlyOwner{

        uint amount = msg.value / 3;

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        msg.sender.transfer(msg.value - amount * 3);
        employee_one_balance = employee_one.balance;

    }

    function() external payable {
        deposit();
    }
}