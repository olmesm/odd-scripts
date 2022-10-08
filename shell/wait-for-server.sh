#!/bin/bash

echo "[info] Waiting for service $1..."

count=0

while true; do
  echo "$1"
  curl -f "$1" >/dev/null 2>/dev/null
  if [ $? = 0 ]; then
    echo "[info] $1 is live"
    break
  fi

  count=$count+1

  if [[ $count -eq 20 ]]; then
    echo "[error] Waited too long for $1..."
    exit 1
  fi

  sleep 10
done
