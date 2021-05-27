# bas_erc20token
Basecodeit's ERC20Token-compliant
The purpose of this series of post is to create a token based on Ethereum, called it “basecoinit” ?

A very simple smart contract ICO example (read here if you don’t know what an ICO is) for this token, should have this rules:

– Token will be bought using Ethereum.
– There will be a fixed supply of Basecoinit tokens: 300000 for the owner, and 700000 for public availability
– The token sale will last one month
– When a user buys basecoinits they will receive – 1ETH = 100 of our token
(being the price of 1 basecoinit= 1 ether / 100)
– Depending on the date of buy, the user could get a bonus of coins, giving:

Week 1 – they will receive 25% bonus
Week 2 – they will revive 15% bonus
Week 3 – They will receive 10% bonus
Week 4 – they will receive no bonus

– The owner only can set the start date and the end date
– If the number of tokens are sold before the end date, then the token sale ends
– Owner is whoever deploy the contract

Solidity code
The code (truffle project) is here:
https://github.com/gabrielbasecodeit/bas_erc20token

In part 2, we will be doing the contract more ERC20 compliant, and we’ll add some standards patterns to get the ICO more secure.

If you have a Windows based system, and you want to try this code in your local environment, read this.
