#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Usage: $0 <conference> <year>"
  exit
fi
VENUE=$1
LAST_YEAR=$2
SUBMITTERS="author.csv"
MEMBER_CONFLICTS="conflicts.txt"

if [ ! -f "$SUBMITTERS" ]; then
  echo "Download author.csv from easychair."
  exit
fi
if [ ! -f "$MEMBER_CONFLICTS" ]; then
  echo "Execute conflicts.sh to generate conflicts.txt."
  exit
fi

LC_ALL=C
LC_CTYPE=C
LANG=C

cat "$SUBMITTERS" | cut -d, -f2,3 | tr , " " | sed '/"/d' | tail -n +2 > curAuthors.txt
curl -s "http://dblp.org/search/publ/api?q=year%3A$LAST_YEAR%3Avenue%3A$VENUE&h=1000&format=xml" \
  | xpath '/result/hits/hit/info/authors/author' 2>/dev/null \
  | sed 's/<\/author>/,/g' | tr , '\n' | sed 's/<author>//g' \
  | sed 's/ 0[0-9]*//g' > prevAuthors.txt
cat curAuthors.txt prevAuthors.txt \
  | sed '/^[[:space:]]*$/d;s/[[:space:]]*$//' | sed '/^$/d' \
  | sort | uniq > allAuthors.txt

IFS=$'\n'
for PC_MEMBER in $(cat "$MEMBER_CONFLICTS" | grep " :" | rev | cut -c3- | rev); do
  tmp=$(mktemp)
  cat "$MEMBER_CONFLICTS" | tail -n+$(( $(grep -n "^$PC_MEMBER :" "$MEMBER_CONFLICTS" | cut -d: -f1) + 3 )) > $tmp
  line=$(grep -n "^---"  tmp.txt | head -n1 | cut -d: -f1)
  if [ -z "$line" ]; then
    cat $tmp
  else
    cat $tmp | head -n+$(( line - 3))
  fi | sed 's/ 0[0-9]*//g' | uniq | sort | sed '/^[[:space:]]*$/d;s/[[:space:]]*$//' | sed '/^$/d'> curConflicts.txt
  echo
  echo -- $PC_MEMBER --
  comm -23 allAuthors.txt curConflicts.txt
  comm -12 allAuthors.txt curConflicts.txt | sed 's/^/* /g'
  rm curConflicts.txt
done
rm curAuthors.txt
rm prevAuthors.txt
rm allAuthors.txt
