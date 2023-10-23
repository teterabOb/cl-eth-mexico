// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MexicoNFT is ERC721, ERC721URIStorage, Ownable {
    /* Side event Metadata */
    string constant TOKEN_URI = "https://ipfs.io/ipfs/QmYqMCv3tB21RRAzSWcxuRVrhUq4wgKts1yP8X1p3G1qxG";
    /* Tec. de Monterrey Metadata */
    //string constant TOKEN_URI = "https://ipfs.io/ipfs/QmNrJnGgmXDZdRKZKeU3BydksfVaAp9t4nzGt4s5F4ooYk"
    uint256 private _nextTokenId;

    constructor()
        ERC721("Mexico NFT", "MTK")
        Ownable(msg.sender)
    {}

    function safeMint(address to) public  {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, TOKEN_URI);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
