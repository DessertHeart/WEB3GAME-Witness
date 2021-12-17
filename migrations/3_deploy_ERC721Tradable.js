var ERC721Tradable = artifacts.require("./ERC721Tradable.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC721Tradable);
};
