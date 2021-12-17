// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";

/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 *  if (network === 'rinkeby') {
 *      proxyRegistryAddress = "0xf57b2c51ded3a29e6891aba85459d600256cf317";
 *  } else {
 *      proxyRegistryAddress = "0xa5409ec958c83c3f309868babaca7c86dcb077c1";
 *  }
 *  OpenSea Whitelisting (optional)
 *  Additionally, the ERC721Tradable and ERC1155Tradable contracts whitelist the proxy accounts of OpenSea users so that they are automatically able to trade any item on OpenSea (without having to pay gas for an additional approval).
 *  On OpenSea, each user has a "proxy" account that they control, and is ultimately called by the exchange contracts to trade their items.
 *  Note that this addition does not mean that OpenSea itself has access to the items, simply that the users can list them more easily if they wish to do so.
 *  It's entirely optional, but results in significantly less user friction. You can find this code in the overridden isApprovedForAll method, along with the factory mint methods.
 */
contract Creature is ERC721Tradable {
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("Creature", "OSC", _proxyRegistryAddress)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
}
