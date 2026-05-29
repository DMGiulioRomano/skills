# Istruzioni globali

Questo file fornisce il default su tutti i repository della macchina. Le
istruzioni di workflow modulari vivono in `~/.claude/rules/`. I file CLAUDE.md
non si sovrascrivono: vengono concatenati nel contesto, dal più generico
(globale) al più specifico (progetto). In caso di conflitto l'istruzione più
specifica tende a prevalere, ma non è garantito; per un override affidabile,
dichiararlo esplicitamente nel `./CLAUDE.md` di progetto.

Tieni questo file snello (sotto le ~200 righe): il sapere durevole e trasversale
va qui o nelle regole; le specificità di un repo vanno nel suo `./CLAUDE.md`.
