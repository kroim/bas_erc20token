var Basecoinit = artifacts.require("./Basecoinit.sol");

contract('Basecoinit', function(accounts) {

  it("should have datetime utils inyected", function() {
    return Basecoinit.deployed().then(function(instance) {
      instance.dateTimeUtils().then(function(dateTime){
        if(!(dateTime > 0x0)){
           assert.fail("DateTime utils not defined!"); 
        }
      });
    });
  });

  it("should be owned by sender address", function() {
    return Basecoinit.deployed().then(function(instance) {
      instance.owner().then(function(theOwner){
        assert.equal(theOwner, accounts[0], "Owner does not match!");
      });
    });
  });

  it("should construct with fixed supply of 1000000 tokens for owner", function() {
    return Basecoinit.deployed().then(function(instance) {
      return instance.balanceOf.call(accounts[0]);
    }).then(function(balance) {
      assert.equal(balance.valueOf(), 1000000, "1000000 wasn't in the first account");
    });
  });

  it("should last one month", function() {
    
  });

  it("should give 500 basecoinit for 1ETH", function() {
    
  });

});
