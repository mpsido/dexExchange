pragma solidity 0.4.24;

contract LibExchangeErrors {

    /// Order validation errors ///
    string constant ORDER_UNFILLABLE = "ORDER_UNFILLABLE";                              // Order cannot be filled.
    string constant INVALID_MAKER = "INVALID_MAKER";                                    // Invalid makerAddress.
    string constant INVALID_TAKER = "INVALID_TAKER";                                    // Invalid takerAddress.
    string constant INVALID_SENDER = "INVALID_SENDER";                                  // Invalid `msg.sender`.
    string constant INVALID_ORDER_SIGNATURE = "INVALID_ORDER_SIGNATURE";                // Signature validation failed. 
    
    /// fillOrder validation errors ///
    string constant INVALID_TAKER_AMOUNT = "INVALID_TAKER_AMOUNT";                      // takerAssetFillAmount cannot equal 0.
    string constant ROUNDING_ERROR = "ROUNDING_ERROR";                                  // Rounding error greater than 0.1% of takerAssetFillAmount. 
    
    /// Signature validation errors ///
    string constant INVALID_SIGNATURE = "INVALID_SIGNATURE";                            // Signature validation failed. 
    string constant SIGNATURE_ILLEGAL = "SIGNATURE_ILLEGAL";                            // Signature type is illegal.
    string constant SIGNATURE_UNSUPPORTED = "SIGNATURE_UNSUPPORTED";                    // Signature type unsupported.
    
    /// cancelOrdersUptTo errors ///
    string constant INVALID_NEW_ORDER_EPOCH = "INVALID_NEW_ORDER_EPOCH";                // Specified salt must be greater than or equal to existing orderEpoch.

    /// fillOrKillOrder errors ///
    string constant COMPLETE_FILL_FAILED = "COMPLETE_FILL_FAILED";                      // Desired takerAssetFillAmount could not be completely filled. 

    /// matchOrders errors ///
    string constant NEGATIVE_SPREAD_REQUIRED = "NEGATIVE_SPREAD_REQUIRED";              // Matched orders must have a negative spread.

    /// Transaction errors ///
    string constant REENTRANCY_ILLEGAL = "REENTRANCY_ILLEGAL";                          // Recursive reentrancy is not allowed. 
    string constant INVALID_TX_HASH = "INVALID_TX_HASH";                                // Transaction has already been executed. 
    string constant INVALID_TX_SIGNATURE = "INVALID_TX_SIGNATURE";                      // Signature validation failed. 
    string constant FAILED_EXECUTION = "FAILED_EXECUTION";                              // Transaction execution failed. 
    
    /// registerAssetProxy errors ///
    string constant ASSET_PROXY_ALREADY_EXISTS = "ASSET_PROXY_ALREADY_EXISTS";          // AssetProxy with same id already exists.

    /// dispatchTransferFrom errors ///
    string constant ASSET_PROXY_DOES_NOT_EXIST = "ASSET_PROXY_DOES_NOT_EXIST";          // No assetProxy registered at given id.
    string constant TRANSFER_FAILED = "TRANSFER_FAILED";                                // Asset transfer unsuccesful.

    /// Length validation errors ///
    string constant LENGTH_GREATER_THAN_0_REQUIRED = "LENGTH_GREATER_THAN_0_REQUIRED";  // Byte array must have a length greater than 0.
    string constant LENGTH_GREATER_THAN_3_REQUIRED = "LENGTH_GREATER_THAN_3_REQUIRED";  // Byte array must have a length greater than 3.
    string constant LENGTH_0_REQUIRED = "LENGTH_0_REQUIRED";                            // Byte array must have a length of 0.
    string constant LENGTH_65_REQUIRED = "LENGTH_65_REQUIRED";                          // Byte array must have a length of 65.
}


