pragma solidity ^0.4.2;


// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {

  address bank_account;

	mapping (address => uint) public balances;

	function MetaCoin() public {
    bank_account = msg.sender;
		balances[bank_account] = 10000;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount + (10 * amount) / 100) return false;
		balances[msg.sender] -= amount + (10 * amount) / 100;
		balances[receiver] += amount;
    balances[bank_account] += (10 * amount) / 100;
		return true;
	}

	function getBalance(address addr)  public view returns  (uint) {
		return balances[addr];
	}
}
