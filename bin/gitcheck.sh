#!/usr/bin/env bash

find ~ -type d -name '.git' -print0 | while IFS= read -r -d '' dir; do     # http://askubuntu.com/questions/343727/filenames-with-spaces-breaking-for-loop-find-command
    cd "$dir/.."
    echo $(pwd)
    git status --short
    echo
done


