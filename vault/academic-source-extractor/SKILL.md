---
name: academic-source-extractor
description: Build a structured Obsidian-compatible knowledge network from academic PDF sources for a university paper (tesina). Produces per-PDF markdown files with YAML frontmatter (bibtex_key, topics), original-language quotes, Italian notes, and [[wikilinks]], plus populates .bib files. Use when working on a tesina, academic paper, or research project where the user has PDF sources and wants to extract, annotate, and connect them as a topic network. Triggers: "estrai fonti", "costruisci rete obsidian", "analizza pdf", "tesina", "academic extraction", "knowledge network from PDFs".
---

# Academic Source Extractor

Constructs a topic-linked knowledge network from academic PDFs for a university paper.

## Quick start

1. Read the existing research plan (if any) in `references/docs/plans/`
2. Ask user for the paper's outline/index to derive topics
3. Run Phase 0 → Phase 1 → Phase 2 → Phase 3 (see Workflows)

---

## Workflows

### Phase 0 — Define topics and rename PDFs

**Topic definition:**
- Extract topic list from the paper outline
- Assign weight: **A** (primary, core chapters), **B** (secondary, context), **C** (peripheral, background)
- Each topic becomes an Obsidian node ID: lowercase, hyphen-separated (e.g. `free-improvisation`)
- Map links between nodes (bidirectional)

**PDF renaming convention:** `cognome_ANNO_parola-chiave.pdf`
- First author surname, lowercase
- `nd` if year unknown; two authors: `cognome1-cognome2`
- Maps directly to BibTeX key: `lewis_1996_...` → key `lewis1996`

```python
# Rename PDFs with newlines or spaces safely
import os
files = os.listdir('references/raw/')
for f in files:
    if '\n' in f or problematic:
        os.rename(f, 'clean_name.pdf')
```

**Output:** plan file at `references/docs/plans/piano-estrazione-fonti.md`

Plan structure:
- Topic table (ID | Label | Capitolo | Peso A/B/C)
- Obsidian link graph (bidirectional `←→`)
- PDF → topics map (which PDF covers which nodes)
- BibTeX entries table
- Extraction order (densest topic coverage first)

---

### Phase 1 — Complete BibTeX entries

For each PDF, determine: author, year, title, journal/publisher, pages/DOI.

Add entries to `docs/bibliografia.bib` (or `discografia.bib` / `sitografia.bib`):

```bibtex
@article{lewis1996,
  author    = {Lewis, George E.},
  title     = {Improvised Music after 1950: Afrological and Eurological Perspectives},
  journal   = {Black Music Research Journal},
  volume    = {16},
  number    = {1},
  pages     = {91--122},
  year      = {1996},
  keywords  = {bib}
}

@phdthesis{hartman2019,
  author  = {Hartman, Lindsey Elizabeth},
  title   = {DIY in Early Live Electroacoustic Music},
  school  = {Louisiana State University},
  year    = {2019},
  note    = {LSU Doctoral Dissertations, n. 4794},
  keywords = {bib}
}
```

Use `@misc` for web articles and pamphlets. Always include `keywords = {bib}`.

---

### Phase 2 — Extract PDFs → Markdown files

For each PDF (in priority order from the plan), produce one `.md` in `references/md_files/`.

**Frontmatter:**
```yaml
---
bibtex_key: "lewis1996"
autore: "Lewis, George E."
titolo: "Improvised Music after 1950: Afrological and Eurological Perspectives"
pubblicazione: "Black Music Research Journal"
anno: 1996
tipo: "articolo"
topics: [free-improvisation, jazz-rimosso, AMM, 1968]
lingua_originale: "english"
pdf_source: "lewis_1996_improvised-music.pdf"
---
```

**Body structure:**
```markdown
## Sintesi

[2–4 righe in italiano sull'argomento rispetto ai topic della tesina]

---

## Estratti per topic

### [[topic-id]] — Label

**p. XX** — contesto della citazione

> "Exact quote in original language."

*Nota:* commento in italiano. Collegamento a [[altro-topic]].

---

### [[altro-topic]] — Label

[stessa struttura]

---

## Connessioni

- [[topic1]] — descrizione del legame
- [[topic2]] — descrizione del legame

## BibTeX

```bibtex
@article{lewis1996,
  ...
}
```
```

**Rules:**
- Quotes always in original language, inside `>` blocks
- Notes always in Italian, in *italic*, immediately after the quote
- Page number mandatory before every quote: `**p. XX**`
- Every topic mention → `[[topic-id]]` wikilink
- Only include passages relevant to the defined topics; skip generic content
- Weight A/B topics get full coverage; weight C topics get brief mention

---

### Phase 3 — Review the network

- Check all `[[wikilink]]` targets exist across files
- Verify BibTeX keys in frontmatter match `docs/bibliografia.bib`
- Optionally create hub pages for weight-A topics that aggregate key quotes
- Update the paper outline (`references/docs/`) with new citations found during extraction

---

## Key decisions to ask the user

Before starting, clarify:
1. Paper length and which chapters are the core (determines topic weights)
2. Extraction depth: only quotes already in the outline, or explore PDFs for new material?
3. Language of notes (default: Italian)
4. Whether to also create Obsidian hub pages per topic (Phase 3 option)

See [REFERENCE.md](REFERENCE.md) for the full template and example extraction.
