// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Cal {

      struct Calculation {
        uint256 operand1;
        uint256 operand2;
        string operation;
        uint256 result;
    }
    
    Calculation[]  public calculations;
    event CalculationPerformed(uint256 operand1, uint256 operand2, string operation, uint256 result);

    function add(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = a + b;
        Calculation memory newCalculation = Calculation(a, b, "Addition", result);
        calculations.push(newCalculation);
        emit CalculationPerformed(a, b, "Addition", result);
        return result;
    }

    function subtract(uint256 a, uint256 b) public returns (uint256){
        if(a>b){
            uint256 result = a-b;
            Calculation memory newCal = Calculation(a,b,"Subtraction",result);
            calculations.push(newCal);
            emit CalculationPerformed(a, b, "Addition", result);
            return result;
        }
        else{
            return 0;
        }
    }

    function getAllCalculation() public view returns (Calculation[] memory){
        return calculations;

    }

    


}