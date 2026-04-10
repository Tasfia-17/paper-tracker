/**
 * paper-tracker demo
 * Run: ANTHROPIC_API_KEY=sk-... node demo.js
 */
import { query } from "gitclaw";
import { fileURLToPath } from "url";
import { dirname } from "path";

const __dir = dirname(fileURLToPath(import.meta.url));

const prompt = process.argv[2] ||
  "Run the full daily paper tracking pipeline: browse arXiv for new papers, check rivals, find connections, update the knowledge base, and print a summary of everything found.";

console.log("\n📚 paper-tracker starting...\n");

for await (const msg of query({
  prompt,
  dir: __dir,
  model: "anthropic:claude-sonnet-4-5-20250929",
})) {
  if (msg.type === "delta") process.stdout.write(msg.content);
  if (msg.type === "tool_use") console.error(`\n[tool] ${msg.toolName}(${JSON.stringify(msg.args).slice(0, 80)}...)`);
  if (msg.type === "system" && msg.subtype === "error") console.error(`\n[error] ${msg.content}`);
}

console.log("\n\n✅ Done. Check knowledge/papers.md and reports/ for output.\n");
