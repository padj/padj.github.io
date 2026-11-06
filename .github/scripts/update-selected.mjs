// Choose the three "Selected work" publications shown on the homepage and write
// them to _data/selected.json, keyed by the publication's filename (without .md):
//
//   latest      the most recent publication (front-matter `date:`)
//   most_cited  the most cited publication in _data/citations.json; ties go to
//               the more recent one
//   random      a random pick from the remaining publications
//
// Publications with `selected_exclude: true` in their front matter are skipped
// for most_cited and random. Run after update-citations.mjs so counts are fresh.
//
// Usage: node .github/scripts/update-selected.mjs

import { readdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const PUB_DIR = "_publications";
const CITATIONS_FILE = "_data/citations.json";
const OUT_FILE = "_data/selected.json";

function frontMatterField(text, field) {
  const fm = text.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!fm) return null;
  const line = fm[1].match(new RegExp(`^${field}:\\s*['"]?([^'"\\r\\n]*)`, "m"));
  return line && line[1].trim() ? line[1].trim() : null;
}

const citations = JSON.parse(await readFile(CITATIONS_FILE, "utf8")).works ?? {};

const pubs = [];
for (const file of (await readdir(PUB_DIR)).filter((f) => f.endsWith(".md"))) {
  const key = path.basename(file, ".md");
  const text = await readFile(path.join(PUB_DIR, file), "utf8");
  pubs.push({
    key,
    date: frontMatterField(text, "date") ?? key.slice(0, 10),
    exclude: frontMatterField(text, "selected_exclude") === "true",
    cited_by: citations[key]?.cited_by ?? 0,
  });
}
pubs.sort((a, b) => b.date.localeCompare(a.date)); // newest first

const latest = pubs[0];
const eligible = pubs.filter((p) => !p.exclude && p !== latest);
// Stable sort keeps newest-first order among equal counts, so ties go to the more recent.
const mostCited = [...eligible].sort((a, b) => b.cited_by - a.cited_by)[0];
const pool = eligible.filter((p) => p !== mostCited);
const random = pool[Math.floor(Math.random() * pool.length)];

const selected = {
  latest: latest?.key ?? null,
  most_cited: mostCited?.key ?? null,
  random: random?.key ?? null,
};
console.log(selected);

const output = JSON.stringify(selected, null, 2) + "\n";
let existing = "";
try {
  existing = await readFile(OUT_FILE, "utf8");
} catch {
  // first run: no existing file
}
if (output === existing) {
  console.log("No changes.");
} else {
  await writeFile(OUT_FILE, output);
  console.log(`Wrote ${OUT_FILE}`);
}
