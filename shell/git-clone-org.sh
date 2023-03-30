#¡/usr/bin/env bash

ORGNAME=$1

gh repo list ORGNAME --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo" -- -q 2>/dev/null || (
    cd "$repo"
    # Handle case where local checkout is on a non-main/master branch
    # - ignore checkout errors because some repos may have zero commits, 
    # so no main or master
    git checkout -q main 2>/dev/null || true
    git checkout -q master 2>/dev/null || true
    git pull -q
  )
done