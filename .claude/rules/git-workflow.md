# Git workflow (vale per tutti i repository)

## Scelta del branch
- Se la modifica è banale e non tocca codice — README, .gitignore, LICENSE,
  documentazione, correzione di refusi — lavora direttamente su `main`.
- Per qualsiasi altra modifica (codice, config, refactoring, nuove feature,
  fix non banali) crea prima un branch dedicato, con nome descrittivo:
  `feat/...`, `fix/...`, `refactor/...`.

## Durante il lavoro sul branch
- Fai un commit a ogni step intermedio significativo, con messaggi chiari e
  atomici. Non accumulare tutto in un unico commit finale.

## Test prima del commit
- Prima di ogni commit, verifica se il repo ha una suite di test (script `test`
  in package.json, pytest, `cargo test`, target `test` nel Makefile, ecc.).
- Se esistono test, eseguili e assicurati che passino TUTTI. Se falliscono,
  non committare: correggi prima.

## Changelog
- Dopo una nuova feature o un refactoring, verifica se il repo ha un changelog
  (es. `CHANGELOG.md`, sezione "Unreleased", o convenzione equivalente).
- Se esiste, aggiornalo OBBLIGATORIAMENTE prima di chiudere il lavoro: aggiungi
  una voce che descriva la modifica in modo chiaro, sotto la categoria corretta
  (Added / Changed / Fixed / Removed o equivalente del progetto).
- Se il repo non ha un changelog, non crearne uno di tua iniziativa.

## Chiusura del lavoro
- A lavoro completato, chiedimi se preferisco:
  (a) aprire una pull request remota, oppure
  (b) fare merge diretto su `main` in locale.
- Procedi solo dopo la mia risposta.

## Pulizia
- Dopo il merge di un branch o la chiusura di una PR, elimina il branch sia in
  locale (`git branch -d`) sia in remoto se presente (`git push origin --delete`).
