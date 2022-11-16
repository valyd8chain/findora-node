#!/bin/bash

export $(grep -v '^#' .env | xargs)
export LIVE_VERSION=$(curl -s https://prod-mainnet.prod.findora.org:8668/version | awk -F\  '{print $2}')
export CHAINDATA_URL=$(curl -s https://prod-mainnet-us-west-2-chain-data-backup.s3.us-west-2.amazonaws.com/mainnet-20221116010001.tar.gz | awk -F , '{print $1}')
