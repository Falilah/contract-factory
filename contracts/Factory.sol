// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC20Token.sol";

contract InvestifyTokenactory {
    address[] Daomember;
    ERC20Token[] private _businessAddress;
    event TokenCreated(ERC20Token newToken, address business);

    constructor(address[] memory _DaoMember) {
        Daomember = _DaoMember;
    }
    modifier onlyDaoMember(){
        address _Daomember;
        for(uint i; i< Daomember.length; i++){
            if(msg.sender == Daomember[i]){
                _Daomember = msg.sender;
            }
        }
        require(_Daomember != address(0), "Not a dao member");
        _;
    }

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

    function getBusinessAddresses()
        public
        view
        returns (ERC20Token[] memory businessAddress)
    {
        businessAddress = _businessAddress;
    }
    //is there a function that adds member to the governance,
    // we need the function here also;

}
