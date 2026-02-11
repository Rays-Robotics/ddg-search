#!/bin/bash
# DuckDuckGo Search Script
# Usage: ddg-search.sh "query" [count]

QUERY="$1"
COUNT="${2:-5}"

if [ -z "$QUERY" ]; then
  echo "Usage: ddg-search.sh \"query\" [count]"
  exit 1
fi

# Fetch DuckDuckGo HTML results
URL="https://html.duckduckgo.com/html/?q=$(echo "$QUERY" | sed 's/ /+/g')"

curl -s "$URL" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" \
  | grep -o '<a rel="nofollow" class="result__a" href="[^"]*">[^<]*</a>' \
  | sed 's/<a rel="nofollow" class="result__a" href="//g' \
  | sed 's/">/\n/g' \
  | sed 's/<\/a>//g' \
  | head -n $((COUNT * 2)) \
  | paste - - \
  | head -n "$COUNT" \
  | awk -F'\t' '{print "["NR"] " $2 "\n    " $1 "\n"}'
