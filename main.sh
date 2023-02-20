#!/bin/bash

## Mint

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Mint"* ]]; then
	echo "You are running Mint"

## Start Mint installer

	os/mint/run_mint.sh

fi

## Ubuntu

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Ubuntu"* ]]; then
	echo "You are running Ubuntu"

## Start Mint installer

	os/ubuntu/run_mint.sh

fi

os/mint/run_mint.sh