pragma solidity ^0.4.21;

contract ERC20{
	//state variables -> storage
	// argumentos de funcion estan en memoria
	// variables locales, structs, array o mapping estan en storage
	// variables locales de valoes estan en stack
	// cuando alguna state variable es llamada en una funcion se copia en memoria y se opera en esta copia	
	address owner;
	uint _totalSupply;
	mapping(address => uint) balances;

	function ERC20() public {
		owner = msg.sender;
		_totalSupply = 10;
		balances[owner] = _totalSupply;
	}


	// Returns the total token supply.


	function totalSupply() public constant returns (uint256){ //18160ddd
		return _totalSupply - balances[owner];
	}


	//Returns the account balance of another account with address _owner.
	function balanceOf(address tokenOwner) public constant returns (uint256 balance){ //70a08231
		return balances[tokenOwner];
	}



	//Transfers _value amount of tokens to address _to, and MUST fire the Transfer event. 
	//The function SHOULD throw if the _from account balance does not have enough tokens to spend.
    function transfer(address to, uint256 tokens) public returns (bool success){ //1e7a7538
    	if (tokens > balances[msg.sender]){
    		return false;
    	}
    	balances[msg.sender] -= tokens;
    	balances[to] += tokens;
    	return true;
    }
}