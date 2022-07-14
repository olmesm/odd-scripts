#!/bin/bash

GCP_CLI_VERSION=351.0.0

# Determine if x86 (amd/intel) or arm (mac m1)
if [[ $(uname -m) =~ .*"x86".* ]]; then
    curl -Ss --retry 5 "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCP_CLI_VERSION-linux-x86_64.tar.gz" | tar xz
else
    curl -Ss --retry 5 "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCP_CLI_VERSION-linux-arm.tar.gz" | tar xz
fi

# Add to source
echo 'source ~/google-cloud-sdk/path.bash.inc' >> .bashrc

# Source for gcloud alias
source .bashrc

# Install required components
gcloud components install pubsub-emulator beta
