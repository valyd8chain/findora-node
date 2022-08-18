#!/bin/bash

export $(grep -v '^#' .env | xargs)
export LIVE_VERSION=$(curl -s https://prod-mainnet.prod.findora.org:8668/version | awk -F\  '{print $2}')