# Git workflow (vale per tutti i repository)

## Scelta del branch
- PRIMA del primo Edit/Write in una sessione: controlla su che branch sei.
  Se sei su `main` e la modifica non rientra nei casi banali qui sotto, crea
  subito il feature branch — non iniziare a modificare per poi farti bloccare
  dal hook.
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
- Se il repo usa `docs/plans/`, sposta il plan relativo al branch corrente da
  `docs/plans/` a `docs/plans/done/` prima del merge (crea `done/` se manca).
  Includi lo spostamento nei commit del branch.
- A lavoro completato, chiedimi se preferisco:
  (a) aprire una pull request remota, oppure
  (b) fare merge diretto su `main` in locale.
- Procedi solo dopo la mia risposta.

## Corpo della pull request
- La **prima riga del corpo** dichiara l'issue che la PR chiude, in inglese:

  ```
  Closes #219
  ```

  È l'unica cosa che GitHub legge per chiudere l'issue al merge nel branch di
  default. Non il titolo, non un commento, non i messaggi di commit del branch.
- **Le parole chiave sono inglesi** e sono nove: `close`/`closes`/`closed`,
  `fix`/`fixes`/`fixed`, `resolve`/`resolves`/`resolved`. Il resto del corpo
  resta in italiano. Un «Chiude #219» non chiude niente: è il caso vero da cui
  questa regola nasce — la PR #293 di PythonGranularEngine diceva «Chiude #219,
  entrambi i punti», è stata merged, e la #219 è rimasta aperta.
- **Una riga per ogni issue.** `Closes #123, #124` collega solo la prima.
- **Fra parola chiave e numero va uno spazio**, non i due punti.
- **Solo issue dello stesso repo.** `Closes owner/repo#n` crea un rimando, non
  una chiusura: un'issue di un altro repo la chiude una PR su quel repo. Qui si
  scrive senza parola chiave (`Refs owner/repo#n`) — vale per le issue che
  l'analisi d'impatto apre a valle, che vanno citate e non chiuse.
- **Mai dentro un commento HTML o un blocco di codice**: lì GitHub non legge.
- Se la PR non chiude nessuna issue, **dichiaralo** con una riga
  `No issue: <motivo>`. Senza il motivo non si distingue una PR che non ha
  un'issue da una a cui la riga è stata tolta.
- Se il repo ha un `.github/pull_request_template.md`, il corpo segue le sue
  sezioni. Se ha il check `closes-issue`, la riga è anche obbligatoria per il
  merge; dove il check non c'è, la riga si scrive comunque — serve a chiudere
  l'issue, non a passare la CI.

## Pulizia
- Dopo il merge di un branch o la chiusura di una PR, elimina il branch sia in
  locale (`git branch -d`) sia in remoto se presente (`git push origin --delete`).
