#!/usr/bin/env zsh

# $ . ./script.sh <node-version>
# ie $ . ./script.sh 12.22.11

VERSION=$1

NODEJS_CONFIGURE_OPTIONS='--with-intl=full-icu --download=all' \
NODEJS_CHECK_SIGNATURES="no" \
asdf install nodejs ref:v$VERSION

mv ~/.asdf/installs/nodejs/{ref-v$VERSION,$VERSION}
asdf reshim nodejs