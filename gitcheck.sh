#!/usr/bin/env bash

for d in $(find ~ -name ".git"); do
    cd $d/..;
    echo `pwd`
    git status
    echo
done


