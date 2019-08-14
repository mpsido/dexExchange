pragma solidity >=0.5.0 <0.6.0;

/* 
* Modified version of the original provided by 0x
* Changes:
* - Supports Solidity 0.5.0
* - Passes through domainName and domainVersion in constructor
* See license at bottom of file 
* link: https://github.com/hcaw/EIP712-Library/blob/master/contracts/EIP712Sig.sol

* See license at bottom of file 
*/


contract LibEIP712 {

  // EIP191 header for EIP712 prefix (https://eips.ethereum.org/EIPS/eip-191)
  string constant internal EIP191_HEADER = "\x19\x01";

  // Hash of the EIP712 Domain Separator Schema
  bytes32 constant internal EIP712_DOMAIN_SEPARATOR_SCHEMA_HASH = keccak256(
    abi.encodePacked(
      "EIP712Domain(",
      "string name,",
      "string version,",
      "address verifyingContract",
      ")"
    )
  );

  // Hash of the EIP712 Domain Separator data
  // solhint-disable-next-line var-name-mixedcase
  bytes32 public EIP712_DOMAIN_HASH;

  constructor(
    string memory domainName,
    string memory domainVersion
  ) public {
    
    EIP712_DOMAIN_HASH = keccak256(
      abi.encodePacked(
        EIP712_DOMAIN_SEPARATOR_SCHEMA_HASH,
        keccak256(bytes(domainName)),
        keccak256(bytes(domainVersion)),
        abi.encode((address(this)))
      )
    );
  }

  /// @dev Calculates EIP712 encoding for a hash struct in this EIP712 Domain.
  /// @param hashStruct The EIP712 hash struct.
  /// @return EIP712 hash applied to this EIP712 Domain.
  function hashEIP712Message(bytes32 hashStruct)
    internal
    view
    returns (bytes32 result)
  {
    bytes32 eip712DomainHash = EIP712_DOMAIN_HASH;

    // Assembly for more efficient computing:
    // keccak256(abi.encodePacked(
    //     EIP191_HEADER,
    //     EIP712_DOMAIN_HASH,
    //     hashStruct    
    // ));

    assembly {
      // Load free memory pointer
      let memPtr := mload(64)

      mstore(memPtr, 0x1901000000000000000000000000000000000000000000000000000000000000)  // EIP191 header
      mstore(add(memPtr, 1), eip712DomainHash)                                            // EIP712 domain hash
      mstore(add(memPtr, 34), hashStruct)                                                 // Hash of struct

      // Compute hash
      result := keccak256(memPtr, 66)
    }
    return result;
  }
}

/*
  Copyright 2018 ZeroEx Intl.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
