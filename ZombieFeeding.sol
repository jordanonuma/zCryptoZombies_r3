pragma solidity ^0.4.25;
import "./ZombieFactory.sol";

contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ); //end function getKitty()--from Crypto Kitties contract
} //end contract KittyInterface {}

contract ZombieFeeding is ZombieFactory {
  // deprecated below line in favor of allowing 'kittyContract' to be set by user.
  // KittyInterface kittyContract = KittyInterface(ckAddress);
  KittyInterface kittyContract;

  modifier ownerOf(uint _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    _;
  } //end modifier ownerOf()

  function setKittyContractAddress(address _address) external onlyOwner {
    kittyContract = KittyInterface(_address);
  } //end function setKittyContractAddress()

  function _triggerCooldown(Zombie storage _zombie) internal {
    _zombie.readyTime = uint32(now+cooldownTime);
  } //end function _triggerCooldown()

  function _isReady(Zombie storage _zombie) internal view returns(bool) {
    return (_zombie.readyTime <= now);
  } //end function _isReady()

  function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) internal ownerOf(_zombieId) {
    //Declares a local Zombie[] named 'myZombie' (which will be a storage pointer) and
    //sets this variable to be equal to index _zombieId in our zombies[] array.
    Zombie storage myZombie = zombies[_zombieId];
    require(_isReady(myZombie));
    _targetDna = _targetDna % dnaModulus;   
    uint newDna = (myZombie.dna + _targetDna)/2;
    if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
        newDna = newDna - newDna % 100 + 99;
    } //end if(zombie was previously a kitty)
    _createZombie("NoName", newDna);
    _triggerCooldown(myZombie);
  } //end function feedAndMultiply()

  function feedOnKitty(uint _zombieId, uint _kittyId) internal {
    uint kittyDna;
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  } //end function feedOnKitty()

} //end contract ZombieFeeding {}