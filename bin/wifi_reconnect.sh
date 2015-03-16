#!/usr/bin/env bash

# TODO: cross-platform

reconnect () {
    networksetup -setairportpower airport off
    networksetup -setairportpower airport on
    sleep 15
}

reconnect
while [[ $(ifconfig en1 | grep inactive) != "" ]] ; do
    reconnect
done

tell_when_done.sh wifi reconnect
