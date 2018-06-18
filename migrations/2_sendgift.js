var SendGift = artifacts.require("./SendGift");

module.exports = function(deployer, network, accounts) {
	
	deployer.deploy(SendGift).then(async () => {
		const instance = await SendGift.deployed();
		const token = await instance.gift_token.call();
		console.log('Token Address', token);
	});
};
