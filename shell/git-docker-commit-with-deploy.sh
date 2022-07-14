#!/usr/bin/env bash

# Run with `sh ./deploy.sh <optional commit message>`

IMAGE_NAME="olmesm/environment-test-image"
COMMIT_MESSAGE=${2:-"deploy $(date)"}

echo ">> git committing"
git add .
git commit -m "${COMMIT_MESSAGE}"
git push origin main

echo ">> docker building and tagging as ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} .

echo ">> docker pushing image: ${IMAGE_NAME}"
docker push ${IMAGE_NAME}