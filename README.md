# 📚 Paper Tracker

> A git-native AI research agent. Browses arXiv daily, tracks citations, monitors rivals, detects field trends, finds connections between papers, and manages your reading queue — all committed to git.

## What it does

**Daily (8am):**
- Browses arXiv `cs.LG`, `cs.CL`, `cs.CV` for new papers
- Scores each paper 1–5 against your research profile
- Checks if tracked rivals/labs published anything new
- Finds hidden connections between new papers and your existing knowledge base
- Checks Semantic Scholar for new citations of your own papers
- Commits everything to git with a timestamped message

**Weekly (Monday 9am):**
- Detects surging topics and field convergence trends
- Generates a scannable digest: 🔥 must-reads, ⭐ highly relevant, 📌 worth knowing
- Reports your reading velocity and queue depth

**On demand:**
- "What should I read next?" — prioritized recommendation based on your current focus
- "Mark 2501.12345 as read" — moves paper through the queue, prompts for takeaway
- "Show reading stats" — velocity, queue depth, time-to-clear estimate
- "Find connections for 2501.12345" — manual connection search

## Setup

```bash
npm install -g gitclaw

# 1. Edit your research profile
nano memory/MEMORY.md        # research areas, keywords, open problems, your papers

# 2. Add rivals to track
nano memory/rivals.md        # authors and labs to monitor

# 3. Run now
gitclaw --dir . "Run the full daily paper tracking pipeline"

# 4. Start the scheduler (runs automatically every day)
gitclaw schedule start
```

## Features

| Feature | What it does |
|---|---|
| **arXiv Browse** | Scans cs.LG/CL/CV daily, scores papers 1–5 against your profile |
| **Paper Digest** | Structured entry per paper: what it does, why it matters to YOUR work, key insight |
| **Citation Alert** | Monitors Semantic Scholar — alerts when someone cites your papers |
| **Trend Radar** | Detects surging topics, field convergence, new entrants to your area |
| **Reading Queue** | Prioritized unread/reading/read pipeline with velocity tracking |
| **Rival Tracker** | Monitors specific authors/labs — alerts the moment they publish |
| **Connection Finder** | Finds non-obvious links between new papers and your knowledge base |
| **Weekly Report** | Scannable digest with must-reads highlighted |

## File structure

```
paper-tracker/
├── agent.yaml
├── SOUL.md
├── RULES.md
├── memory/
│   ├── MEMORY.md           # ← Edit this: your research profile
│   ├── rivals.md           # ← Edit this: authors/labs to monitor
│   ├── seen-papers.md      # deduplication log
│   ├── citation-log.md     # citation alerts history
│   ├── rival-log.md        # rival publication history
│   └── known-authors.md    # author tracking for trend detection
├── knowledge/
│   ├── papers.md           # growing knowledge base (all tracked papers)
│   ├── connections.md      # discovered paper connections
│   └── pdfs/               # downloaded PDFs
├── queue/
│   ├── unread.md           # prioritized reading queue
│   ├── reading.md          # currently reading (max 3)
│   ├── read.md             # completed + your takeaways
│   └── skipped.md          # consciously skipped
├── reports/                # weekly digest reports
├── schedules/
│   ├── daily-arxiv-scan.yaml   # runs every day at 8am
│   └── weekly-digest.yaml      # runs every Monday at 9am
├── skills/
│   ├── arxiv-browse/
│   ├── paper-digest/
│   ├── citation-alert/
│   ├── trend-radar/
│   ├── reading-queue/
│   ├── rival-tracker/
│   ├── connection-finder/
│   ├── knowledge-update/
│   └── weekly-report/
└── tools/
    ├── fetch-page.yaml
    └── download-pdf.yaml
```

## The git angle

Every paper, every citation alert, every connection found — committed to git:

```bash
git log --oneline              # every day's harvest
git diff HEAD~7                # what was added this week
git log --grep="RIVAL ALERT"   # all rival publications ever
git log --grep="NEW CITATION"  # every time someone cited you
git log --grep="score:5"       # all must-read papers ever found
```

Your research history is version-controlled. Fork it. Share it with your lab. Branch it for a new project.
