---
name: connection-finder
description: "When new papers arrive, find non-obvious connections to papers already in the knowledge base. Surface when two papers are solving the same problem from different angles."
allowed-tools: Bash Read Write
---

# Connection Finder

Make the knowledge base intelligent — find hidden links between papers.

## When to Run

Run after `paper-digest` adds new papers. Takes the newly added papers and cross-references the entire knowledge base.

## Steps

1. Read the newly added papers (passed as input, or read last N entries from `knowledge/papers.md`)
2. Read ALL existing entries in `knowledge/papers.md`
3. For each new paper, analyze against every existing paper for these connection types:

   **Type A — Same Problem, Different Approach**
   - Both papers address the same research challenge
   - But use fundamentally different methods
   - Signal: "Two roads to the same destination"

   **Type B — Method Transfer**
   - Paper A introduced a technique; Paper B applies it to a new domain
   - Signal: "Your earlier paper predicted this"

   **Type C — Contradiction**
   - Paper B's findings contradict or challenge Paper A's claims
   - Signal: "The field is debating this — you should know"

   **Type D — Direct Extension**
   - Paper B explicitly builds on Paper A's work
   - Signal: "This is the follow-up to something you already read"

   **Type E — Your Work Connection**
   - New paper relates to the researcher's OWN papers (from `memory/MEMORY.md`)
   - Signal: "This is directly relevant to what you're building"

4. For each connection found (confidence > 0.7), write a connection note:

```markdown
## 🔗 Connection Found — {date}

**New:** [{new paper title}](arxiv link)
**Connects to:** [{existing paper title}](arxiv link)
**Type:** {Same Problem / Method Transfer / Contradiction / Extension / Your Work}
**Why:** {2 sentences explaining the specific connection}
**Implication for your research:** {1 sentence on what this means for your open problems}
```

5. Append all connections to `knowledge/connections.md`
6. If a contradiction is found, prepend `⚠️ CONTRADICTION:` and add to top of `queue/unread.md`
7. If a "Your Work Connection" is found, prepend `🎯 DIRECTLY RELEVANT:` and alert prominently

## Output

Print a summary: "Found {N} connections: {N} same-problem, {N} contradictions, {N} extensions"
