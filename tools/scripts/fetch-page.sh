#!/bin/sh
# fetch-page.sh — fetches a URL and returns readable text
# Input: JSON on stdin with {url, extract}

INPUT=$(cat)
URL=$(echo "$INPUT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); console.log(JSON.parse(d).url)")
EXTRACT=$(echo "$INPUT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); console.log(JSON.parse(d).extract||'text')")

# Fetch with curl, strip HTML tags with sed for readable text
CONTENT=$(curl -sL --max-time 30 \
  -H "User-Agent: Mozilla/5.0 (research-agent/1.0; paper-tracker)" \
  "$URL" 2>/dev/null)

if [ $? -ne 0 ] || [ -z "$CONTENT" ]; then
  echo '{"error": "Failed to fetch URL", "url": "'"$URL"'"}'
  exit 1
fi

# Strip HTML to plain text
TEXT=$(echo "$CONTENT" | sed 's/<[^>]*>//g' | sed '/^[[:space:]]*$/d' | head -500)

# Extract links if requested
if [ "$EXTRACT" = "links" ] || [ "$EXTRACT" = "both" ]; then
  LINKS=$(echo "$CONTENT" | grep -oE 'href="[^"]*"' | sed 's/href="//;s/"//' | head -50)
  echo "{\"text\": $(echo "$TEXT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); process.stdout.write(JSON.stringify(d))"), \"links\": $(echo "$LINKS" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); process.stdout.write(JSON.stringify(d.trim().split('\n')))")}"
else
  echo "$TEXT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); process.stdout.write(JSON.stringify({text: d}))"
fi
