#!/bin/bash
set -e

curl -LO https://wiki.findora.org/bin/linux/fn && chmod +x fn
./fn setup -S https://prod-mainnet.prod.findora.org
mkdir keys
./fn setup -O keys/node.mnemonic
./fn setup -K keys/priv_validator_key.json