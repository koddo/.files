#!/usr/bin/env bash

find ~/.files ~/.emacs.d ~/workspace* -type d -name '.git' -print0 -maxdepth 1 | while IFS= read -r -d '' dir; do     # http://askubuntu.com/questions/343727/filenames-with-spaces-breaking-for-loop-find-command
    cd "$dir/.."
    echo $(pwd)
    git status --short
    echo
done


