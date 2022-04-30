// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Token is ERC20, Ownable {
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _amount,
        address _to
    ) ERC20(_name, _symbol) {
        _mint(_to, _amount);
    }

}
