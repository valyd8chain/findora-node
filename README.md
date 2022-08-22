# findora-node
Findora Node

## Goals
This repo was created with the following goals in mind:
1) Use `docker-compose` rather than a messy `docker` command to start the node.
2) Simpify the Findora node manual setup process and its overreliance on shell vairables.
3) Avoid the Findora setup requirement of installing the `fn` CLI on the host OS as an executable and use a containizered version of `fn` instead. We have dockerized the CLI [here](https://github.com/valyd8chain/findora-cli-docker-image) and recommend using that image for running `fn` commands.
4) No automated script can `sudo`. These steps have been moved out of scripts in the setup instructions below.

We hope to integrate some of these improvements with the official Findora team as time goes on.

## Setup

#### Prerequistes
- Docker

#### Set Environment Variables:
1) `cp .env_example .env` and adjust any values as needed.
2) `source setenv.sh`

#### Tendermint Setup:
1) `mkdir tendermint`
2) `docker run --rm -v $(pwd)/tendermint:/root/.tendermint findoranetwork/findorad:${LIVE_VERSION} init --mainnet`
3) `` sudo chown -R `id -u`:`id -g` tendermint/ ``

#### Download Chain Data:
1) `./download_chain.sh`
    - This will take awhile
2) `` sudo chown -R `id -u`:`id -g` findorad/ ``

#### Generate Staking Wallet Key:
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
```
docker run --rm -v $(pwd)/keys/node.mnemonic:/home/nonroot/keys/node.mnemonic -v $(pwd)/tendermint/config/priv_validator_key.json:/home/nonroot/keys/priv_validator_key.json -it valyd8chain/findora-cli fn show
```

## Node Maintenance
We've provided modified versions of the Findora update and clean scripts that are `docker-compose` friendly.
- Update/Restart Node: `./update_node.sh`.
- Safety Clean Node: `./safety_clean`
    - Note: Make sure you have stopped your container with `docker-compose down` before running

