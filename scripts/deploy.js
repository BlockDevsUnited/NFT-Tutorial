async function main() {
  // We get the contract to deploy
  const GameItem = await ethers.getContractFactory("GameItem");
  const gameItem = await GameItem.deploy();

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
