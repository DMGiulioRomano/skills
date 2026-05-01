# Reference — Academic Source Extractor

## Complete MD file example

```markdown
---
bibtex_key: "emmerson1991"
autore: "Emmerson, Simon"
titolo: "Live electronic music in Britain: three case studies"
pubblicazione: "Contemporary Music Review"
anno: 1991
tipo: "articolo"
topics: [gentle-fire, intermodulation, west-square, AMM, strumentazione-fluida, live-electronics]
lingua_originale: "english"
pdf_source: "emmerson_1991_live-elec-britain.pdf"
---

## Sintesi

Emmerson analizza tre ensemble britannici di live electronics attivi tra il 1968 e il 1985 (Gentle Fire, Intermodulation, West Square), mostrando come ciascuno rappresenti un diverso rapporto tra composizione, improvvisazione e tecnologia elettronica.

---

## Estratti per topic

### [[gentle-fire]] — Gentle Fire — caso di studio

**p. 180** — formazione del gruppo

> "Gentle Fire 'was formed in the summer of 1968 at York University, as an extension of live-electronic performances given by Hugh Davies and Richard Orton.'"

*Nota:* La fondazione del gruppo è strettamente legata all'attività didattica di [[davies]] a York. Collegamento diretto con [[DIY]] — il gruppo opera con strumentazione autocostruita fin dall'inizio.

---

**p. 180** — strumentazione fluida

> "This lack of definition was in some part due to Hugh Davies who is well known as an 'inventor' of a vast array of 'sounding objects' and small electronic devices which were sometimes used by the other performers."

*Nota:* Evidenzia [[strumentazione-fluida]] come tratto distintivo di Gentle Fire rispetto agli altri ensemble della scena. Rilevante anche per [[live-electronics]].

---

### [[intermodulation]] — Intermodulation — caso parallelo

**p. 181** — fondazione

> "Intermodulation was founded by Roger Smalley and Tim Souster in 1969 while both were based at Kings College, Cambridge."

*Nota:* Intermodulation nasce nell'orbita di [[stockhausen]] (Souster era al BBC Radio 3). Utile come contrappunto a Gentle Fire per il capitolo 4.

---

### [[west-square]] — West Square — contrappunto istituzionale

**p. 183** — postura compositiva

> "West Square's concerts never featured completely free or improvisatory scores."

*Nota:* West Square come polo opposto a [[free-improvisation]] nella scena britannica. Utile come nodo di contrasto nella rete.

---

## Connessioni

- [[gentle-fire]] — caso di studio principale, pp. 179–185
- [[davies]] — figura centrale nella formazione di Gentle Fire
- [[intermodulation]] — caso parallelo, fondazione 1969
- [[west-square]] — contrappunto istituzionale
- [[AMM]] — menzionata come precedente radicale (p. 180)
- [[strumentazione-fluida]] — tratto distintivo di Gentle Fire
- [[live-electronics]] — pratica comune a tutti e tre i gruppi
- [[stockhausen]] — influenza condivisa (p. 180, nota 4)

## BibTeX

```bibtex
@article{emmerson1991,
  author   = {Emmerson, Simon},
  title    = {Live electronic music in Britain: three case studies},
  journal  = {Contemporary Music Review},
  volume   = {6},
  number   = {1},
  pages    = {179--195},
  year     = {1991},
  doi      = {10.1080/07494469100640191},
  keywords = {bib}
}
```
```

---

## Topic weight guide

| Weight | Coverage in MD | BibTeX required | Hub page |
|--------|---------------|-----------------|----------|
| A (primary) | Full — all relevant passages | Yes | Optional |
| B (secondary) | Selective — key passages only | Yes | No |
| C (peripheral) | Brief mention — 1–2 quotes max | Yes | No |

---

## Common BibTeX types

| Source type | BibTeX type | Required fields |
|-------------|-------------|-----------------|
| Journal article | `@article` | author, title, journal, volume, number, pages, year |
| Book | `@book` | author, title, publisher, year |
| PhD thesis | `@phdthesis` | author, title, school, year |
| Book chapter | `@incollection` | author, title, booktitle, editor, publisher, year, pages |
| Web article | `@misc` | author, title, howpublished, year, note |
| Pamphlet/standalone | `@misc` | author, title, year |

Always add `keywords = {bib}` (or `dis` / `sit`) to route to the correct bibliography section.

---

## PDF naming edge cases

| Situation | Convention |
|-----------|-----------|
| Two authors | `cognome1-cognome2_ANNO_keyword.pdf` |
| Unknown year | `cognome_nd_keyword.pdf` |
| Unknown author | `unknown_nd_keyword.pdf` → rename once identified |
| Institutional author | `istituzione_ANNO_keyword.pdf` |
| Filename has newlines | Use Python `os.listdir()` + `os.rename()`, not shell |

```python
# Safe rename for filenames with newlines
import os
files = os.listdir('references/raw/')
for f in files:
    if 'AuthorKeyword' in f:
        os.rename(f, 'author_2024_keyword.pdf')
```

---

## Obsidian link graph conventions

- All links are bidirectional conceptually; write them in both source files
- Format in body: `[[topic-id]]` (no display alias needed)
- In the `## Connessioni` section: `- [[topic-id]] — brief description`
- Topic IDs are lowercase, hyphen-separated, stable across all files
- A topic mentioned only once still gets a `[[wikilink]]` — it becomes an orphan node in the graph, useful for future expansion
