// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BloodDonation {
 struct DonationRequest {
 string bloodGroup;
 string location;
 }
 mapping(address => DonationRequest) public requests;
 function registerRequest(string memory _bloodGroup, string memory _location) public {
 DonationRequest memory newRequest = DonationRequest({
 bloodGroup: _bloodGroup,
 location: _location
 });
 requests[msg.sender] = newRequest;
 }
}
