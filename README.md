# 📚 Paper Tracker

> A git-native AI agent that browses arXiv daily, finds papers relevant to your research, and keeps your knowledge base permanently up to date.

## What it does

Every day at 8am, paper-tracker:
1. Browses arXiv listing pages for your research areas
2. Reads every abstract and scores relevance against your profile
3. Writes structured digest entries connecting each paper to your specific work
4. Commits everything to git — your knowledge base grows permanently
5. Generates a scannable weekly report with must-reads highlighted

## Setup

```bash
# 1. Install gitclaw
npm install -g gitclaw

# 2. Edit your research profile
nano memory/MEMORY.md   # add your research areas, keywords, open problems

# 3. Run it now
gitclaw --dir . "Run the full paper tracking pipeline for today"

# 4. Schedule it (runs daily at 8am automatically)
gitclaw schedule start
```

## Customize your profile

Edit `memory/MEMORY.md` to set:
- Your research areas and keywords
- Your current open problems (papers addressing these get score 5)
- arXiv categories to monitor

## Output

- `knowledge/papers.md` — permanent, growing knowledge base of all tracked papers
- `reports/YYYY-MM-DD.md` — weekly digest reports
- `memory/seen-papers.md` — deduplication log
- `git log` — full history of every paper ever added

## File structure

```
paper-tracker/
├── agent.yaml              # Agent manifest
├── SOUL.md                 # Agent identity
├── RULES.md                # Behavioral constraints
├── memory/
│   ├── MEMORY.md           # Your research profile (edit this)
│   └── seen-papers.md      # Deduplication log (auto-managed)
├── knowledge/
│   ├── papers.md           # Your growing knowledge base
│   └── pdfs/               # Downloaded PDFs (optional)
├── reports/                # Weekly digest reports
├── schedules/
│   └── daily-arxiv-scan.yaml  # Runs every day at 8am
├── skills/
│   ├── arxiv-browse/       # Browses arXiv, scores relevance
│   ├── paper-digest/       # Creates structured entries
│   ├── knowledge-update/   # Persists to git
│   └── weekly-report/      # Generates digest
└── tools/
    ├── fetch-page.yaml     # Fetches web pages
    └── download-pdf.yaml   # Downloads PDFs
```

## The git angle

Every paper added is a git commit. Your entire research history is version-controlled:

```bash
git log --oneline          # see every week's harvest
git diff HEAD~7            # what was added this week
git log --grep="score:5"   # find all must-read papers ever
```

Your knowledge base is not a database. It's a git repo. Fork it, branch it, share it.
