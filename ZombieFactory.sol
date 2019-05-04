pragma solidity ^0.4.25;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    } //end struct Zombie{}

    Zombie[] public zombies; //public array 'zombies' of Zombie[] structs

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    } //end function createZombie()
} //end contract ZombieFactory {}
