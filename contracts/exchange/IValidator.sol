pragma solidity >=0.5.0 <0.6.0;

contract IValidator {

    /// @dev Verifies that a signature is valid.
    /// @param hash Message hash that is signed.
    /// @param signerAddress Address that should have signed the given hash.
    /// @param signature Proof of signing.
    /// @return Validity of order signature.
    function isValidSignature(
        bytes32 hash,
        address signerAddress,
        bytes calldata signature
    )
        external
        view
        returns (bool isValid);
}
