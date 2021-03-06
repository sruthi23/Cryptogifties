pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract CryptoGifty is MintableToken{

	string public constant name = "CryptoGifty";
	string public  constant symbol = "CGT";
	address public owner;
	uint256 public token_value = 10;

	function getSupply() public view returns(uint256){

		return totalSupply_;
	}

	function getValue() public view returns(uint256)
	{
		return token_value;
	}

	function getBalance(address _adr) public view returns(uint256)
	{
		return balances[_adr];
	}

}