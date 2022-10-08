#!/usr/bin/env bash

####################
# 
# !!!
# To use:
# sh scripts/sops.sh [encrypt|decrypt]    config/<ENVIRONMENT>    <SECRET_FILE_TO_EDIT>
# eg sh ./scripts/sops.sh decrypt config/nonprod pol-secrets
# 
####################

PWD=$(pwd)
VAR_ACTION=$1
VAR_FILE_PATH=$2
VAR_FILE_NAME=$3
VAR_SOPS_FILE=${4:-".sops.yaml"}

function decrypt() {
  sops -d $1.yaml 1>/dev/null
  STD_RESULT=$?

  if [ $STD_RESULT -eq 0 ]; then
    sops -d $1.yaml > $1.desopped.yaml
    echo "[info] Written to $1.desopped.yaml" 
  else 
    echo "[error] Failed to decrypt $1.yaml" 
    exit 1
  fi
}

function encrypt() {
  sops -e $1.desopped.yaml 1>/dev/null
  STD_RESULT=$?

  if [ $STD_RESULT -eq 0 ]; then
    sops -e $1.desopped.yaml > $1.yaml
    echo "[info] Written to $1.yaml"
    rm $1.desopped.yaml
  else 
    echo "[error] Failed to encrypt $1.desopped.yaml"
    exit 1
  fi
}

if [ -z "$VAR_FILE_PATH" ]; then
  echo "[error] Please specify the directory with a \".sops.yaml\" in the root."
  
  exit 1
fi

cd $VAR_FILE_PATH

if [ -z "$VAR_SOPS_FILE" ]; then
  echo "[error] Can't find \".sops.yaml\" in the root."
  
  cd $PWD
  exit 1
fi

if [ -z "$VAR_ACTION" ]; then
  echo "[error] Please specify an encrypt or decrypt argument"
  
  cd $PWD
  exit 1
fi

if [ -z "$VAR_FILE_NAME" ]; then
  echo "[error] Please specify a filename without the extension. eg for \"my-secrets.yaml\", type \"my-secrets\""
  
  cd $PWD
  exit 1
fi

if [ "$VAR_ACTION" = "encrypt" ]; then
  encrypt $VAR_FILE_NAME
fi

if [ "$VAR_ACTION" = "decrypt" ]; then
  decrypt $VAR_FILE_NAME
fi

cd $PWD