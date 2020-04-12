#!/usr/bin/env bash

DT0=`date -v+0d +"%Y-%m-%d"`
DT1=`date -v+1d +"%Y-%m-%d"`
DT2=`date -v+2d +"%Y-%m-%d"`
DT3=`date -v+3d +"%Y-%m-%d"`

FF=/Applications/Firefox.app/Contents/MacOS/firefox

function open-win() {
    $FF -new-window "$1"
    sleep 1
}

function open-tab() {
    $FF -new-tab "$1"
}

function first-tab() {
    /usr/bin/env osascript -e 'tell application "System Events" to keystroke "1" using command down'
}

open-win "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT0}&end_date=${DT0}"
open-tab "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT1}&end_date=${DT1}"
open-tab "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT2}&end_date=${DT2}"
open-tab "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT3}&end_date=${DT3}"
# open-tab 'https://vk.com/kocherga_club'
open-tab 'http://meetup.com/'

first-tab
