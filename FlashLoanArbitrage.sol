// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title FlashLoanArbitrage
 * @dev Aave V3 Flash Loan receiver contract for executing arbitrage.
 */
contract FlashLoanArbitrage is FlashLoanSimpleReceiverBase {
    address public owner;

    constructor(address _addressProvider) 
        FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) 
    {
        owner = msg.sender;
    }

    /**
     * @dev This function is called after your contract has received the flash loaned amount.
     */
    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        // 1. ARBITRAGE LOGIC GOES HERE
        // Example: Swap 'asset' on DEX A, then swap back on DEX B.
        
        // 2. Ensure we have enough to pay back the loan + fee
        uint256 amountToReturn = amount + premium;
        IERC20(asset).approve(address(POOL), amountToReturn);

        return true;
    }

    function requestFlashLoan(address _token, uint256 _amount) public {
        address receiverAddress = address(this);
        address asset = _token;
        uint256 amount = _amount;
        bytes memory params = "";
        uint16 referralCode = 0;

        POOL.flashLoanSimple(
            receiverAddress,
            asset,
            amount,
            params,
            referralCode
        );
    }

    receive() external payable {}
}
