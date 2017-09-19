pragma solidity ^0.4.0;

contract PayableContract{
    function PayableContract() {
        
    }
    function recieveFunds() payable{
        
    }
    function getter() constant returns(uint){
        return this.balance ; 
    }
}
