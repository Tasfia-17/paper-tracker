---
name: reading-queue
description: "Manage a prioritized reading queue. Move papers from unread to read, track reading velocity, and surface what you should read next based on your current focus."
allowed-tools: Bash Read Write
---

# Reading Queue

Manage the researcher's paper reading pipeline intelligently.

## Queue Files

- `queue/unread.md` — papers waiting to be read, sorted by priority
- `queue/reading.md` — currently being read (max 3 at a time)
- `queue/read.md` — completed, with date and one-line takeaway
- `queue/skipped.md` — consciously skipped, with reason

## Commands

The agent responds to these natural language commands:

### "add {arxiv_id} to queue"
1. Fetch the paper from `knowledge/papers.md` or arXiv
2. Score urgency: score-5 papers go to top, others sorted by date
3. Append to `queue/unread.md`:
   ```markdown
   ### [{score}⭐] {title}
   **arXiv:** {link} | **Added:** {date} | **Est. read time:** {pages/2} min
   **Why queued:** {one line from digest connecting to your work}
   ```

### "mark {arxiv_id} as read" / "finished {title}"
1. Move entry from `unread.md` or `reading.md` to `read.md`
2. Prompt: "One-line takeaway for your notes?"
3. Append to `read.md` with takeaway and date
4. Update reading velocity in `memory/MEMORY.md`

### "what should I read next"
1. Read `memory/MEMORY.md` for current focus/open problems
2. Scan `queue/unread.md` for papers most relevant to current focus
3. Return top 3 recommendations with reasoning:
   ```
   📖 Read next: "{title}"
   Why now: directly addresses your KV cache open problem
   Est. time: 25 min
   ```

### "reading stats"
Print:
```
📚 Reading Queue Stats
  Unread: {N} papers
  Read this week: {N} | This month: {N}
  Avg per week: {N}
  At this pace, queue clears in: {N} weeks
  Longest unread: "{title}" — {N} days in queue
```

## Auto-population

When `arxiv-browse` finds a score-5 paper, automatically add it to the top of `queue/unread.md`.
