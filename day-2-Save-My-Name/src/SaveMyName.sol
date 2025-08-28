//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;


contract SaveMyName{

    struct Info{
        string name;
        string bio;
    }

    Info person;

    function setInfo(string memory _name,string memory _bio) public {
        person.name = _name;
        person.bio = _bio;
    }
}
