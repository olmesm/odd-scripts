#!/usr/bin/env sh

TOOL_FILE=".tool-versions"
TOOLS=$(awk '{print $1}' $TOOL_FILE)

echo -e "[info] Install all tools as per $TOOL_FILE\n"

for tool in $TOOLS; do
  asdf plugin add $tool
  echo -e "---"
done

echo -e "[info] Completed\n"

echo -e "[info] Install all tool versions as per $TOOL_FILE"

for tool in $TOOLS; do
  asdf install $tool
  echo -e "---"
done

echo -e "[info] Completed\n"
