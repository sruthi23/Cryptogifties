pragma solidity ^0.4.18;

import "./CryptoGifty.sol";
import "./SafeMath.sol";

contract SendGift{

	using SafeMath for uint256;

	CryptoGifty public gift_token;

	struct giftDetails{

		address from;
		uint256 tokencount;
	}
	mapping(address=>giftDetails) giftdata;


	constructor() public
	{
		//gift_token = CryptoGifty(_tokenaddress);
		gift_token = createToken();
	}
	function createToken() internal returns(CryptoGifty) {

		return new CryptoGifty();
	}
	
	function request(uint256 _token) public payable returns(bool)
	{
		uint256 t = gift_token.getValue();
		uint256 value = t.mul(_token);
		if(msg.value == value){

			gift_token.mint(msg.sender,_token);
		}
	}

	function send(uint256 _token, address _to) public{
		uint256 balance = gift_token.getBalance(msg.sender);
		if( balance >= _token){

			giftDetails memory gd;
			//gd.from - msg.sender;
			gd.tokencount = gd.tokencount+_token;
			giftdata[_to] = gd;
			gift_token.transfer(_to,_token);
		}
	}
}