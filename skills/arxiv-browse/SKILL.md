---
name: arxiv-browse
description: "Browse arXiv listing pages for new papers in configured research areas, extract paper metadata, and filter by relevance to the researcher's profile."
allowed-tools: Bash Read Write
---

# arXiv Browse

Browse arXiv to find new papers relevant to the researcher's profile.

## Steps

1. Read `memory/MEMORY.md` to load the researcher's profile, keywords, and research areas
2. Read `memory/seen-papers.md` to get the list of already-processed arXiv IDs
3. For each research area, construct the arXiv listing URL:
   - CS.LG (Machine Learning): `https://arxiv.org/list/cs.LG/recent`
   - CS.CL (Computation and Language): `https://arxiv.org/list/cs.CL/recent`
   - CS.CV (Computer Vision): `https://arxiv.org/list/cs.CV/recent`
   - Use the `fetch-page` tool to load each listing page
4. From each listing page, extract:
   - arXiv ID (e.g. `2501.12345`)
   - Title
   - Authors
   - Abstract snippet
   - Submission date
5. Skip any paper whose arXiv ID appears in `memory/seen-papers.md`
6. For each unseen paper, score relevance 1–5 against the researcher's profile:
   - 5: Directly addresses an open problem or uses exact keywords
   - 4: Closely related method or domain
   - 3: Adjacent — worth knowing about
   - 1–2: Skip
7. Return only papers scored 3 or higher, with their scores and a one-line reason

## Output Format

```
FOUND: 2501.12345 | score:5 | "Efficient KV Cache Compression via..." | Reason: directly addresses KV cache open problem
FOUND: 2501.67890 | score:3 | "Cross-Modal Alignment without..." | Reason: adjacent to cross-modal grounding work
SKIP: 2501.11111 | score:2 | "Survey of NLP benchmarks" | Reason: too general
```
