#!/usr/bin/env bash

DT0=`date +"%Y-%m-%d"`
DT1=`date -v+1d +"%Y-%m-%d"`
DT2=`date -v+2d +"%Y-%m-%d"`
open "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT0}&end_date=${DT0}"
open "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT1}&end_date=${DT1}"
open "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT2}&end_date=${DT2}"
open "https://www.couchsurfing.com/events/search?search_query=Moscow+Russian+Federation&start_date=${DT2}&end_date=${DT2}"

open 'https://vk.com/kocherga_club'

open 'http://meetup.com/'
