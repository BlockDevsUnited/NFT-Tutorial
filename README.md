# NFT-Tutorial
Deploy an NFT project on Ethereum

This Tutorial assumes you have installed nodejs and npm

## Start Hardhat Project

Create a new directory and install hardhat
```
mkdir NFTutorial
cd NFTutorial
npm install --save-dev hardhat
```

We recommend reviewing the [hardhat documentation and tutorial](https://hardhat.org).

Next, start a hardhat project

```
npx hardhat
```

Select "Create a sample hardhat project". You can say yes to everything.

Now you have a hardhat project ready to go!

## Write NFT Contract Code

First, install Open Zeppelin contracts

```
npm install @openzeppelin/contracts
```

You can delete Greeter.sol.

In the contracts folder, create a new solidity file called NFTee.sol and add the code from the [sample NFTee.sol contract](https://github.com/BlockDevsUnited/NFT-Tutorial/blob/main/contracts/NFTee.sol) in this repo.

Try customizing the solidity code with the name of your NFT.

## Compile the contract

To compile the contract, just go

```
npx hardhat compile
```

## Configuring Deployment

We are going to deploy the NFT contract on the Rinkeby Testnet.

First, make sure you get some rinkeby testnet Ether.  You can get some here: https://faucet.rinkeby.io/

Next, set up a rinkeby provider. You can get one from alchemyapi.io
It should look like: https://eth-rinkeby.alchemyapi.io/v2/......

Next, configure module.exports in hardhat.config.js

```
defaultNetwork: "rinkeby",
networks: {
  hardhat: {
  },
  rinkeby: {
    url: "",
    accounts: [""]
  }
},
solidity: {
  version: "0.8.0"
},
paths: {
  sources: "./contracts",
  tests: "./test",
  cache: "./cache",
  artifacts: "./artifacts"
},
mocha: {
  timeout: 20000
}
```

You must add your own account private key and provider url to the config

## Deploy Contract

First, you must write a deploy script. Go to deploy.js in the scripts folder.

Inside function main(), add the code to deploy your contract similar to [deploy.js](https://github.com/BlockDevsUnited/NFT-Tutorial/blob/main/scripts/deploy.js) in this repo

```
async function main() {
  // We get the contract to deploy
  const GameItem = await ethers.getContractFactory("GameItem");
  const gameItem = await GameItem.deploy();
}
```

If everything is configured properly, you can now deploy. In your terminal, run the deploy command

```
npx hardhat run --network rinkeby scripts/deploy.js
```

To see if your contract has been deployed, check your account in etherscan.io. A new transaction should appear, and the transaction should deploy a new contract!

Tip: It's usefull to save the address of your new smart contract in somewhere you can access it easily

## Verify and Publishing on Etherscan

Now you need to verify and publish your smart contract. This is the next step after deploying.

To verify your contract on etherscan, you must first flatten your entire contract.

- create a folder called flattenedContracts
- execute the command below

```
npx hardhat flatten > ./flattenedContracts/flattenedContract.sol
```
Now you have a new file. This is the flattened contract.

Take the code, and clean it up, then verify and publish it on etherscan.

What does mean cleaning it up in this case? Your new file (the flattened contract) has some comments in it like this:

```
// SPDX-License-Identifier: MIT
```

So you need to guarantee this comment just appears one time in the entire code.

- edit the flattened contract
- go to https://rinkeby.etherscan.io/ and find your smart contract

Click on the option "Contract" that is next to option "Transactions" and then click on the hiperlink "Verify and Publish"

- fill the form

Forms fields:

i) Your smart contract address
ii) The compiler version used
iii) In the Open Source License Type:

- select "MIT License"

Finally you will require to put the Solidity Contract Code in the corresponding form field

- copy and paste your flattened contract code

If everything went well you will have your contract verified and published.

## Play with your new NFT contract

   - Mint token
   - Transfer Token


## View your NFT on OpenSea

- get a metadata link
- Upload to Opensea
- view on opensea
