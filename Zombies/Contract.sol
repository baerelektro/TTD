pragma ton-solidity >= 0.50.0;
pragma AbiHeader expire;

contract ZombieFactory {
    uint _dnaDigits = 16;
    uint _dnaModulus = 10 ** _dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public _zombies;

    function _createZombie(string name, uint dna) private
    {
        _zombies.push(Zombie(name, dna));
    }

    function _generateDna(string name) private view returns (uint)
    {
        uint hash = tvm.hash(name);
        return hash % _dnaModulus;
    }

    function createZombie(string name) public returns (uint)
    {
        tvm.accept();
        uint randDna = _generateDna(name);
        _createZombie(name, randDna);
        return _zombies.length - 1;
    }

    function getZombieDna(uint id) public view returns (uint)
    {
        return _zombies[id].dna;
    }

    function getZombieName(uint id) public view returns (string)
    {
        return _zombies[id].name;
    }

    function zombieCount() public view returns (uint)
    {
        return _zombies.length;
    }
}
