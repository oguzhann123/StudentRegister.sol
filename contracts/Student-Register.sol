// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StudenRegister{

address public owner;
    uint public studentCounter;


constructor() {
    owner = msg.sender;


}
modifier onlyOwner (){
    require(owner==msg.sender,"you are not Owner.");
    _;
}

 struct Student {
    uint  studentNo;
    string studentName;
    string studentSurname;
    uint registerDate;
   bool isAvailable;

 }


  mapping(uint=>Student) public students;

function addStudent(string memory _name, string memory _surname) onlyOwner external {
    
    studentCounter++;

    Student memory student;

    uint studentId = studentCounter;
     student.studentNo=studentCounter;
    student.studentName=_name;
    student.studentSurname=_surname;

    student.registerDate=block.timestamp;

    student.isAvailable = true;


    students[studentId] = student;
    }



function studentDelete(uint _studentNo)  onlyOwner public {

  require(_studentNo>0 && _studentNo<= studentCounter,"invalid student.");
    require(students[_studentNo].isAvailable,"Student Already deleted.");

     students[_studentNo].isAvailable = false;
}

}

