// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./ERC20Token.sol";

contract InvestifyTokenactory {
    ERC20Token[] private _businessAddress;
    event TokenCreated(ERC20Token newToken, address business);

    function createToken(
        string memory _name,
        string memory _symbol,
        uint256 _amount,
        address _to
    ) public {
        ERC20Token _token = new ERC20Token(_name, _symbol, _amount, _to);
        _businessAddress.push(_token);
        emit TokenCreated(_token, _to);
    }
}
