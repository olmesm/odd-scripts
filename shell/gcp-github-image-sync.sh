#!/usr/bin/env bash

# Duplicate an image from github artifacts to gcp

## Usage
## sh ./scripts/github-gcp-image-sync.sh <tag> <location> <project> <artefact_repo> <image_name>
## eg: $ sh ./scripts/github-gcp-image-sync.sh latest europe-west1 rad-wiki rad-wiki wiki

TAG=${1:-"latest"}
LOCATION=${2:-"europe-west1"}
PROJECT=${3:-"main-project"}
ARTEFACT_REPO=${4:-"main-repo"}
IMAGE_NAME=${5:-"main-image"}

echo ">> Pulling Image"
docker pull ghcr.io/requarks/$IMAGE_NAME:$TAG --platform=x86_64 #   --platform=x86_64 is m1 workaround

echo ">> Tagging Image"
docker tag ghcr.io/requarks/$IMAGE_NAME:$TAG $LOCATION-docker.pkg.dev/$PROJECT/$ARTEFACT_REPO/$IMAGE_NAME:$TAG

echo ">> Pushing Image"
docker push  $LOCATION-docker.pkg.dev/$PROJECT/$ARTEFACT_REPO/$IMAGE_NAME:$TAG
