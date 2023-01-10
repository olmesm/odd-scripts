#!/usr/bin/env bash

function histo () {
    LINE=$1
    COUNT=$2

    AFTER=${COUNT} / 2
    BEFORE=${LINE} - ${AFTER}

    history | tail -${BEFORE} | head-${AFTER}
}
