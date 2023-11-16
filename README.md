# Eth-Avalanche 3

This is my third module submission of Eth+Avax course where I have created a ERC20token and deployed the smart contract in remix IDE.

## Description

This contract provides a basic implementation of an ERC-20 token with functionalities for minting, approving, transferring , and burning tokens, while ensuring that mint function can only be called by the owner. The token name has been set to 'Tom&Jerry' and token symbol to 'TJ' . A modifer has been added to use it with mint function so that only the owner can mint the tokens.
In this basic implementation , the total supply is set to 0 and decimals as 18 . In each function , we have added error handlers so that it agrees to the condition inside the handlers and returns a boolean value.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Tom&Jerry.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract token_module3{
    string public name="Tom&Jerry";
    string public symbol="TJ";
    uint8 public decimals=18;
    uint256 public totalSupply=0;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    
    address public owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    constructor() {
        
        owner = msg.sender;
    }
    
    function transfer(address _to, uint256 transferamt) public returns (bool) {
        
        require(transferamt <= balanceOf[msg.sender], "Insufficient balance");
        
        balanceOf[msg.sender] -= transferamt;
        balanceOf[_to] += transferamt;
        
        return true;
    }
    
    function approve(address _spender, uint256 apprvamt) public returns (bool) {
        
        allowance[msg.sender][_spender] = apprvamt;
        
        return true;
    }
    function mint(address _to, uint256 mintamt) public onlyOwner returns (bool) {
        
        balanceOf[_to] += mintamt;
        totalSupply += mintamt;
       
        return true;
    }
    function burn(uint256 burnamt) public returns (bool) {
        require(burnamt <= balanceOf[msg.sender], "Insufficient balance");
        
        balanceOf[msg.sender] -= burnamt;
        totalSupply -= burnamt;
        return true;
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or above), and then click on the "Compile Tom&Jerry" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Tom&Jerry" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it . You will be able to successfully mint , burn, transfer, approve Tom&Jerry tokens which is pretty cool! You will also be able to check the balance of each address to check how many Tom&Jerry tokens you have .
## Authors

Lalith Raj 

[@lalithrajrayappa@gmail.com]

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
