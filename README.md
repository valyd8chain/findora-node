# findora-node
Findora Node


## Setup

### Set Environment Variables
1) `cp .env_example .env` and adjust any values as needed.
2) `source setenv.sh`

### Tendermint Setup
1) `mkdir tendermint`
2) `docker run --rm -v $(pwd)/tendermint:/root/.tendermint findoranetwork/findorad:${LIVE_VERSION} init --mainnet`