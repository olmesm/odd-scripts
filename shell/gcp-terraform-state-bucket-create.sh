#!/usr/bin/env bash

PARENT="$(basename $(pwd))"
PROJECT_ID="${1:-$GCP_PROJECT}"
RANDOM_SUFFIX=$(echo "$RANDOM `date`" | md5sum | head -c 6)
BUCKET_NAME="tf-state-${2:-$PARENT}-$RANDOM_SUFFIX"

TEST_COMMAND=`gsutil --version &>/dev/null`
if [[ $? -ne 0 ]]; then
 echo "[error] gsutil is required but not found."
 exit 1
fi

gsutil mb -p $PROJECT_ID gs://"$BUCKET_NAME"

perl -i -pe "s|bucket *= *\".*\"|bucket = \"$BUCKET_NAME\"|" main.tf
