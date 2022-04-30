// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC20Token.sol";
import "./CloneFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactory is Ownable, CloneFactory {
    address public TokenAddress;
    mapping(string => mapping(address => address)) TokenCreationForEachBusiness;

    event TokenCreated(address newToken, address business);

    // function TokenFactory(address _tokenAddress) public {
    //     TokenAddress = _tokenAddress;
    // }

    function setTokenAddress(address _tokenAddress) public onlyOwner {
        TokenAddress = _tokenAddress;
    }

    function createToken(
        string memory _name,
        string memory _symbol,
        uint256 amount,
        address _to
    ) public {
        ERC20Token clone = ERC20Token(createClone(TokenAddress));
        clone.init(_name, _symbol, amount, _to);
        TokenCreationForEachBusiness[_name][_to][clone];
        TokenCreated(clone, _to);
    }
}
