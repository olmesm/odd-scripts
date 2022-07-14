#!/bin/bash

rev_desc=$(git describe --tags)
major=0
minor=0
build=0
commits=0

regex="([0-9]+).([0-9]+).([0-9]+)-?([0-9]+)?"
if [[ $rev_desc =~ $regex ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  build="${BASH_REMATCH[3]}"
  commits="${BASH_REMATCH[4]}"
fi

build=$((build + commits))

echo "${major}.${minor}.${build}"
