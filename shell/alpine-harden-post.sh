#!/bin/sh
set -x
set -e

# Essentially a duplicate of scripts/alpine-harden.sh
#   except this removes chown after the service has been built

sysdirs="
  /bin
  /etc
  /lib
  /sbin
  /usr
"

# Remove other programs that could be dangerous.
find $sysdirs -xdev \( \
  -name chown -o \
  \) -delete

# Remove broken symlinks (because we removed the targets above).
find $sysdirs -xdev -type l -exec test ! -e {} \; -delete
