const { getContractandAccounts } = require('../config/contracts.config');

const addTwoNumbers = async (req, res) => {
    const one = 15;
    const two = 7;

    const { accounts, testMath } = getContractandAccounts();

    await testMath.methods.firstNoSet(one).send({ from: accounts[0] });
    await testMath.methods.secondNoSet(two).send({ from: accounts[0] });

    
    let number = await testMath.methods.add().call({ from: accounts[0] })
    console.log(number);
    res.send({ number });
}


module.exports = {
    addTwoNumbers
}