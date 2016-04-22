#!/bin/bash

# Simple void-updates.txt parser attempt
# Written by Armin Jenewein <a@m2m.pm>

curl -sL http://repo.voidlinux.eu/void-updates/void-updates.txt | while read line; do

a="$(echo "$line" | xargs)"
w="$(echo $a | wc -w)"

# For packages specified *without* a date string
if [[ "$w" -eq 5 ]]; then
  e=($a)
  echo "Package: ${e[0]}"
  echo "Old Version: ${e[1]}"
  echo "New Version: ${e[3]}"
  echo "Date: UNSPECIFIED"
  echo
fi

# For packages specified *with* a date string
if [[ "$w" -eq 6 ]]; then
  e=($a)
  echo "Package: ${e[0]}"
  echo "Old Version: ${e[1]}"
  echo "New Version: ${e[3]}"
  echo "Date: ${e[4]}"
  echo
fi

done

