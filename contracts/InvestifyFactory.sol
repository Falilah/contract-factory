// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./ERC20Token.sol";
import "@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FoundationFactory is ERC20Token, Ownable {
    address public TokenAddress;
    mapping(string => mapping(address => address)) TokenCreationForEachBusiness;

    event TokenCreated(address newToken, address business);

    // function TokenFactory(address _tokenAddress) public {
    //     TokenAddress = _tokenAddress;
    // }

    function setTokenAddress(address _tokenAddress) public onlyOwner {
        TokenAddress = _tokenAddress;
    }

    function createToken(string memory _name, string memory _symbol) public {
        address clone = createClone(TokenAddress);
        ERC20(clone).init(_name, _symbol);
        TokenCreationForEachBusiness[name][msg.sender][clone];
        TokenCreated(clone, msg.sender);
    }
}
