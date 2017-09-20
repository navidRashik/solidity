pragma solidity ^0.4.0;

contract CustodialContract{
    address client;
    bool public switchFunds = false;
    event depositStatus(string _msg1, address user, string _msg2 , uint _amount);
    event userStatus(string _msg);
    function CustodialContract(){
        client = msg.sender;
    }
    
    modifier ifClient(){
        if(msg.sender != client)
        {
            throw;
        }
        _;
    }
    
    function depositFund() payable{
        depositStatus('User has deposit some money from account : ',msg.sender,
                        ' and the amount is : ', msg.value);
    }
    
    function withDrawFunds(uint amount) ifClient {
        if(client.send(amount)){
            userStatus('user withDrawed some money!!!');
            switchFunds = true;
        }
        else{
            switchFunds = false;
        }
    }
    
    function getFunds() ifClient constant returns(uint){
        return this.balance;
    }
}
