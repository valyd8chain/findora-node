#!/bin/bash
set -e

mkdir keys

# Generate Keypair
fn genkey > keys/tmp.gen.keypair

# Backup key
cp ./keys/tmp.gen.keypair ./keys/mainnet_node.key

# Backup Mnemonic
echo $(cat ./keys/mainnet_node.key | grep 'Mnemonic' | sed 's/^.*Mnemonic:[^ ]* //') > ./keys/node.mnemonic