//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Slime is ERC20, Ownable, Pausable {
    mapping(address => bool) public minters;
    constructor() ERC20("Slime Token", "SLM") {
        minters[_msgSender()] = true;
    }

    modifier onlyMinter() {
        require(minters[_msgSender()], "Mint: caller is not the minter");
        _;
    }

    function setMinter(address newMinter, bool power) public onlyOwner {
        minters[newMinter] = power;
    }

    function transfer(address recipient, uint256 amount) public whenNotPaused override returns (bool) {
        return ERC20.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public whenNotPaused override returns (bool) {
        return ERC20.transferFrom(sender, recipient, amount);
    }

    function mint(address to, uint256 amount) public onlyMinter returns (bool) {
        require(amount > 0, "Mint: cannot amount is 0");
        _mint(to, amount);
        return true;
    }

    function burn(uint256 amount) public returns (bool) {
        _burn(_msgSender(), amount);
        return true;
    }
    function decimals() public pure override returns (uint8) {
        return 6;
    }

    function setPause(bool isPause) public onlyOwner {
        if (isPause) {
            _pause();
        } else {
            _unpause();
        }
    }
}