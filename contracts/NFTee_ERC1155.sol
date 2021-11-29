// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTEE is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC1155("metadata") {}

    mapping(uint => string) tokenURIs;

    function tokenURI(uint256 tokenId) public view virtual returns (string memory) {
      return tokenURIs[tokenId];
    }

    function create(address player, string memory mytokenURI, uint _amount)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId, _amount,"");
        tokenURIs[newItemId] = mytokenURI;
        //_setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
