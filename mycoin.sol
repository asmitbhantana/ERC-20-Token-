pragma solidity >=0.4.22 <0.6.0;
// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    //function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    //function approve(address spender, uint tokens) public returns (bool success);
    //function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
   // event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract MyCoin is ERC20Interface{
    string public name = "Life-Coin";
    string public symbol = "LFC";
    uint public decimals = 0;//no decimal points
    
    uint public supply;//how many contact it crates
    address public founder;
    
    mapping(address=>uint) public balances;
    
    event Transfer(address indexed from, address indexed to, uint tokens);

    constructor() public{
        supply = 1000000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
    function totalSupply() public view returns (uint){
        return supply;
    }
    function balanceOf(address tokenOwner) public view returns (uint balance){
        return balances[tokenOwner];
    }
    function transfer(address to, uint tokens) public returns (bool success){
        require(balances[msg.sender]>= tokens && tokens>0);
        balances[to]+=tokens;
        balances[msg.sender]-=tokens;
      emit  Transfer(msg.sender,to,tokens); //saving on ethereumm block
        
        return true;
        
    }
    
}
