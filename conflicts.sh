#!/bin/bash
# Prints the list of co-authors of the PC members (pc.txt) from the last 5 years.

LC_ALL=C
LC_CTYPE=C
LANG=C
while read person; do
  echo ""
  urlpt=$(echo "$person" | sed 's/ /_/g' | sed 's/\.//g' | tr '[:upper:]' '[:lower:]')
  echo $person : $urlpt
  echo -----------------------
  tmp=$(mktemp)
  year=$(date +"%Y")
  for year in $(seq $((year - 4)) $year); do
    curl -s "http://dblp.org/search/publ/api?q=year%3A$year%3Aauthor%3A$urlpt&h=1000&format=xml" \
    | xpath '/result/hits/hit/info/authors/author' 2>/dev/null >> $tmp
  done
  if [ -s $tmp ]; then
    echo "Cannot download previous submitters. Check internet connection or DBLP query."
    exit
  fi
  cat $tmp | sed 's/<\/author>/,/g' | tr , '\n' | sed 's/<author>//g' | sort | uniq
done < pc.txt
