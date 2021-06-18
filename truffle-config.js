module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 3000000,

      from: '0xB84416673E91bbBeCB65865cc7E743caf6AdcFA4',
    },
  },
  contracts_directory: './contracts/',
  contracts_build_directory: './build/',
  compilers: {
    solc: {
      version: "0.6.6",
      settings: {
        optimizer: {
          enabled: true,
          runs: 100
        }
      }
    }
  }
}