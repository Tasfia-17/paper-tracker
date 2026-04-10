---
name: rival-tracker
description: "Monitor specific authors and research groups on arXiv. Alert immediately when they publish new work."
allowed-tools: Bash Read Write
---

# Rival Tracker

Watch specific researchers and labs — know what they publish the moment it drops.

## Setup

Rivals are defined in `memory/rivals.md`:
```markdown
## Tracked Authors
- Noam Shazeer | Google DeepMind | https://arxiv.org/search/?searchtype=author&query=Shazeer
- Tri Dao | Together AI | https://arxiv.org/search/?searchtype=author&query=Tri+Dao

## Tracked Labs / Groups
- Meta FAIR | https://arxiv.org/search/?searchtype=all&query=meta+fair&start=0
- Mistral AI | https://arxiv.org/search/?searchtype=all&query=mistral+ai
```

## Steps

1. Read `memory/rivals.md` — load all tracked authors and labs
2. Read `memory/rival-state.json` — load last seen paper IDs per rival (create if missing: `{}`)
3. For each tracked author:
   a. Fetch their arXiv search page using `fetch-page` tool
   b. Extract the 5 most recent paper IDs and titles from the listing
   c. Compare against `rival-state.json` — find any IDs not previously seen
4. For each NEW paper found:
   - Run `paper-digest` on it immediately (treat as score-5 regardless)
   - Format alert:
     ```
     👁️ RIVAL ALERT: {Author/Lab} just published
     "{title}"
     arXiv: {link} | {date}
     {digest entry}
     ```
5. Save updated paper IDs to `memory/rival-state.json`
6. Append alerts to `memory/rival-log.md`
7. Auto-add all rival papers to top of `queue/unread.md`

## Output

Print all rival alerts. If none: "No new publications from tracked researchers."

## Notes

- Run this skill daily as part of the main pipeline
- Rival papers bypass the relevance scoring — always included
- Add new rivals anytime by editing `memory/rivals.md`
