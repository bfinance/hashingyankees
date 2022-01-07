// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract HashFunction {
    function hash(
        string memory _Yankees,
        uint _pinstripesNum,
        address _yankeeStaduimAddr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_Yankees, _pinstripesNum, _yankeeStaduimAddr));
    }

    // Example of hash collision
    // Hash collision can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such case, you should use abi.encode instead.
    function collision(string memory _Yankee, string memory _Arod)
        public
        pure
        returns (bytes32)
    {
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_Yankee, _Arod));
    }
}

contract GuessTheBestYankeeManager {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guessTheManager(string memory _JoeTorre) public view returns (bool) {
        return keccak256(abi.encodePacked(_JoeTorre)) == answer;
    }
}