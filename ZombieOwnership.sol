pragma solidity ^0.4.25;
import "./zombieattack.sol";

contract ZombieOwnership is ZombieAttack {
  function balanceOf(address _owner) external view returns (uint256) {
      return ownerZombieCount[_owner];
  } //end function balanceOf()

  function ownerOf(uint256 _tokenId) external view returns (address) {
      return zombieToOwner[_tokenId];
  } //end function ownerOf()

} //end ZombieOwnership {}