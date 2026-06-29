---
name: zsh-autocomplete
description: Configura autocompletion zsh dinamica in un repository — analizza il Makefile per trovare target e variabili, crea .zsh_completions/, .envrc, e setup.sh idempotente che aggiunge solo la colla generica a ~/.zshrc. La funzione di completion vive nel repo, non nel sistema. Usa questa skill quando l'utente vuole aggiungere tab-completion a make, configurare direnv in un nuovo repo, o replicare un sistema di autocompletion su una nuova macchina.
---

# zsh-autocomplete

Configura tab-completion dinamica per `make` in un repo, con la logica di completion che vive nel repo stesso (non in `~/.zshrc`).

## Come funziona

- `.envrc` espone `PROJNAME_ROOT="$PWD"` tramite direnv
- `.zsh_completions/_make_<proj>` contiene la funzione di completion
- `~/.zshrc` riceve solo colla generica: hook direnv + un `precmd` che quando `PROJNAME_ROOT` è settato carica la funzione dal repo
- `setup.sh` installa direnv e inietta la colla in `~/.zshrc` in modo idempotente
- I target make sono già completati dinamicamente da `_make` di zsh (legge il Makefile a runtime) — non servono hardcode

## Passaggi

### 1. Leggi il Makefile e proponi all'utente

Cerca variabili con `?=` che potrebbero puntare a directory, es. `STUDY ?=`, `YAML ?=`, `SCENE ?=`. Per ognuna, ipotizza la directory associata cercando nel repo una cartella con nome plausibile (`studies/` per `STUDY`, ecc.) o guardando come la variabile viene usata nel Makefile.

**Prima di fare qualsiasi cosa**, presenta all'utente un riepilogo e aspetta conferma:

```
Ho trovato queste variabili nel Makefile:

  STUDY ?=  →  directory: studies/   (trovata nel repo)
  YAML  ?=  →  directory: ?          (non riesco a dedurla)

I nomi che userei:
  - Variabile root in .envrc: GRANULATION_STUDIES_ROOT
  - Funzione completion:       _make_granulation_studies
  - Marker in ~/.zshrc:        # granulation-studies

Confermi? Vuoi cambiare qualcosa?
```

Procedi solo dopo il via libera. Se l'utente corregge qualcosa, aggiorna tutti i nomi di conseguenza prima di andare avanti.

### 2. Determina i nomi

Dal nome della directory del repo (es. `granulation-studies`):
- `PROJ_UPPER`: uppercase + underscore, es. `GRANULATION_STUDIES`
- `PROJ_SLUG`: lowercase + underscore, es. `granulation_studies`
- Variabile root: `GRANULATION_STUDIES_ROOT`
- Marker in ~/.zshrc: `# granulation-studies`
- Nome funzione completion: `_make_<proj_slug>` es. `_make_granulation_studies`
- File completion: `.zsh_completions/_make_<proj_slug>`

### 3. Crea `.zsh_completions/_make_<proj_slug>`

Template — una sezione per ogni variabile con directory, più il fallback a `_make`:

```zsh
_make_<proj_slug>() {
  local cur=${words[-1]}

  # VAR=<TAB> → lista sottocartelle di <dir>/
  if [[ $cur == VAR=* ]] && [[ -d <dir> ]]; then
    compadd -P 'VAR=' -- <dir>/*(/:t)
    return
  fi

  # Se c'è già un target nella riga (parola senza '='), proponi le variabili ?=
  local w has_target=0
  for w in ${words[2,-2]}; do
    [[ $w != *=* ]] && has_target=1 && break
  done

  if (( has_target )); then
    local -a vars
    vars=(${(f)"$(grep -h '^[A-Za-z_][A-Za-z0-9_]*[[:space:]]*?=' Makefile make/*.mk 2>/dev/null \
      | sed 's/[[:space:]]*?=.*//' \
      | sed 's/^[[:space:]]*//' \
      | sort -u)"})
    compadd -S '=' -- $vars
    return
  fi

  # Nessun target ancora: proponi i target .PHONY
  # Non delega a _make per evitare che zsh aggiunga i file della working directory.
  local -a targets
  targets=(${(f)"$(grep -h '^\.PHONY:' Makefile make/*.mk 2>/dev/null \
    | sed 's/^\.PHONY:[[:space:]]*//' \
    | tr ' ' '\n' \
    | sort -u)"})
  compadd -- $targets
}
```

Adatta il glob (`make/*.mk`) ai file che il progetto include nel Makefile.

### 4. Crea/aggiorna `.envrc`

```bash
export <PROJ_UPPER>_ROOT="$PWD"
```

Se `.envrc` esiste già, aggiungi la riga solo se assente.

### 5. Crea `setup.sh`

```sh
#!/usr/bin/env zsh
set -e

ZSHRC="$HOME/.zshrc"
MARKER="# <repo-name>"
ROOT_VAR="<PROJ_UPPER>_ROOT"
COMP_FILE=".zsh_completions/_make_<proj_slug>"
COMP_FN="_make_<proj_slug>"

# ── direnv ────────────────────────────────────────────────────────────────────
if ! command -v direnv &>/dev/null; then
  if command -v brew &>/dev/null; then
    brew install direnv
  elif command -v apt-get &>/dev/null; then
    sudo apt-get install -y direnv
  else
    echo "ERRORE: installa direnv manualmente: https://direnv.net"; exit 1
  fi
fi

direnv allow "$(dirname "$0:A")"

# ── direnv hook (idempotente, indipendente dal marker) ────────────────────────
if ! grep -qF 'eval "$(direnv hook zsh)"' "$ZSHRC" 2>/dev/null; then
  printf '\neval "$(direnv hook zsh)"\n' >> "$ZSHRC"
fi

# ── precmd per le completion (marcato, idempotente) ───────────────────────────
if grep -qF "$MARKER" "$ZSHRC" 2>/dev/null; then
  echo "→ completion hook già presente in ~/.zshrc, skip."
else
  cat >> "$ZSHRC" <<ZSHEOF

autoload -Uz compinit && compinit -C

$MARKER
_<proj_slug>_completion_precmd() {
  local cur="\${${ROOT_VAR}:-}"
  [[ "\$cur" == "\${_<proj_slug>_last_root:-}" ]] && return
  _<proj_slug>_last_root="\$cur"
  local f="\$cur/$COMP_FILE"
  [[ -n "\$cur" && -f "\$f" ]] && source "\$f" && compdef $COMP_FN make
}
precmd_functions+=(_<proj_slug>_completion_precmd)
ZSHEOF
fi

echo "✓ setup completato. Apri un nuovo terminale per attivare le completion."
```

### 6. Aggiorna `make setup`

Se esiste un target `setup` nel Makefile o in un file incluso, aggiungi `@zsh setup.sh` come primo comando. Se non esiste, crea:

```makefile
.PHONY: setup
setup:
	@zsh setup.sh
```

### 7. Esegui `direnv allow`

```bash
direnv allow
```

### 8. Comunica all'utente

- I file creati/modificati
- Che serve aprire un nuovo terminale dopo `setup.sh`
- Come funziona: entrare nella cartella attiva la completion, uscire la disattiva

## Note

- `setup.sh` è idempotente: rieseguibile senza danni
- La funzione precmd controlla `_last_root` per non ricaricare ad ogni comando
- Il motivo per cui non basta `chpwd`: direnv setta le variabili in `precmd`, quindi `chpwd` arriverebbe troppo presto
- zsh `_make` completa già i target dinamicamente leggendo il Makefile — non serve duplicare quella logica
