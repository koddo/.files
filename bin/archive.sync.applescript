#!/usr/bin/osascript

on run argv
    if (count of argv) is 0 then
       return "usage: on | off"
    else
        set cmdd to item 1 of argv
        if (cmdd is equal to "on") then
            do shell script "open /Applications/Yandex.Disk.app"
            # do shell script "open /Applications/Copy.app"
            do shell script "open /Applications/OneDrive.app"
            do shell script "open '/Applications/Google Drive.app'"
            do shell script "open '/Applications/Dropbox.app'"
        else if (cmdd is equal to "off") then
            tell application "Yandex.Disk" to quit
            tell application "Google Drive" to quit
            # tell application "Copy" to quit
            tell application "OneDrive" to quit
            tell application "Dropbox" to quit
        else
            return "usage: on | off"
        end if
    end if
end run

    
