	0x60
	0x40
	mstore
	callvalue
	iszero
	@tag_1
	jumpi
	0x0
	dup1
	revert
tag_1:
	jumpdest
	caller //msg.sender {addrss}
	dup1 //{addrss addrss}
	0x0 // owner = msg.sender {0x0 addrss addrss}
	sstore // {addrss} [0x0 -> addrss.owner]
	0x1  //{0x1 addrss}
	0xa //{0xa 0x1 addrss}
	dup1 //{0xa 0xa 0x1 addrss}
	swap3 //{0x1 0xa 0xa addrss}
	sstore //{0xa addrss} [0x0 -> addrss.owner ,0x1 -> 0xa]
	swap1 //{addrss 0xa}
	sstore // [owner = msg.sender; totalSupply = 10; balances[owner] = _totalSupply]
	//preguntar como encontrar la direccion del codigo
 	code_section_size //contract ERC20{\n address ...   TAMAÑO DEL CODIGO
  	dup1 		//	contract ERC20{\n address ...
	code_section_offset	// contract ERC20{\n address ...   UBICACION DEL CODIGO CON RESPECTO AL PRIMER OFFSET
	0x0 //	contract ERC20{\n address ...    DONDE UBICARLO EN MEMORIA
	codecopy 	//	contract ERC20{\n  address ...
	0x0 // contract ERC20{\n  address ... 
	return // contract ERC20{\n address ...
	.data:code_section
		0x60 //{0x60}
		0x40 //{0x40 0x60}
		mstore //{}
		0x4 //{0x4}
		calldatasize //{0x44 0x4}
		lt //me fijo que el selector(?) sea mayor a 4 bytes  {0x0}
		@tag_10 // {tag10 0x0}
		jumpi // {}
		0x0 //dame el dato desde la pos 0 {0x0}
		calldataload //{data}
		0x100000000000000000000000000000000000000000000000000000000 //{0x1.. data}
		swap1 //{data 0x1..}
		div //{instruccion}
		dup1 //{instruccion instruccion}
		0x18160ddd //{0x18160ddd instruccion instruccion}
		eq //{0x18160ddd==instruccion instruccion}
		@totalSupply
		jumpi
		dup1 //{instruccion instruccion}
		0x70a08231
		eq //{0x70a08231==instruccion instruccion}
		@balanceOf
		jumpi
		dup1 //{instruccion instruccion}
		0xA9059CBB
		eq //{0x1e7a7538==instruccion instruccion}
		@transfer
		jumpi
		dup1 //{instruccion instruccion}
		tag_10:
			jumpdest
			0x0
			dup1
			revert
		totalSupply:
			jumpdest
			callvalue
			iszero
			@tag_5
			jumpi
			0x0
			dup1
			revert
		tag_5:
			jumpdest	
			0x1
			sload //{totalSupply instruccion}
			0x0
			sload //{owner totalSupply instruccion}
			sload //{balances[owner] totalSupply instruccion}
			swap1
			sub //{res = balances[owner]-totalSupply instruccion}
			0x40 // {0x40 res instruccion}
			dup1 // {0x40 0x40 res instruccion}
			mload //{0x60 0x40 res instruccion}
			dup1 //{0x60 0x60 0x40 res instruccion}
			swap3 //{res 0x60 0x40 0x60 instruccion}
			swap1 //{0x60 res 0x40 0x60 instruccion}
			mstore //{0x40 0x60 instruccion}
			swap1 //{0x60 0x40 instruccion}
			0x20 //{0x20 0x60 0x40 instruccion}
			add //{0x80 0x40 instruccion}
			swap1 //{0x40 0x80 instruccion}
			mstore // [0x60 -> res, 0x40 -> 0x80] {instruccion}
			pop // {}
			0x20 // s = size return
			0x60 // p = memory position
			return
		balanceOf:
			jumpdest //{instruccion}
			callvalue
			iszero
			@tag_6
			jumpi
			0x0
			dup1
			revert
		tag_6:
			jumpdest //{instruccion}
			0x4 //{0x4 instruccion}
			calldataload //{tokenOwner instruccion}
			dup1 //{tokenOwner tokenOwner instruccion}
			sload //{balance tokenOwner instruccion}
			0x40 // {0x40 balance tokenOwner instruccion}
			dup1 // {0x40 0x40 balance tokenOwner instruccion}
			mload //{0x60 0x40 balance tokenOwner instruccion}
			dup1 //{0x60 0x60 0x40 balance tokenOwner instruccion}
			swap4 //{balance 0x60 0x40 0x60 tokenOwner instruccion}
			swap1 //{0x60 balance 0x40 0x60 tokenOwner instruccion}
			mstore //{0x40 0x60 tokenOwner instruccion}
			swap1 //{0x60 0x40 tokenOwner instruccion}
			0x20 //{0x20 0x60 0x40 tokenOwner instruccion}
			add //{0x80 0x40 tokenOwner instruccion}
			swap1 //{0x40 0x80 tokenOwner instruccion}
			mstore // [0x60 -> res, 0x40 -> 0x80] {tokenOwner instruccion}
			pop //{instruccion}
			pop //{}
			0x20 // s = size return
			0x60 // p = memory position
			return
		transfer:
			jumpdest //{instruccion}
			callvalue  //{0x0 instruccion}
			iszero  //{0x1 instruccion}
			@tag_7 //{tag7 0x1 instruccion}
			jumpi
			0x0
			dup1
			revert
		tag_7:
			jumpdest //{instruccion}
			0x4 //{0x4 instruccion}
			dup1 //{0x4 0x4 instruccion} 
			calldataload //{receiver 0x4 instruccion}
			swap1 //{0x4 receiver instruccion}
			0x20 //{0x20 0x4 receiver instruccion}
			add //{0x24 receiver instruccion}
			calldataload //{token receiver instruccion}
			caller //{msg.sender tokens receiver instruccion}
			sload //{balances[msg.sender] tokens receiver instruccion }
			dup2 //{tokens balances[msg.sender] tokens receiver instruccion} 
			dup2 //{balances[msg.sender] tokens balances[msg.sender] tokens receiver instruccion} 

			gt // {(res = balances[msg.sender] > tokens) balances[msg.sender] tokens receiver instruccion} 
			dup1 // {res res balances[msg.sender] tokens receiver instruccion} 
			@tag_8 // {tag_8 res res balances[msg.sender] tokens receiver instruccion} 
			jumpi // {res balances[msg.sender] tokens receiver instruccion} 
			
			//if false
			 //{res balances[msg.sender] tokens receiver instruccion} 
			0x40 //{0x40 res balances[msg.sender] tokens receiver instruccion} 
			dup1 //{0x40 0x40 res balances[msg.sender] tokens receiver instruccion} 
			mload //{0x60 0x40 res balances[msg.sender] tokens receiver instruccion} 
			dup1 //{0x60 0x60 0x40 res balances[msg.sender] tokens receiver instruccion} 
			swap3 //{res 0x60 0x40 0x60 balances[msg.sender] tokens receiver instruccion} 
			swap1 //{0x60 res 0x40 0x60 balances[msg.sender] tokens receiver instruccion} 
			mstore //{0x40 0x60 balances[msg.sender] tokens receiver instruccion} 
			dup2 //{0x60 0x40 0x60 balances[msg.sender] tokens receiver instruccion} 
			0x20
			add //{0x80 0x40 0x60 balances[msg.sender] tokens receiver instruccion} 
			mstore //{0x60 balances[msg.sender] tokens receiver instruccion} 
			0x20
			swap1 //{0x60 0x20 balances[msg.sender] tokens receiver instruccion} 
			return				
		tag_8: //if true {res balances[msg.sender] tokens receiver instruccion} 
			jumpdest
			swap2 // {tokens balances[msg.sender] res receiver instruccion} 
			dup1 // {tokens tokens balances[msg.sender] res receiver instruccion} 
			swap2 // {balances[msg.sender] tokens tokens res receiver instruccion} 
			sub // {(decrement = balances[msg.sender]-tokens) tokens res receiver instruccion} 
			caller // {msg.sender decrement tokens res receiver instruccion} 
			sstore // {tokens res receiver instruccion} 
			dup3 // {receiver tokens res receiver instruccion} 
			sload // {balances[receiver] tokens res receiver instruccion}
			add // {sum = (balances[receiver] + tokens) res receiver instruccion}
			dup3 // {receiver sum = (balances[receiver] + tokens) res receiver instruccion}
			sstore //{res receiver instruccion}
			0x40 //{0x40 res receiver instruccion }
			dup1 //{0x40 0x40 res receiver instruccion }
			mload //{0x60 0x40 res receiver instruccion }
			dup1 //{0x60 0x60 0x40 res instruccion }
			swap3 //{res 0x60 0x40 0x60 instruccion }
			swap1 //{0x60 res 0x40 0x60 instruccion }
			mstore //{0x40 0x60 instruccion}
			dup2 //{0x60 0x40 0x60 instruccion}
			0x20
			add //{0x80 0x40 0x60 instruccion}
			mstore //{0x60 instruccion}
			0x20
			swap1 //{0x60 0x20 instruccion}
			return