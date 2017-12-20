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









// // //-----------------------------------new file

contract CreatorContract{
    address creator;

    function CreatorContract(){
        creator = msg.sender;
    }
    
    modifier ifCreator(){
        if(msg.sender != creator)
        {
            throw;
        }
        _;
    }
    address[] contractList;
    
    // StudentInfoContract studentClass =  StudentInfoContract(0xe176bcd71ce7c8d2719c495c77947f69e0dd6e1d);  //inside the parameter 
    //                                     //address of StudentInfoContract class will go 
    //                                     //and 'new' keyword should remove
                                        
    address studentClassAddress =  new StudentInfoContract();
    StudentInfoContract studentClass =  StudentInfoContract(studentClassAddress); //new object with the address of the newly created contract
    

    
    
    function setResultInfo(bytes32 name, bytes32 cgpa) ifCreator{
        studentClass.setInfo(name,cgpa);
        contractList.push(studentClassAddress);
    }
    function getResultInfo() constant returns(bytes32,bytes32) {
        return  studentClass.getName();
    }
    function getAddress() constant returns(address[]) {
        return contractList;
    }
    function contractExist(address inputAddress) constant returns(bool){
        for(uint i=0; i<contractList.length; i++)
        {
            if(contractList[i]==inputAddress)
            {
                return true;
            }
            else{
                return false;
            }
        }
    }
    // function getterTest() constant returns(address) {
    //     bytes32 tst = bytes32(studentClassAddress);
    //     address t = address(tst);
    //     return t;
    // } 
}





































// // the problem is cant transfer address from one contract to another


// //-----------------------------new file
// contract StoreContract{
//     address creator;
//     function StoreContract(){
//         creator = msg.sender;
//     }
//     modifier ifCreator(){
//         if(msg.sender != creator)
//         {
//             throw;
//         }
//         _;
//     }
    
//     address[] contractList;
//     function setAddress(bytes32 addrByts) {
//         address stdContAddress = address(addrByts);
//         contractList.push(stdContAddress);
//     }
//     // function getAddress() constant returns(bytes32) {
//     //     bytes32 addrInbyt = bytes32(contractList[contractList.length-1]);
//     //     return addrInbyt;
//     // }
// }


// //-----------------------------------new file

// contract CreatorContract{
//     address creator;
//     bool storageCreated = false;
//     address storeContractAddress ;
    
//     function CreatorContract(){
//         creator = msg.sender;
//         if(storageCreated==false)
//         {
//             storeContractAddress = new StoreContract() ;// address of running storecontruct 
//             storageCreated =true;
//         }
        
        
//     }
    
//     modifier ifCreator(){
//         if(msg.sender != creator)
//         {
//             throw;
//         }
//         _;
//     }
                                    
//     address studentClassAddress =  new StudentInfoContract();
//     StudentInfoContract studentClass =  StudentInfoContract(studentClassAddress); //new object with the address of the newly created contract
    
    
//     //adding new contract address
//     // address storeContractAddress = new StoreContract() ;// address of running storecontruct 
//     StoreContract storeContClass = StoreContract(storeContractAddress);
//     bytes32 stdAddressByts = bytes32(studentClassAddress);
    
    
//     function setResultInfo(bytes32 name, bytes32 cgpa) ifCreator{
//         studentClass.setInfo(name,cgpa);
//         // bytes32 stdAddressByts = bytes32(studentClassAddress);
//         storeContClass.setAddress(stdAddressByts);
//     }
//     function getResultInfo() constant returns(bytes32,bytes32) {
//         return  studentClass.getName();
//     }

     
// }








