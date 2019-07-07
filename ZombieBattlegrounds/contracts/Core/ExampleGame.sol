pragma solidity 0.4.24;

import "./ZB/ZBGameMode.sol";

contract ExampleGame is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);        
    } //end function beforeMatchStart()
} //end contract ExampleGame {}
