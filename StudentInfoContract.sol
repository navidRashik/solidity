pragma solidity ^0.4.0;

contract StudentInfoContract{
    address creator;
    function StudentInfoContract(){
        creator = msg.sender;
    }
    modifier ifCreator(){
        if(msg.sender != creator)
        {
            throw;
        }
        _;
    }
    
    struct infoStruct{
        bytes32 name; //bytes32 use less gas for testing purpose using string
        bytes32 cgpa;
    }
    infoStruct studentInfo;
    function setInfo(bytes32 name, bytes32 cgpa)ifCreator {
        studentInfo.name = name;
        studentInfo.cgpa  = cgpa;
    }
    function getName() constant returns(bytes32,bytes32){
        return (studentInfo.name , studentInfo.cgpa) ;
    }
    // function getName() constant returns(bytes32){
    //     return (studentInfo.name ) ;
    // }
    function hashIt() constant returns(bytes32){
        bytes32 hash = sha3(studentInfo.name , studentInfo.cgpa);
        return hash;
    }
    
}
