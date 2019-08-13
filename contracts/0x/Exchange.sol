pragma solidity 0.4.24;

import "./MixinExchangeCore.sol";
import "./MixinMatchOrders.sol";
import "./MixinSignatureValidator.sol";
import "./MixinTransactions.sol";
import "./MixinAssetProxyDispatcher.sol";
import "./MixinWrapperFunctions.sol";


contract Exchange is
    MixinExchangeCore,
    MixinMatchOrders,
    MixinSignatureValidator,
    MixinTransactions,
    MixinAssetProxyDispatcher,
    MixinWrapperFunctions
{
    string constant public VERSION = "2.0.1-alpha";

    // Mixins are instantiated in the order they are inherited
    constructor (bytes memory _zrxAssetData)
        public
        LibConstants(_zrxAssetData) // @TODO: Remove when we deploy.
        MixinExchangeCore()
        MixinMatchOrders()
        MixinSignatureValidator()
        MixinTransactions()
        MixinAssetProxyDispatcher()
        MixinWrapperFunctions()
    {}
}