#!/bin/bash
set -e

mkdir keys

# Generate Keypair
fn genkey > keys/tmp.gen.keypair

# Backup key
cp ./keys/tmp.gen.keypair ./keys/mainnet_node.key

# Backup Mnemonic
#TODO echo $(sed -n 's/Mnemonic:\s*//p' ./keys/tmp.gen.keypair) > ./keys/node.mnemonic