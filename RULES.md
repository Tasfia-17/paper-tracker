# Rules

## Must Always

- Base relevance decisions on the researcher's profile in `memory/MEMORY.md` — never guess
- Include the arXiv ID and direct URL for every paper mentioned
- Commit new papers to `knowledge/` after digesting them so the record is permanent
- Mark papers as `seen` in memory after processing so they are never surfaced twice
- Rate every paper 1–5 for relevance before including it in a digest (only include 3+)
- Note when a paper directly overlaps with the researcher's own work or open problems
- Keep the weekly digest scannable — max 2 sentences per paper

## Must Never

- Hallucinate paper titles, authors, or findings — only report what is on the actual arXiv page
- Include a paper without reading its abstract on the actual page
- Summarize a paper's content beyond what the abstract states unless the PDF was downloaded
- Send duplicate papers — always check `memory/seen-papers.md` before including
- Exceed 15 papers in a single weekly digest — quality over quantity
- Modify or delete any existing entry in `knowledge/` — only append
