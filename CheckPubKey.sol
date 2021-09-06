pragma ton-solidity ^0.39.0;

import "./ErrorCodes.sol";

contract CheckPubKey {
    modifier checkPubKey() {
        // check that contract's public key is set
        require(tvm.pubkey() != 0, ErrorCodes.PUB_KEY_IS_NO_SET);
        // Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), ErrorCodes.DIFFERENT_PUB_KEYS);
        _;
    }
}