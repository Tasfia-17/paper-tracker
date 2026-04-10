---
name: knowledge-update
description: "Persist digested papers to the knowledge base and update memory to prevent reprocessing."
allowed-tools: Bash Read Write
---

# Knowledge Update

Persist new papers to the knowledge base and mark them as seen.

## Steps

1. For each digested paper entry:

   a. Append the full digest entry to `knowledge/papers.md`
   
   b. Append a seen-record to `memory/seen-papers.md`:
      ```
      {YYYY-MM-DD} | arXiv:{id} | score:{n} | {title}
      ```

2. Update stats in `memory/MEMORY.md`:
   - Increment "Total papers tracked" by the number of new papers
   - Update "Last updated" to today's date

3. Run this shell command to commit everything to git:
   ```bash
   cd {agent_dir} && git add knowledge/ memory/ && git commit -m "paper-tracker: {N} new papers — {date}"
   ```

## Why git commit matters

Every paper added is a permanent, timestamped record. The git history IS the research log.
You can `git log --oneline` to see every week's harvest. You can `git diff HEAD~4` to see
what was added in the last month. The knowledge base is version-controlled by design.
