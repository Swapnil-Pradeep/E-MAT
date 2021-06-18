module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 3000000,

      from: '0x52D481283101582450264f0e1964E6B0B7d5679c',
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