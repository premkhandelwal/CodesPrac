// SPDX-License-Identifier: MIT

pragma solidity ^0.6;

contract StudentMgmt{

    struct Student{
        int studId;
        string name;
        string department;
    }

    Student[] students;

    function addStudent(int studId, string memory name, string memory department) public{
        Student memory student = Student(studId, name, department);
        students.push(student);
    }

    function getStudent(int studId) public view returns(string memory, string memory){
        for(uint i = 0; i < students.length; i++){
            Student memory student = students[i];
            if(student.studId == studId){
                return (student.name, student.department);
            }
        }
        return ("Not Found", "Not Found");
    }
    receive() external payable{
        getStudent(1);
    }

    fallback() external payable{}
}
