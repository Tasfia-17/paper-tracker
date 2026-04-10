---
name: wiki-build
description: "Build and maintain a personal research wiki from tracked papers, citations, and notes. Creates interlinked articles for authors, topics, methods, and concepts with backlinks -- so the agent can navigate your knowledge like Wikipedia."
allowed-tools: Bash Read Write
---

# Wiki Build

Turn the paper-tracker knowledge base into a navigable personal research wiki.

## Directory Structure

```
wiki/
  _index.md              # master index of all articles with aliases
  _backlinks.json        # reverse link index (who links to whom)
  authors/               # one article per tracked author
  topics/                # research topic articles (KV cache, attention, etc.)
  methods/               # technique articles (speculative decoding, LoRA, etc.)
  papers/                # individual paper articles for score-5 papers
  connections/           # cross-cutting insight articles
  rivals/                # lab and group articles
```

## Commands

The agent responds to these natural language commands:

### "wiki absorb" / "update wiki"

Process all new entries in `knowledge/papers.md` and `knowledge/connections.md` since the last wiki update.

For each new paper digest entry:

1. Extract: title, authors, arXiv ID, date, score, "why it matters" text, key insight
2. For each author -- find or create `wiki/authors/{name}.md`:
   - Add this paper to their publication list
   - Note their research focus based on this paper
   - Link to related author articles via `[[wikilinks]]`
3. For each keyword/topic in the paper -- find or create `wiki/topics/{topic}.md`:
   - Add this paper as evidence
   - Note what angle this paper takes on the topic
   - Link to related topic articles
4. For each method mentioned -- find or create `wiki/methods/{method}.md`:
   - Record how this paper uses or extends the method
5. If score is 5 -- create `wiki/papers/{arxiv-id}.md` with full digest
6. Process `knowledge/connections.md` -- for each connection found:
   - Update both linked paper articles
   - Update the topic articles they share
   - If a contradiction was found, create `wiki/connections/{slug}.md`

After processing:
- Rebuild `wiki/_index.md` with all articles and aliases
- Rebuild `wiki/_backlinks.json` by scanning all `[[wikilinks]]`
- Commit: `git commit -m "wiki: absorb N new papers into research wiki"`

### "wiki query [question]"

Answer a question by navigating the wiki (read-only).

1. Read `wiki/_index.md` -- scan for relevant articles
2. Check `wiki/_backlinks.json` -- high backlink count = central concept
3. Read 3-8 relevant articles, follow `[[wikilinks]]` 2-3 levels deep
4. Synthesize and answer -- cite article names, connect dots, flag gaps

Never read `knowledge/papers.md` directly for queries. The wiki is the knowledge base.

### "wiki status"

Print:
```
Research Wiki Status
  Articles: {N} total ({authors} authors, {topics} topics, {methods} methods, {papers} papers)
  Most connected: {top 5 by backlink count}
  Orphan articles: {articles with 0 backlinks}
  Last updated: {date}
  Papers not yet absorbed: {N}
```

### "wiki cleanup"

Audit every article:
- Stub articles (under 10 lines) that have more source material available -- enrich them
- Bloated articles (over 100 lines) -- split into focused sub-articles
- Broken `[[wikilinks]]` -- fix or remove
- Articles with no backlinks -- add links from related articles
- Rebuild index after cleanup

## Article Format

```markdown
---
title: {Article Title}
type: author | topic | method | paper | connection | rival
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
related: ["[[Related Article]]", "[[Another]]"]
sources: ["arxiv:XXXX.XXXXX", "arxiv:YYYY.YYYYY"]
---

# {Article Title}

{2-3 sentence summary of what this is and why it matters to your research}

## Role in Your Research

{How this author/topic/method connects to your open problems}

## Papers

{List of papers with arXiv links}

## Connections

{Links to related articles via [[wikilinks]]}
```

## Writing Standards

Write like Wikipedia -- flat, factual, encyclopedic. No em dashes. No editorial voice.

The article is about the thing's role in YOUR research, not a general encyclopedia entry.

- "Tri Dao's work on FlashAttention directly addresses the KV cache memory problem in [[KV Cache Efficiency]]"
- NOT: "Tri Dao is a brilliant researcher who has made groundbreaking contributions"

Use `[[wikilinks]]` between articles. Every article should link to at least 2 others.

## Why This Matters

The wiki transforms paper-tracker from a flat log into a navigable knowledge graph.

When you ask "what do I know about speculative decoding?" the agent reads `wiki/topics/speculative-decoding.md`, follows links to `wiki/methods/draft-model.md` and `wiki/authors/leviathan.md`, and gives you a synthesized answer from YOUR accumulated knowledge -- not a web search.

The git history of the wiki is the history of your understanding growing over time.
