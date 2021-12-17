var Creature = artifacts.require("./Creature.sol");

module.exports = function(deployer) {
  deployer.deploy(Creature);
};
