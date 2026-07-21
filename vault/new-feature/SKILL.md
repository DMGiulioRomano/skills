---
name: new-feature
description: Full TDD workflow for new features and refactoring in the PythonGranularEngine project. Creates feature branch, runs impact analysis, proposes design, then drives red-green-refactor via /tdd. Use when user says "new feature", "nuova funzionalità", "refactoring", or invokes /new-feature.
---

# New Feature

Avvia il workflow completo per una nuova funzionalità o refactoring.

## Procedura obbligatoria

1. **Branch**: crea un feature branch con nome `feature/$ARGUMENTS`
   ```bash
   git checkout -b feature/$ARGUMENTS
   ```

2. **Impact analysis**: leggi i moduli coinvolti e identifica dipendenze

3. **Design**: proponi il design della soluzione in italiano.
   Attendi approvazione esplicita prima di procedere.

4. **Test suite**: elenca i comportamenti da testare (non i passi implementativi).
   Attendi conferma prima di procedere.

5. **TDD loop**: esegui `/tdd` per il workflow red→green→refactor.
   Segui tracer bullet (un test → una implementazione) — no horizontal slicing.

6. **Test gate**: verifica suite completa verde prima di chiudere.
   ```bash
   make tests
   ```

**Non saltare nessun passaggio. Non generare codice di produzione prima del passaggio 4.**
Lingua: italiano.
