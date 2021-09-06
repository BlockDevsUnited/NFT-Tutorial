# NFT-Tutorial
Deploy an NFT project on Ethereum

This Tutorial assumes you have installed nodejs and npm

## Resources for Beginners
If this is your first time to develop ethereum contracts you can follow the resources below to get started:
1. Set up a development environment. This project can be completed in [Remix - Ethereum IDE](https://remix.ethereum.org/). For more complex project, we recommend a development environment such as [Visual Studio Code](https://code.visualstudio.com/) with [Solity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) extention installed.
1. Set up a HardHat project using [OpenZeppelin Learn](https://docs.openzeppelin.com/learn/)
1. Become familiar with Solidity Programming Lanuguage using a tutorial such as [BEGINNER SOLIDITY TUTORIAL (Learn Solidity in 45 Minutes 2021)](https://www.youtube.com/watch?v=_T_LC-hXU8U)

## Start Hardhat Project

Create a new directory and install hardhat
```
mkdir NFTutorial
cd NFTutorial
npm install --save-dev hardhat
```

We recommend reviewing the hardhat documentation here

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

In the contracts folder, create a new solidity file called myNFT.sol and add the following code

```
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("GameItem", "ITM") {}

    mapping(uint => string) tokenURIs;

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
      return tokenURIs[tokenId];
    }

    function create(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        tokenURIs[newItemId] = tokenURI;

        return newItemId;
    }
}

```
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

Inside function main(), add the code to deploy your contract

```
async function main() {
  // We get the contract to deploy
  const myNFT = await ethers.getContractFactory("myNFT");
  const myNFT = await myNFT.deploy();
}
```

If everything is configured properly, you can now deploy. In your terminal, run the deploy command

```
npx hardhat run --network rinkeby scripts/deploy.js
```

To see if your contract has been deployed, check your account in etherscan.io. A new transaction should appear, and the transaction should deploy a new contract!

## Verify on Etherscan

To verify your contract on etherscan, you must first flatten your entire contract.

```
npx hardhat flatten
```

Take the code, and clean it up, then verify it on etherscan.

## Play with your new NFT contract

   - Mint token
   - Transfer Token


## View your NFT on OpenSea

- get a metadata link
- Upload to Opensea
- view on opensea
