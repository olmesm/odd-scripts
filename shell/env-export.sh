#!/bin/bash

## Usage
## . ./export-env.sh <some-other.env>

ENV=${1:-".env"}

while ifs= read line; do
    export `echo $line | envsubst`
done < <(printf '%s\n' `cat $ENV | grep -v '^#'`)
