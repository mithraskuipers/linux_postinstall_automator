#!/bin/bash

## Mint

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Mint"* ]]; then
	echo "You are running Mint"

## Start Mint installer

	os/mint/run_mint.sh

fi
