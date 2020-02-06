const CarMarket = artifacts.require("CarMarket");

module.exports = function(deployer) {
  deployer.deploy(CarMarket);
};
