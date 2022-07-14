#!/bin/bash

# Source for gcloud alias
source .bashrc

# Start the emulator
gcloud beta emulators pubsub start --project="$PUBSUB_PROJECT_ID" --host-port=0.0.0.0:8085
