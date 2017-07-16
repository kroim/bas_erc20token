var Basecoinit = artifacts.require("./Basecoinit.sol");

contract('Basecoinit', function(accounts) {

  it("should construct with fixed supply of 1000000 tokens for owner", function() {
    return Basecoinit.deployed().then(function(instance) {
      return instance.balanceOf.call(accounts[0]);
    }).then(function(balance) {
      assert.equal(balance.valueOf(), 1000000, "1000000 wasn't in the first account");
    });
  });

  

});
