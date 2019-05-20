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
  address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
  KittyInterface kittyContract = KittyInterface(ckAddress);

  function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    //Declares a local Zombie[] named 'myZombie' (which will be a storage pointer) and
    //sets this variable to be equal to index _zombieId in our zombies[] array.
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;   
    uint newDna = (myZombie.dna + _targetDna)/2;
    if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty")) {
        newDna = newDna - newDna % 100 + 99;
    } //end if(zombie was previously a kitty)
    _createZombie("NoName", newDna);
  } //end function feedAndMultiply()

  function feedOnKitty(uint _zombieId, uint _kittyId) public {
    uint kittyDna;
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  } //end function feedOnKitty()

} //end contract ZombieFeeding {}

