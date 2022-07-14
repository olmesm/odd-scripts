#!/bin/bash

R=$(($RANDOM%${1:-7}))

for i in `seq $R`
do
    git commit --allow-empty -m "a commit a day keeps your girlfriend away $1"
done