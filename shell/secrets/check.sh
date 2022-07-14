#!/usr/bin/env bash

CLIENTS="data/secrets.yaml"
HASH_FILE="data/.sops-hash"
PWD=$(pwd)
SKIP_SOPS_CHECK=".skip-sops-git-check"

echo "> Starting check"

if [[ -f $SKIP_SOPS_CHECK ]]; then
  echo "> Skipping check"

  echo "> Removing check file"
  rm $PWD/$SKIP_SOPS_CHECK

  exit 0
fi


if [[ $OSTYPE == 'darwin'* ]]; then #macOS
  FILE_HASH=`cat $PWD/$CLIENTS | md5 | cut -d " " -f1`
else #Linux - since all current devs use either macOS or Linux
  FILE_HASH=`cat $PWD/$CLIENTS | md5sum | cut -d " " -f1`
fi

STORED_HASH=`cat $HASH_FILE`

if [[ "$FILE_HASH" != "$STORED_HASH" ]]; then
  echo "> Change detected.
> Do you need to run \`yarn secrets:encrypt\`?
> If you intentionally want to skip run \`yarn secrets:skip-sops-git-check\`
"
  exit 1
else
  echo "> No \"$CLIENTS\" changes detected"
  exit 0
fi

