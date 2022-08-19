# findora-node
Findora Node

## Setup

#### Set Environment Variables:
1) `cp .env_example .env` and adjust any values as needed.
2) `source setenv.sh`

#### Install the Findora CLI (fn):
1) `curl -LO https://wiki.findora.org/bin/linux/fn && chmod +x fn`
2) `./fn setup -S https://prod-${NAMESPACE}.prod.findora.org`
3) `mkdir keys`
4) `./fn setup -O keys/node.mnemonic`
5) `./fn setup -K keys/priv_validator_key.json`

#### Tendermint Setup:
1) `mkdir tendermint`
2) `docker run --rm -v $(pwd)/tendermint:/root/.tendermint findoranetwork/findorad:${LIVE_VERSION} init --mainnet`
3) `` sudo chown -R `id -u`:`id -g` tendermint/ ``

#### Download Chain Data:
1) `./download_chain.sh`
    - This will take awhile

#### Generate Staking Key:
1) `./generate_staking_key.sh`
2) WRITE DOWN YOUR MNEMONIC ON A PIECE OF PAPER AND KEEP IT SOMEWHERE SAFE. To view it, run `cat keys/node.mnemonic`

## Start Your Node
`docker-compose up -d`

## Checking Your Node
View Logs: `docker logs -f findora_node`

Check Status:
```
curl 'http://localhost:26657/status'
curl 'http://localhost:8669/version'
curl 'http://localhost:8668/version' # Only if you set the 'ENABLE_LEDGER_SERVICE'
curl 'http://localhost:8667/version' # Only if you set the 'ENABLE_QUERY_SERVICE'
```
Check Signing:
`fn show`