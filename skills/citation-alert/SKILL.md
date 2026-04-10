---
name: citation-alert
description: "Monitor Semantic Scholar for new citations of the researcher's own papers. Alert when someone cites your work."
allowed-tools: Bash Read Write
---

# Citation Alert

Check if any of the researcher's papers have received new citations since the last check.

## Steps

1. Read `memory/MEMORY.md` — load the researcher's own paper list from the `## My Papers` section
   - Each entry has a Semantic Scholar ID or arXiv ID
2. Read `memory/citation-state.json` — load last known citation counts (create if missing: `{}`)
3. For each of the researcher's papers:
   a. Fetch `https://api.semanticscholar.org/graph/v1/paper/{id}?fields=title,citationCount,citations.title,citations.authors,citations.year,citations.externalIds`
      using the `fetch-page` tool
   b. Parse the JSON response
   c. Compare `citationCount` to the stored count in `citation-state.json`
   d. If new citations exist, extract the new citing papers (those not in previous state)
4. For each NEW citation found:
   - Format an alert entry:
     ```
     🎉 NEW CITATION: "{your paper title}"
     Cited by: "{citing paper title}" — {authors} ({year})
     arXiv: {link if available}
     ```
5. Write updated citation counts back to `memory/citation-state.json`
6. Append all new citation alerts to `memory/citation-log.md` with today's date
7. Update `memory/MEMORY.md` stats: "Total citations: N"

## Output

Print all new citation alerts to stdout. If none: "No new citations since last check."

## Notes

- Semantic Scholar API is free, no key required for basic use
- Rate limit: 1 request per second — add a 1s sleep between requests
- If a paper has no Semantic Scholar ID, try searching by title: `https://api.semanticscholar.org/graph/v1/paper/search?query={title}&fields=title,citationCount`
