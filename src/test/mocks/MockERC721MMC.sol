// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC721MMC} from "../../ERC721MMC.sol";

contract MockERC721MMC is ERC721MMC {
    constructor(
        string memory name,
        string memory symbol,
        uint256 startingIndex_,
        uint256 collectionSize_,
        uint256 maxPerWallet_
    ) ERC721MMC(name, symbol, startingIndex_, collectionSize_, maxPerWallet_) {}

    function tokenURI(uint256) public pure virtual override returns (string memory) {}

    function mint(address to, uint256 quantity) public virtual {
        _mintAndStake(to, quantity, false);
    }

    function mintAndStake(address to, uint256 quantity) public virtual {
        _mintAndStake(to, quantity, true);
    }

    function _pendingReward(address, uint256) internal pure override returns (uint256) {
        return 1;
    }

    function _payoutReward(address, uint256) internal pure override {
        return;
    }
}
