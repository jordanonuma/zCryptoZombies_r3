pragma solidity ^0.4.25;
import "./zombieattack.sol";

contract ZombieOwnership is ZombieAttack {
  function balanceOf(address _owner) external view returns (uint256) {

  } //end function balanceOf()

  function ownerOf(uint256 _tokenId) external view returns (address) {

  } //end function ownerOf()

} //end ZombieOwnership {}