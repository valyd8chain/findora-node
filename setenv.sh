#!/bin/bash

export $(grep -v '^#' .env | xargs)
export LIVE_VERSION=$(curl -s https://prod-mainnet.prod.findora.org:8668/version | awk -F\  '{print $2}')
export CHAINDATA_URL=$(curl -s https://prod-${NAMESPACE}-us-west-2-chain-data-backup.s3.us-west-2.amazonaws.com/latest | awk -F , '{print $1}')
