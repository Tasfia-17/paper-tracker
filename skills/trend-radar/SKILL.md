---
name: trend-radar
description: "Analyze the last 30 days of tracked papers to detect emerging trends, velocity shifts, and convergent research directions."
allowed-tools: Bash Read Write
---

# Trend Radar

Analyze the knowledge base to surface what the field is actually doing right now.

## Steps

1. Read `knowledge/papers.md` — extract all papers added in the last 30 days
   - Parse each entry's date, title, categories, and "What it does" line
2. Read `memory/MEMORY.md` for the researcher's keywords and research areas
3. Perform trend analysis:

   **a. Topic velocity** — count papers per keyword cluster week-over-week:
   - Group papers by dominant keyword (from title + abstract)
   - Compare this week's count vs last week's count per cluster
   - Flag clusters with >30% increase as "surging"

   **b. Convergence detection** — find independent papers solving the same problem:
   - Look for 3+ papers with different authors proposing similar approaches
   - This signals a "hot problem" the field is converging on

   **c. New entrants** — authors/institutions publishing in your area for the first time
   - Cross-reference author lists against `memory/known-authors.md`
   - New names = new competition or new collaborators

   **d. Method spread** — track when a technique from one domain appears in another
   - e.g., "speculative decoding" appearing in vision papers

4. Generate the trend report in this format:

```markdown
## 📈 Trend Radar — {date}

### 🚀 Surging Topics
- **{topic}**: {N} papers this week vs {M} last week (+{%}%)
  > "{representative paper title}"

### 🎯 Field Convergence
- **{problem}**: {N} independent groups working on this simultaneously
  > Papers: {list of titles}

### 👀 New Players
- **{author/institution}** entered your research area
  > First paper: "{title}"

### 🔀 Cross-Domain Signals
- **{method}** from {domain A} appearing in {domain B}
  > "{paper title}"
```

5. Save to `reports/trends-{date}.md`
6. Append a one-line summary to `memory/MEMORY.md` under `## Trend History`
