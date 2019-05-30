pragma solidity ^0.4.25;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
   require(zombies[_zombieId].level >= _level);
   _; 
  } //end modifier aboveLevel()

  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
    
  } //end function changeName()
} //end contract ZombieHelper {}