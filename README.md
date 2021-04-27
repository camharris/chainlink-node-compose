# Chainlink node docker-compose deployment
This repository is for deploying a test [Chainlink node](https://github.com/smartcontractkit/chainlink)
to the Ethereum Rinkby test network. This docker-compose configuration attempts
to follow the offical [Chainlink Docs on running a node](https://docs.chain.link/docs/running-a-chainlink-node).
This is meant to be a test deployment and is not meant to be ran in production.

This configuration relies on the use of an external ethereum client for
desired network. You can sign up for [Infura](https://infura.io/) in order 
to use their ehtereum client services for this deployment.

## Getting Started
### Requirements: 
- A system with at least 2 gigabytes of ram  
- An ethereum client as provided by [Infura](https://infura.io/)

1. Rename the `.api.example` file to `.api` and add your desired UI login to the first line. This should be a valid email address. One the 2nd line add your desired password for the UI

2. Rename the `.password.example` file to `.password` and add your secure wallet password

3. Move `.api` and `.password` to `chainlink_data` folder

4. Edit the chainlink.env file, update the `ETH_URL` to point to your ethereum 
client. If you'd like to use a different ethereum network other than Rinkby, 
you will need to update the `LINK_CONTRACT_ADDRESS` to reflect the correct network,
for more documentation on the available contract addresses please see Chanlink 
docs [here](https://docs.chain.link/docs/running-a-chainlink-node#create-an-environment-file)
For more documentation on what other configuration variables can be set in this
file see additional docs [here](https://docs.chain.link/docs/configuration-variables)  

5. Start the docker-compose after building: 
```
docker-compose build && docker-compose up
```
