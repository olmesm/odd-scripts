#!/usr/bin/env sh

TOOL_FILE=".tool-versions"
TOOLS=$(awk '{print $1}' $TOOL_FILE)

echo "[info] Install all tools as per $TOOL_FILE\n"

for tool in $TOOLS; do
  asdf plugin add $tool
  echo "---"
done

echo "[info] Completed\n"

echo "[info] Install all tool versions as per $TOOL_FILE"

for tool in $(cat $TOOL_FILE); do
  asdf install $tool
  echo "---"
done

echo "[info] Completed\n"
