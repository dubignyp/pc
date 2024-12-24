// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8;

contract TDLToken is ERC20, Ownable {
    address public founder;
    string public description;

    constructor(address _founder, string memory _description) ERC20("DubiLetto", "TDL") {
        require(_founder != address(0), "Founder cannot be null");
        founder = _founder;
        description = _description;
        _mint(msg.sender, 7777777 * 10 ** decimals());
    }

    function mint() public view returns (bool) {
    require(totalSupply() == 7777777 * 10 ** 18, "Token supply is already capped");
    return true;
}
}