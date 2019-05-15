pragma solidity ^0.4.25;
import "./ZombieFactory.sol";

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    //Declares a local Zombie[] named 'myZombie' (which will be a storage pointer) and
    //sets this variable to be equal to index _zombieId in our zombies[] array.
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;   
  } //end function feedAndMultiply()

} //end contract ZombieFeeding {}

