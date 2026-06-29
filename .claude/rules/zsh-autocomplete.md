# zsh-autocomplete (rule)

## Quando si crea un Makefile

Ogni volta che crei o scrivi un `Makefile` in un repository che non ne aveva
uno, al termine chiedi all'utente:

> "Vuoi configurare la tab-completion zsh dinamica per questo Makefile?
> Posso impostare direnv + `.zsh_completions/` + `setup.sh` così i target
> e le variabili make si completano con Tab su qualsiasi macchina.
> Basta un `./setup.sh` la prima volta."

Se l'utente dice sì, usa la skill `zsh-autocomplete`.

Non chiedere se il repo ha già `.zsh_completions/` o `setup.sh` — significa
che il sistema è già configurato.
