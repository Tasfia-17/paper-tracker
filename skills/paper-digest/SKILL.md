---
name: paper-digest
description: "For each relevant paper found by arxiv-browse, fetch the full abstract page and produce a structured digest entry connecting the paper to the researcher's specific work."
allowed-tools: Bash Read Write
---

# Paper Digest

Turn raw arXiv paper metadata into a structured, researcher-specific digest entry.

## Input

A list of papers from `arxiv-browse` with arXiv IDs and relevance scores.

## Steps

For each paper (score 3+):

1. Fetch the paper's abstract page: `https://arxiv.org/abs/{arxiv_id}`
   - Use `fetch-page` tool
2. Extract from the page:
   - Full title
   - All authors
   - Full abstract text
   - Submission date
   - Subject categories
   - Any linked code (look for "Code" links or GitHub URLs in the page)
3. Read `memory/MEMORY.md` to recall the researcher's open problems and current work
4. Write a digest entry in this exact format:

```markdown
## {Title}
**arXiv:** [{id}](https://arxiv.org/abs/{id}) | **Date:** {date} | **Score:** {1-5}⭐
**Authors:** {authors}
**Categories:** {categories}

**What it does:** {1 sentence, plain English}

**Why it matters to your work:** {1-2 sentences connecting to researcher's specific open problems or keywords}

**Key insight:** {The single most important technical contribution}

**Code:** {link or "not available"}
```

5. If score is 5, prepend `🔥 ` to the title line

## Output

A list of formatted digest entries ready to be written to the weekly report and knowledge base.
