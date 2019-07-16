pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

contract Munchkin is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {

        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        // Custom game logic will go here

        changes.emit();
    }  //end function beforeMatchStart()
} //end contract Munchkin {}