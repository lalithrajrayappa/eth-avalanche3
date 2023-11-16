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
