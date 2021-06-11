pragma solidity >=0.4.21 <0.7.0;

contract TestMath {

    uint firstNo ;
    uint secondNo ;

    function firstNoSet(uint x) public {
        firstNo = x;
    }

    function secondNoSet(uint y) public {
        secondNo = y;
    }

    function add() view public returns (uint) {
        uint Sum = firstNo + secondNo ;
        return Sum;
    }
}