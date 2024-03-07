// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BloodDonation {
 struct Donor {
 string name;
 uint age;
 string gender;
 string bloodGroup;
 string location;
 string mobileNumber;
 string medicalCondition;
 address donorAddress;
 uint lastDonation;
 }
 mapping (address => Donor) public donors;
 function register(string memory _name, uint _age, string memory _gender, string memory _bloodGroup, string
memory _location, string memory _mobileNumber, string memory _medicalCondition) public {
 require(_age >= 18, "Donor must be at least 18 years old");
 require(donors[msg.sender].lastDonation + 90 days <= block.timestamp, "Donor must wait at least 3 months since last donation");
 
 donors[msg.sender] = Donor(_name, _age, _gender, _bloodGroup, _location, _mobileNumber,
_medicalCondition, msg.sender, block.timestamp);
 }
}
