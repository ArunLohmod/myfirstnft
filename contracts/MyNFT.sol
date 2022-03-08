// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// importing files
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract MyNFT is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;    //using counter library of counter.sol file

    Counters.Counter private _tokenIds;  // creating token id of counter.counter type

    constructor() ERC721("ArunNFT", "Ax") {}     //giving name and symbol to nft

    // function for minting(creating) nft

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns(uint256){
        
        _tokenIds.increment(); //incrementing token id .....this function is in counter.sol file

        uint256 newItemId = _tokenIds.current();    // current value of _tokenIds

        _mint(recipient, newItemId);

        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}

