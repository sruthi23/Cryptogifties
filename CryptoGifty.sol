pragma solidity ^0.4.18;

import "./MintableToken.sol"

contract CryptoGifty is MintableToken{

	string public constant name = "CryptoGifty";
	string public  constant symbol = "CGT";
	address public owner;
	uint256 piblic token_value = 10;

	function getSupply() public return(uint256){

		return totalSupply_;
	}

}