#!/bin/sh
# download-pdf.sh — downloads a paper PDF from arXiv
# Input: JSON on stdin with {arxiv_id, title_slug}

INPUT=$(cat)
ARXIV_ID=$(echo "$INPUT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); console.log(JSON.parse(d).arxiv_id)")
SLUG=$(echo "$INPUT" | node -e "const d=require('fs').readFileSync('/dev/stdin','utf8'); console.log(JSON.parse(d).title_slug||JSON.parse(d).arxiv_id)")

PDF_DIR="knowledge/pdfs"
mkdir -p "$PDF_DIR"

FILENAME="${PDF_DIR}/${ARXIV_ID}-${SLUG}.pdf"
URL="https://arxiv.org/pdf/${ARXIV_ID}"

curl -sL --max-time 60 \
  -H "User-Agent: Mozilla/5.0 (research-agent/1.0; paper-tracker)" \
  -o "$FILENAME" "$URL" 2>/dev/null

if [ $? -eq 0 ] && [ -s "$FILENAME" ]; then
  echo "{\"path\": \"$FILENAME\", \"arxiv_id\": \"$ARXIV_ID\", \"url\": \"$URL\"}"
else
  rm -f "$FILENAME"
  echo "{\"error\": \"Failed to download PDF\", \"arxiv_id\": \"$ARXIV_ID\"}"
fi
