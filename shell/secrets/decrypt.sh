#!/usr/bin/env bash

CLIENTS="data/secrets.yaml"
CLIENTS_ENC="data/secrets.encrypted"
PWD=$(pwd)

echo "> Starting decrypt"

sleep 3 # Pause to allow exit

echo "> Decrypting"
sops -d --input-type yaml --output-type binary $PWD/$CLIENTS_ENC > $PWD/$CLIENTS

echo "> Done"

exit 0
