#!/usr/bin/env bash

# Run with `sh ./deploy.sh <optional commit message>`

COMMIT_MESSAGE=${1:-"deploy $(date)"}
IMAGE_NAME=${2:-"olmesm/environment-test-image"}

echo "[info] git committing"
git add .
git commit -m "${COMMIT_MESSAGE}"
git push origin main

echo "[info] docker building and tagging as ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} .

echo "[info] docker pushing image: ${IMAGE_NAME}"
docker push ${IMAGE_NAME}