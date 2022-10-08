#!/bin/bash

echo "[info] Waiting for service $1..."

while true; do
  curl -f "$1" > /dev/null 2> /dev/null
  if [ $? = 0 ]; then
    echo "[info] $1 is live"
    break
  fi

  sleep 2
done
