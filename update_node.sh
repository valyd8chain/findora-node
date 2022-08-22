#!/usr/bin/env bash
set -ex
source setenv.sh

# remove the exist addrbook file
rm -rf ./tendermint/config/addrbook.json
###################
# Run local node #
###################
docker-compose pull || exit 1
docker-compose down || exit 1
rm -rf ./tendermint/config/addrbook.json
docker-compose up -d

sleep 10

curl 'http://localhost:26657/status'; echo
curl 'http://localhost:8669/version'; echo
curl 'http://localhost:8668/version'; echo
curl 'http://localhost:8667/version'; echo

echo "Local node initialized, please stake your FRA tokens after syncing is completed."