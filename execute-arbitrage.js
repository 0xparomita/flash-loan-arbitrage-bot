const { ethers } = require("hardhat");

async function main() {
    const AAVE_POOL_ADDRESS_PROVIDER = "0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e"; // Mainnet
    const WETH_ADDRESS = "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2";

    const FlashLoan = await ethers.getContractFactory("FlashLoanArbitrage");
    const flashLoan = await FlashLoan.deploy(AAVE_POOL_ADDRESS_PROVIDER);
    await flashLoan.waitForDeployment();

    console.log("FlashLoan contract deployed to:", await flashLoan.getAddress());

    // Requesting a flash loan of 10 WETH
    const loanAmount = ethers.parseUnits("10", 18);
    const tx = await flashLoan.requestFlashLoan(WETH_ADDRESS, loanAmount);
    await tx.wait();

    console.log("Flash loan transaction complete.");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
