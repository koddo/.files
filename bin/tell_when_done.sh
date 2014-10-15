#!/bin/bash

# /usr/local/bin/growlnotify --sticky --image /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Clock.icns -m "$*" done
osascript -e "display notification \"$*\" with title \"done\""
say done "$*"
