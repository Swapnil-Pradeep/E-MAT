let Web3 = require('web3');
let { CONTRACT_ADDRESS, OWNER_ADDRESS } = require('./constants.config');
let TestMath = require('../build/TestMath.json');

let accounts;
let testMath;
var web3;

const initContract = async () => {
    if (typeof web3 !== 'undefined') {
        web3 = new Web3(web3.currentProvider);
    } else {
        web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));
    }
    testMath = new web3.eth.Contract(TestMath.abi, CONTRACT_ADDRESS);
}

const getContractandAccounts = () => {
    accounts = ['0x683dB67680AC3b86D83BB78dBf1a189690b991A1'];
    return { accounts, testMath };
}

module.exports = { initContract, getContractandAccounts };