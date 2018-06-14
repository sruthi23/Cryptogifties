pragma solidity ^0.4.18;

import "./CryptoGifty.sol";
import "./SafeMath.sol";

contract SendGift{

	using SafeMath for uint256;

	CryptoGifty public gift_token;
	constructor(address _tokenaddress) public
	{
		gift_token = CryptoGifty(_tokenaddress);
	}
	uint256 t = gift_token.token_value;

	struct giftDetails{

		address from;
		uint256 tokencount;
	}

	mapping(address=>giftDetails) giftdata;
	

	function request(uint256 _token) public returns(bool)
	{
		uint256 value = t.mul(_token);
		if(msg.value == value){

			gift_token.mint(msg.sender,_token);
		}
	}

	function send(uint256 _token, address _to) public
	{
		uint256 balance = gift_token.balances[msg.sender];
		if( balance >= _token){

			giftDetails memory gd;
			gd.from - msg.sender;
			gd.tokencount = gd.tokencount+_token;
			giftdata[_to] = gd;
			gift_token.transfer(_to,_token);
		}
	}
}