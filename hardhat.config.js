/** @type import('hardhat/config').HardhatUserConfig */
require('@nomiclabs/hardhat-waffle')
const ALCHEMY_API_KEY="";
const ROPSTEN_PRIVATE_KEY="xPTuCfCxe6J38xsOTd-Ls9P2BmLqml99";
module.exports = {
  solidity: "0.8.9",
  networks:{
    ropsten:{
    url:``,
    accounts:[`https://eth-mainnet.g.alchemy.com/v2/${ROPSTEN_PRIVATE_KEY}`]
    }
  }
};
