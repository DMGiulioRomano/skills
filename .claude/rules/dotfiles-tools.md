# Installazioni e repo dotfiles (rule)

## Quando si installa qualcosa sul computer

Ogni volta che chiedi all'utente di installare un programma sul computer, o lo
installi tu (`brew`, `port`, installer via `curl`, app grafica), chiedi anche:

> "Vuoi aggiungerlo a `tools.txt` nel repo dotfiles?"

Il repo è `~/github/DMGiulioRomano/dotfiles`. Il formato delle righe è descritto
in testa a `tools.txt`.

- Fai la domanda sempre, anche se l'installazione sembra temporanea: decide
  l'utente.
- Non chiedere se il programma è già in `tools.txt`.
- Non vale per le dipendenze di un singolo progetto (`npm install`, `pip install`
  in un venv, `cargo add`) né per ciò che si installa dentro una VM o un container.
- Modifica `tools.txt` solo dopo il sì dell'utente.
