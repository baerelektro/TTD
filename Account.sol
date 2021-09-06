pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

/// @title Simple wallet
/// @author Tonlabs modified by webbaer

contract Wallet {


    /// @dev Contract constructor.
    constructor() public ExternalOwner, RandomNonce, CheckPubKey {
        tvm.accept();
        setOwnership(msg.pubkey());
    }

    /// @dev Allows to transfer tons to the destination account.
    /// @param dest Transfer target address.
    /// @param value Nanotons value to transfer.
    /// @param bounce Flag that enables bounce message in case of target contract error.
    /// @flags
    /// @payload
    function sendTransaction(address dest, uint128 value, bool bounce, uint8 flags, TvmCell payload) public view checkOwner {
         // Runtime function that allows to make a transfer with arbitrary settings.
        tvm.accept();
        dest.transfer(value, bounce, flags, payload);
    }
}