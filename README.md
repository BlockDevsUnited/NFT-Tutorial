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

## Verify on Etherscan

To verify your contract on etherscan, install the Etherscan plugin for Hardhat

```
npm install --save-dev @nomiclabs/hardhat-etherscan
```

Then, get an API Key for Etherscan by signing up at https://etherscan.io/myaccount

Then, we have to configure `hardhat.config.js` to use the plugin

First, add the following `require` statement at the top:
`require("@nomiclabs/hardhat-etherscan");`

Then, add an `etherscan` object in the exported configuration object. 

```
etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: YOUR_ETHERSCAN_API_KEY
  },
```

Once you have done this, run the following command to verify your contract!

`npx hardhat verify --network rinkeby DEPLOYED_CONTRACT_ADDRESS`

After this, load up your contract address on Etherscan, and click on the `Contract` tab to ensure it has been verified!

## Play with your new NFT contract

   - Mint token
   - Transfer Token


## View your NFT on OpenSea

- get a metadata link
- Upload to Opensea
- view on opensea
