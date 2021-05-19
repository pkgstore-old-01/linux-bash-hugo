#!/usr/bin/bash

(( ${EUID} == 0 )) &&
  { echo >&2 "This script should not be run as root!"; exit 1; }

hugo() {
  hugo=$( which hugo )
  echo "${hugo}"
}

year() {
  year=$( date -u '+%Y' )
  echo "${year}"
}

month() {
  month=$( date -u '+%m' )
  echo "${month}"
}

timestamp() {
  timestamp=$( date -u '+%s%N' | cut -b1-13 )
  echo "${timestamp}"
}

new_post() {
  "$( hugo )" new posts/"$( year )"/"$( month )"/"$( timestamp )"
}

"$@"
