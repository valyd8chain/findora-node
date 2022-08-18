# findora-node
Findora Node

## Setup

### Set Environment Variables
1) `cp .env_example .env` and adjust any values as needed.
2) `source setenv.sh`

### Tendermint Setup
1) `mkdir tendermint`
2) `docker run --rm -v $(pwd)/tendermint:/root/.tendermint findoranetwork/findorad:${LIVE_VERSION} init --mainnet`

### Download Chain Data
1) `./download_chain.sh`
    - This will take awhile

### Generate Staking Key
1) `./generate_staking_key.sh`
2) WRITE DOWN YOUR MNEMONIC ON A PIECE OF PAPER AND KEEP IT SOMEWHERE SAFE. To view it, run `cat keys/node.mnemonic`

