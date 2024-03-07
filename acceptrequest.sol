// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BloodDonation {
 struct Donor {
 string name;
 uint age;
 string gender;
 string bloodGroup;
 string location;
 uint lastDonation;
 string medicalCondition;
 uint coinsEarned;
 }
 struct DonationRequest {
 string bloodGroup;
 string location;
 address requester;
 address donor;
 bool isFulfilled;
 }
 mapping(address => Donor) public donors;
 mapping(address => DonationRequest) public requests;
 function fulfillRequest(address _donorAddress, address _requestAddress) public {
 // Get the donor and request details
 Donor storage donor = donors[_donorAddress];
 DonationRequest storage request = requests[_requestAddress];
 // Make sure the request hasn't already been fulfilled
 require(request.isFulfilled == false, "Request already fulfilled");
 // Make sure the donor has the requested blood group
 require(keccak256(bytes(donor.bloodGroup)) == keccak256(bytes(request.bloodGroup)), "Donor blood group does not match requested blood group");
 // Assign the donor to the requester
 request.donor = _donorAddress;
 // Update the donor's coins earned
 donor.coinsEarned++;
 // Mark the request as fulfilled
 request.isFulfilled = true;
 }
}
