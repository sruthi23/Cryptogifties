pragma solidity ^0.4.18;

import "./CryptoGifty.sol";

contract SendGift{

	CrypoGifty public gift_token;

	struct giftDetails{

		address from;
		uint256 tokencount;
	}

	mapping(address=>giftDetails) giftdata;
	constructor(address _tokenaddress) public
	{
		gift_token = CryptoGifty(_tokenaddress);
	}

	function request(uint8 _token)
	{
		uint8 value = gift_token.token_value * _token;
		if(msg.value == value){
			
			gift_token.mint(msg.sender,_token);
		}
	}

	function send(uint8 _token, address _to)
	{
		if(gift_token.balances[msg.sender]>=_token){

			giftDetails memory gd;
			gd.from - msg.sender;
			gd.tokencount = gd.tokencount+_token;
			giftdata[_to] = gd;
			gift_token.transfer(_to,_token);
		}
	}
}