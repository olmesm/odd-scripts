#!/usr/bin/env bash

# histo 10 2 #=> returns history from line 10 with 2 lines above and below the command

function histo () {
    LINE=$1
    COUNT=$2

    history | head -$(($LINE + $COUNT)) | tail -$(( 2 * $COUNT + 1))
}
