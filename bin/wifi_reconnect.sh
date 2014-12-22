#!/usr/bin/env bash

# TODO: cross-platform

while [[ $(ifconfig en1 | grep inactive) != "" ]] ; do
    networksetup -setairportpower airport off
    networksetup -setairportpower airport on
    sleep 15
done


