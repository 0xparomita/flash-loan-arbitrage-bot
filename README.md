# Flash Loan Arbitrage Bot

This repository contains a high-performance Flash Loan executor built for the Aave V3 protocol. It allows developers to borrow millions in liquidity without collateral, provided the debt is repaid within the same atomic transaction.

## How it Works
1. **Flash Loan**: Borrow assets from Aave V3.
2. **Arbitrage**: Swap the borrowed asset on Uniswap V3 for a profit.
3. **Repayment**: Return the principal plus the small flash loan fee (0.05%) to Aave.
4. **Profit**: Any remaining surplus is sent to the contract owner.



## Key Features
* **Aave V3 Integration**: Uses the latest Pool-based flash loan mechanism.
* **Risk-Free**: If the arbitrage is not profitable, the entire transaction reverts, costing only the gas fee.
* **Optimized Routing**: Hardcoded paths for high-liquidity pairs (e.g., WETH/USDC).

## Prerequisites
* Node.js and Hardhat
* An RPC URL for a network with high liquidity (Arbitrum or Ethereum Mainnet)
* Basic understanding of Uniswap V3 swap paths.

## License
MIT
