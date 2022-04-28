// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./ERC20Token.sol";

contract InvestifyTokenactory {
    IvestifyToken[] private _businessAddress;

    function createToken(
        string memory _name,
        string memory _symbol,
        uint256 _amount
    ) public {
        IvestifyToken _token = new IvestifyToken(_name, _symbol, _amount);
        _businessAddress.push(_token);
    }
}
