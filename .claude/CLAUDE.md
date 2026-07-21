# Istruzioni globali

Questo file fornisce il default su tutti i repository della macchina. Le
istruzioni di workflow modulari vivono in `~/.claude/rules/`. I file CLAUDE.md
non si sovrascrivono: vengono concatenati nel contesto, dal più generico
(globale) al più specifico (progetto). In caso di conflitto l'istruzione più
specifica tende a prevalere, ma non è garantito; per un override affidabile,
dichiararlo esplicitamente nel `./CLAUDE.md` di progetto.

Tieni questo file snello (sotto le ~200 righe): il sapere durevole e trasversale
va qui o nelle regole; le specificità di un repo vanno nel suo `./CLAUDE.md`.

## Skill on-demand

Le skill elencate nel tuo contesto sono solo un nucleo. Le altre stanno nel
vault `~/github/DMGiulioRomano/skills/` e non le vedi finché non le attivi.
Se un task sembra coperto da una skill che non hai (prosa italiana, scrittura
accademica, triage GitHub, refactoring, PRD, Obsidian), leggi il catalogo
`~/github/DMGiulioRomano/skills/CATALOG.md`, proponi la skill pertinente e
attivala con `skills/link-skill.sh <nome>`: è invocabile subito, senza riavvio.
Consulta il catalogo quando serve a un **task**, non a ogni cambio di directory,
e non tenerlo in contesto.
