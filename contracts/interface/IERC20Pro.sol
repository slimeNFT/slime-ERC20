pragma solidity ^0.8.0;

interface IERC20Pro {
    function mint(address _to, uint256 _amount) external;
    function burn(uint256 _amount) external;
}
