#!/bin/bash

wget -O "$(pwd)/snapshot" "${CHAINDATA_URL}"
mkdir ./snapshot_data
tar zxvf ./snapshot -C ./snapshot_data
mv ./snapshot_data/data/ledger ./findorad
rm -rf ./tendermint/data
mv ./snapshot_data/data/tendermint/${NAMESPACE}/node0/data ./tendermint/data
rm -rf ./snapshot_data