// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SalaryCalculationContract {

// State variables
uint public age;
uint public hoursWorked;
uint public hourlyRate;
uint public totalSalary;


function setAge(uint _age) public {
age = _age;
  }

function setHrsWrk(uint _hoursWorked) public {
hoursWorked = _hoursWorked;
  }

function setRate(uint _hourlyRate) public onlyOwner {
require(_hourlyRate > 0, "Hourly rate must be greater than zero.");
hourlyRate = _hourlyRate;
  }

function calculateTotSal() public onlyOwner {
require(hourlyRate > 0 && hoursWorked > 0, "Cannot calculate salary with zero values.");
totalSalary = hourlyRate * hoursWorked;
  }

// Restrict functions to the contract owner
modifier onlyOwner() {
require(msg.sender == tx.origin, "Only the contract owner can call this function.");
_;
    }
  }
