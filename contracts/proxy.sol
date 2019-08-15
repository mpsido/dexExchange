pragma solidity 0.4.24;

import "./exchange.sol";

contract Proxy {

	Exchange public exchange; 

    constructor(address _exchange) public { 
        exchange = Exchange(_exchange);        
    }


}