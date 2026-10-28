# Attribuzione

Questa skill è un adattamento della skill `youtube-transcript`:

- **Upstream:** [intellectronica/agent-skills](https://github.com/intellectronica/agent-skills/tree/main/skills/youtube-transcript)
- **Autore:** Eleanor Berger (@intellectronica)
- **Commit sorgente:** `029392d7f8d498ffe303ddbaca2c8f33a71383b5` (main, 2026-01-20)
- **File sorgente:** `SKILL.md`, `scripts/get_transcript.py`
- **Licenza upstream:** CC0-1.0 (pubblico dominio, nessun obbligo di attribuzione)

Non ha un `.source.json` di proposito: `update-skill.sh` sovrascriverebbe le modifiche locali
e appiattirebbe `scripts/` nella radice della skill. Gli aggiornamenti upstream vanno
riportati a mano.

## Modifiche rispetto all'upstream

- **Lingua.** La libreria cerca solo l'inglese se non le si passa nulla, quindi un video con
  soli sottotitoli italiani falliva. Ora prova `it,en` in ordine, sovrascrivibile con `--lang`.
- **URL.** Riconosce anche `youtube.com/shorts/` e `youtube.com/live/`.
- **Token.** Tolta l'istruzione di riscrivere la trascrizione in paragrafi e il salvataggio
  scritto da Claude: entrambi ripagavano l'intera trascrizione in token di output. Il file si
  scrive con un redirect della shell e il riassunto non ripete la trascrizione.
- **Description.** Attiva la skill anche sulle richieste di riassunto.
