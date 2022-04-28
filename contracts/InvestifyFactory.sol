// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./ERC20Token.sol";
// import "@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactory is Ownable {
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
        address clone = createClone(TokenAddress);
        ERC20Token(clone).init(_name, _symbol, amount, _to);
        TokenCreationForEachBusiness[_name][_to][clone];
        TokenCreated(clone, _to);
    }

    function createClone(address target) internal returns (address result) {
        bytes20 targetBytes = bytes20(target);
        assembly {
            let clone := mload(0x40)
            mstore(
                clone,
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
            )
            mstore(add(clone, 0x14), targetBytes)
            mstore(
                add(clone, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            result := create(0, clone, 0x37)
        }
    }
}
