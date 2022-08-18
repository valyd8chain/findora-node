#!/bin/bash

mkdir keys

# Generate Keypair
docker run -it -v $(pwd)/keys:/home/nonroot/keys valyd8chain/findora-cli fn genkey > keys/tmp.gen.keypair

# Backup key
cp ./keys/tmp.gen.keypair ./keys/mainnet_node.key

# Backup Mnemonic
echo $(sed -n 's/Mnemonic:\s*//p' ./keys/tmp.gen.keypair) > ./keys/node.mnemonic