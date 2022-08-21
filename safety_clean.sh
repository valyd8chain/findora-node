#!/usr/bin/env bash
source setenv.sh
SERV_URL=https://${ENV}-${NAMESPACE}.${ENV}.findora.org

rm -rf ./tendermint/config/addrbook.json
###################
# get snapshot    #
###################

# remove old data 
rm -rf ./findorad
rm -rf ./tendermint/data
rm -rf ./tendermint/config/addrbook.json

# redownload snapshot
wget -O ./snapshot ${CHAINDATA_URL}
mkdir ./snapshot_data
tar zxvf ./snapshot -C ./snapshot_data

mv ./snapshot_data/data/ledger ./findorad
mv ./snapshot_data/data/tendermint/mainnet/node0/data ./tendermint/data

rm -rf ./snapshot_data

docker-compose up -d