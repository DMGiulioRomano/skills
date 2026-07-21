# Skill on-demand

In `~/.claude/skills/` è linkato solo un nucleo ristretto. Le altre ~20 skill
vivono nel vault `~/github/DMGiulioRomano/skills/.claude/skills/` e non sono
in contesto: non le vedi finché non le attivi.

Quando un task sembra ricadere in un'area coperta da una skill che non hai
elencata — scrittura accademica, revisione prosa italiana, triage GitHub,
refactoring, PRD, Obsidian — leggi `~/github/DMGiulioRomano/skills/CATALOG.md`
e verifica. Non tenerlo in contesto: leggilo quando serve, poi dimenticalo.

Se ne trovi una pertinente: proponila, e se l'utente accetta attivala con
`~/github/DMGiulioRomano/skills/link-skill.sh <nome>`. È invocabile subito,
senza riavviare la sessione.

Consulta il catalogo quando un **task** lo richiede, non quando entri in una
directory nuova: nessun interrogatorio a ogni `cd`.
