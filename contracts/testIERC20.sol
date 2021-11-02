pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interface/IERC20Pro.sol";

contract testIERC20 {
    address constant slmAddr = 0x66362cE5d2dc0bDB960302E01EaA49F8608E8F4c;
    IERC20 public erc20;
    IERC20Pro public erc20p;
    constructor() {
        erc20 = IERC20(slmAddr);
        erc20p = IERC20Pro(slmAddr);
    }
    function testBurn(uint256 amount) public {
        erc20p.burn(amount);
    }
    function testMint(address to, uint256 amount) public {
        erc20p.mint(to, amount);
    }

    function testTransfer(address to, uint256 amount) public {
        erc20.transferFrom(msg.sender, to, amount);
    }
}
