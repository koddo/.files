#!/usr/bin/env bash

if [[ -z "$@" ]]; then
    open -a FAHControl
    FAHClient --send-unpause
    # open -a Transmission
    osascript -e 'display notification "good night" with title ""'
    say good night
else
    osascript -e 'quit app "FAHControl"'
    FAHClient --send-pause
    killall Transmission
    # osascript -e 'quit app "Transmission"' --- this didn't work because it asks if we really want to quit
    # I'd like to use killall -QUIT, but in my set up I have a message "Transmission quit unexpectedly"
fi


