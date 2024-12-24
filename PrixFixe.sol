// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FixedPriceToken is ERC20 {
    uint256 public constant PRICE_PER_TOKEN = 1 * 10**18; // 1 USD (1 token = 1 USD, en utilisant 18 décimales pour simuler USD)

    constructor() ERC20("FixedPriceToken", "FPT") {}

    function buyTokens() external payable {
        uint256 tokenAmount = msg.value * 10**18; // Calculer le nombre de tokens à acheter, basé sur la valeur envoyée (en ETH)
        require(tokenAmount <= balanceOf(address(this)), "Pas assez de tokens disponibles.");
        _transfer(address(this), msg.sender, tokenAmount);
    }

    function sellTokens(uint256 amount) external {
        require(amount <= balanceOf(msg.sender), "Vous n'avez pas assez de tokens.");
        uint256 etherAmount = amount / 10**18; // Remarque : 1 token = 1 USD
        payable(msg.sender).transfer(etherAmount);
        _transfer(msg.sender, address(this), amount);
    }

    function withdraw() external {
        payable(owner()).transfer(address(this).balance);
    }
}