#!/usr/bin/env bash

mkdir -p $(dirname "$GOOGLE_APPLICATION_CREDENTIALS")

echo "$BASE64_GOOGLE_APPLICATION_CREDENTIALS" | base64 -d > "$GOOGLE_APPLICATION_CREDENTIALS"
