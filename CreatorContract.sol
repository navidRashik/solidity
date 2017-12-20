

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



