// Fetch citation counts for each publication from OpenAlex and write them to
// _data/citations.json, keyed by the publication's filename (without .md).
//
// The DOI comes from a `doi:` front-matter field if present, otherwise it is
// extracted from `paperurl:`. Publications with no DOI (e.g. a thesis) are skipped.
// If a lookup fails, the previous value is kept so a transient outage does not
// wipe counts. The file is only rewritten when the data actually changes.
//
// Usage: node .github/scripts/update-citations.mjs

import { readdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const PUB_DIR = "_publications";
const OUT_FILE = "_data/citations.json";
const DOI_RE = /10\.\d{4,9}\/[^\s'"?#<>]+/i;

function frontMatterField(text, field) {
  const fm = text.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!fm) return null;
  const line = fm[1].match(new RegExp(`^${field}:\\s*['"]?([^'"\\r\\n]*)`, "m"));
  return line && line[1].trim() ? line[1].trim() : null;
}

function findDoi(text) {
  for (const field of ["doi", "paperurl"]) {
    const value = frontMatterField(text, field);
    const match = value && value.match(DOI_RE);
    if (match) return match[0].replace(/[.,;)]+$/, "").toLowerCase();
  }
  return null;
}

async function fetchWork(doi) {
  const url = `https://api.openalex.org/works/doi:${encodeURIComponent(doi)}?select=id,cited_by_count`;
  const res = await fetch(url, { headers: { "User-Agent": "padj.github.io citation updater" } });
  if (res.status === 404) return null;
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const json = await res.json();
  return { openalex_id: json.id.replace("https://openalex.org/", ""), cited_by: json.cited_by_count };
}

let previous = { works: {} };
try {
  previous = JSON.parse(await readFile(OUT_FILE, "utf8"));
} catch {
  // first run: no existing data
}

const works = {};
const files = (await readdir(PUB_DIR)).filter((f) => f.endsWith(".md")).sort();

for (const file of files) {
  const key = path.basename(file, ".md");
  const doi = findDoi(await readFile(path.join(PUB_DIR, file), "utf8"));
  if (!doi) {
    console.log(`skip   ${key} (no DOI)`);
    continue;
  }
  try {
    const work = await fetchWork(doi);
    if (!work) {
      console.log(`miss   ${key} (${doi} not in OpenAlex)`);
      continue;
    }
    works[key] = { doi, ...work };
    console.log(`ok     ${key}: ${work.cited_by}`);
  } catch (err) {
    if (previous.works?.[key]) {
      works[key] = previous.works[key];
      console.warn(`error  ${key} (${err.message}); keeping previous value`);
    } else {
      console.warn(`error  ${key} (${err.message})`);
    }
  }
}

const output = JSON.stringify({ source: "OpenAlex", works }, null, 2) + "\n";
const existing = JSON.stringify(previous, null, 2) + "\n";
if (output === existing) {
  console.log("No changes.");
} else {
  await writeFile(OUT_FILE, output);
  console.log(`Wrote ${OUT_FILE}`);
}
