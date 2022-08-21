#!/usr/bin/env bash
set -ex
ENV=prod
NAMESPACE=mainnet
LIVE_VERSION=$(curl -s https://${ENV}-${NAMESPACE}.${ENV}.findora.org:8668/version | awk -F\  '{print $2}')

export ROOT_DIR=/data/findora/${NAMESPACE}

# remove the exist addrbook file
rm -rf $(pwd)/tendermint/config/addrbook.json
###################
# Run local node #
###################
docker stop findora_node || exit 1
docker rm findora_node || exit 1
rm -rf $(pwd)/tendermint/config/addrbook.json
docker-compose up -d

sleep 10

curl 'http://localhost:26657/status'; echo
curl 'http://localhost:8669/version'; echo
curl 'http://localhost:8668/version'; echo
curl 'http://localhost:8667/version'; echo

echo "Local node initialized, please stake your FRA tokens after syncing is completed."