#!/usr/bin/env bash

CLIENTS="data/secrets.yaml"
CLIENTS_ENC="data/secrets.encrypted"
HASH_FILE="data/.sops-hash"
PWD=$(pwd)

echo "> Starting encrypt"

sleep 3 # Pause to allow exit

echo "> Encrypting"
sops -e --input-type binary $PWD/$CLIENTS >$PWD/$CLIENTS_ENC

echo "> Updating hash"
if [[ $OSTYPE == 'darwin'* ]]; then #macOS
  cat $PWD/$CLIENTS | md5 > $HASH_FILE
else #Linux - since all current devs use either macOS or Linux
  cat $PWD/$CLIENTS | md5sum > $HASH_FILE
fi

echo "> Done"

exit 0
