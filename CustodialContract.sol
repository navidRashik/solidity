pragma solidity ^0.4.0;

contract CustodialContract{
    address client;
    bool public switchFunds = false;
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
        
    }
    
    function withDrawFunds(uint amount) ifClient {
        if(client.send(amount)){
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
