//SPDX-License-Identifier: MIT
pragma solidity ^0.6;

contract Banking{
    mapping(address=>uint) public userAccount;
    mapping(address=>bool) public userExists;

    function createAccount() public payable returns(string memory){
        require(userExists[msg.sender] == false, "Account already exists");
        if(msg.value == 0){
            userAccount[msg.sender] = 0;
            userExists[msg.sender] = true;
            return "Account Created";
        }else{
            require(userExists[msg.sender] == false, "Account already exists");
            userAccount[msg.sender] = msg.value;
            userExists[msg.sender] = true;
            return "Account Created";
        }
    }

    function deposit() public payable returns(string memory){
        require(userExists[msg.sender] == true, "Account not created");
        require(msg.value > 0, "Value for deposit should be greater than 0");
        userAccount[msg.sender] = userAccount[msg.sender] + msg.value;
        return "Deposited Successfully";
    }

    function withdraw(uint amt) public payable returns(string memory){
        require(userExists[msg.sender] == true, "Account not created");
        require(amt < userAccount[msg.sender], "Insufficient Balance");
        require(amt > 0, "Value for withdraw should be greater than 0");

        userAccount[msg.sender] = userAccount[msg.sender] - amt;
        msg.sender.transfer(amt);
        return "WIthdraw successfully";
    }

    function transferAmt(address payable userAddress, uint amount) public payable returns(string memory){
        require(userAccount[msg.sender] > amount, "Insufficient Balance");
        require(userExists[msg.sender] == true, "Account not created");
        require(userExists[userAddress] == true, "Transfer account not exists");
        require(amount > 0, "Amount should be greater than 0");
        userAccount[msg.sender] = userAccount[msg.sender] - amount;
        userAccount[userAddress] = userAccount[userAddress] + amount;
        return "Transfer successful";
    }

    function send_amt(address payable toAddress, uint256 amount) public payable returns(string memory)
    {
        require(userAccount[msg.sender]>amount,"Insufficeint balance in Bank account");
        require(userExists[msg.sender]==true,"Account is not created");
        require(amount>0,"Amount should be more than zero");
        userAccount[msg.sender]=userAccount[msg.sender]-amount;
        payable(toAddress).transfer(amount);
        return "Transfer Success";
    }
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // Views
    function userBalance() public view returns(uint){
        return userAccount[msg.sender];
    }

    function accountExists() public view returns(bool){
        return userExists[msg.sender];
    }

    receive() external payable {}
}
