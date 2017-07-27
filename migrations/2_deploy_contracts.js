var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Basecoinit = artifacts.require("./Basecoinit.sol");
var DateTime = artifacts.require("./DateTime.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.deploy(DateTime);

  DateTime.deployed().then(function(instance){
    deployer.deploy(Basecoinit, instance.address);
  })
  
};
