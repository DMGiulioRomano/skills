---
name: no-ai-slop
description: "Regole ed esempi pratici per scrivere prosa italiana che non suoni AI-generata. Da consultare prima di scrivere o revisionare qualunque testo in italiano, in particolare prosa accademica e tecnica."
---

# No AI Slop (italiano)

Adattamento italiano di [realrossmanngroup/no_ai_slop_writing_rules](https://github.com/realrossmanngroup/no_ai_slop_writing_rules). Il pattern dietro ogni correzione è uno: sostituire l'affermazione vaga con un fatto specifico e verificabile. La lista completa dei termini banditi sta in `references/ai-writing-detection.md`.

## Regola 1: Niente em-dash

Il carattere `—` è bandito. In italiano accademico usa virgole, punto e virgola, parentesi tonde, due punti. L'em-dash è uno dei più affidabili indicatori AI.

- WRONG: "Il sistema PGE — pensato per il tempo differito — adotta YAML come DSL."
- RIGHT: "Il sistema PGE, pensato per il tempo differito, adotta YAML come DSL."

## Regola 2: Niente verbi svuotati

Verbi come "rappresentare", "costituire", "configurarsi come", "porsi come", "fungere da" sostituiscono spesso un più diretto "è" o "ha". Quando puoi usare `è/sono/ha`, fallo.

- WRONG: "Il modulo ParameterOrchestrator si configura come elemento centrale dell'architettura."
- RIGHT: "ParameterOrchestrator è il modulo centrale dell'architettura: orchestra la generazione di tutti i parametri prima della sintesi."

## Regola 3: Niente intensificatori vuoti

"Significativamente", "notevolmente", "estremamente", "particolarmente" e simili sono segnaposto al posto dell'evidenza. Sostituisci la parola con il numero o il fatto che stava nascondendo.

- WRONG: "Il rendering offline è significativamente più lento del real-time."
- RIGHT: "Il rendering offline di un brano di 5 minuti richiede 40 secondi sulla macchina di test (M1 Pro, 16 GB)."

## Regola 4: Niente affermazioni vuote

Una frase che afferma rilevanza senza un dettaglio concreto non dice nulla. Termina ogni affermazione su un fatto verificabile.

- WRONG: "Questa scelta architetturale ha un impatto rilevante sul flusso di lavoro compositivo."
- RIGHT: "La cache incrementale per stream evita di rigenerare gli stream non modificati: una variazione su 8 stream comporta il rendering di 1, non di 8."

## Regola 5: Niente slop strutturale (layout ripetitivi)

Tre sezioni costruite sullo stesso modello suonano come output di macchina anche se ogni fatto è vero. Varia il conteggio di paragrafi, il ritmo delle frasi e l'apertura di ciascuna sezione.

- WRONG (tre sezioni, forma identica):
  ```
  In [anno], [autore] propose [sistema]. Il sistema introdusse [feature]. L'innovazione fu [impatto].
  In [anno], [autore] propose [sistema]. Il sistema introdusse [feature]. L'innovazione fu [impatto].
  In [anno], [autore] propose [sistema]. Il sistema introdusse [feature]. L'innovazione fu [impatto].
  ```
- RIGHT (varia la forma):
  ```
  Sezione 1: narrazione dettagliata con cronologia e contesto su due paragrafi.
  Sezione 2: sintesi di due frasi, perché l'evento è poco documentato.
  Sezione 3: apre con la giustificazione dichiarata dall'autore, poi l'evidenza che la contraddice.
  ```

## Regola 6: Niente frasi-riempitivo

"Nel panorama odierno", "Vale la pena notare che", "È importante sottolineare che", "Nel contesto attuale", "Alla luce di quanto sopra", "In tal senso" aggiungono lunghezza, non significato. Apri sul fatto.

- WRONG: "Vale la pena notare che la sintesi granulare in tempo differito offre un loop di feedback particolarmente esteso."
- RIGHT: "Il tempo differito allunga il ciclo specifica-ascolto: 12 secondi tra modifica YAML e nuovo render su un brano di 90 secondi, contro la risposta immediata di un sistema real-time."

## Regola 7: Scrivi come ricercatore, non come copywriter

Se una frase potrebbe stare su una brochure di un dipartimento senza cambiare una parola, è generica. Anco­rala a qualcosa di verificabile.

- WRONG: "Il compositore merita strumenti che si adattino al suo processo creativo."
- RIGHT: "Nel workflow descritto, la riscrittura di un campo `density` in `partitura.yaml` produce un nuovo SCO Csound in 0,3 s e un render audio in 8 s: il compositore valuta la modifica nello stesso minuto."

## Regola 8: Niente parole evasive (weasel words)

"Potrebbe potenzialmente", "potrebbe contribuire a", "in qualche modo", "presumibilmente" indeboliscono un'affermazione fino a renderla priva di contenuto. Una cosa accade o non accade. Dillo.

- WRONG: "L'approccio offline potrebbe potenzialmente favorire una riflessione compositiva più profonda."
- RIGHT: "L'approccio offline impone un'attesa di 8-40 s per ciclo, che obbliga il compositore a leggere lo YAML invece di iterare a caso."

## Regola 9: Niente titoli di sezione drammatici

Un titolo nomina il contenuto della sezione. Non lo anticipa, non lo drammatizza, non lo astrae.

- WRONG: "Il tradimento del tempo reale" / "L'insidia nascosta del real-time"
- RIGHT: "Limiti del paradigma real-time per indagine parametrica granulare"

## Regola 10: Niente attribuzioni fabbricate

Non mettere mai una posizione in bocca a una persona reale per inferenza. Dichiara solo quello che ha effettivamente detto o scritto, con la fonte verificabile.

- WRONG: "Truax sostiene che il tempo differito sia oggi una scelta poetica."
- RIGHT: "In Truax 1988 (p. 14) la motivazione del passaggio al real-time è esplicita: 'avoiding the slow turnaround of off-line synthesis'. Truax non esprime giudizi sul tempo differito come scelta successiva."

## Regola 11: Differenziazione causale, non per asserzione

Quando contrasti due cose, nomina la differenza concreta che le separa. Non affermare che una è esente, più nuova, migliore o non affetta senza dire cosa la rende tale.

- WRONG: "PGE differisce dai sistemi real-time grazie alla sua impostazione concettuale."
- RIGHT: "PGE genera lo score Csound completo prima del rendering: tutti i grani sono noti in anticipo, l'ordine di esecuzione è deterministico, la cache per-stream è possibile. Un motore real-time deve decidere ciascun grano nel tempo di audio-block (≤5,8 ms a 44.1 kHz/256), il che esclude la lettura di partiture grafiche pre-computate."

Quando dici A differisce da B, nomina la parte, il modulo, la data, il meccanismo che rende la differenza reale. Se non hai quel dettaglio, non implicare che la differenza esista.

## Self-check prima di restituire il testo

Esegui questa passata su ogni brano prima di consegnarlo. Le liste complete di parole/frasi bandite sono in `references/ai-writing-detection.md`; controllale direttamente.

1. Cerca il carattere em-dash (`—`). Rimuovi tutti (Regola 1).
2. Scansiona verbi svuotati (rappresenta, costituisce, si configura come, si pone come, funge da) e sostituisci con `è/sono/ha` o verbo specifico.
3. Scansiona aggettivi e intensificatori abusati (robusto, fondamentale, cruciale, pivotale, significativamente, particolarmente, estremamente) e taglia o sostituisci.
4. Scansiona transizioni e aperture bandite (Inoltre, Tuttavia, Pertanto, Peraltro, Nel panorama odierno, Vale la pena notare che).
5. Controlla ogni numero: è reale e attribuibile? Se no, tagliarlo o citarne la fonte.
6. Controlla che ogni frase finisca su un dettaglio concreto, non su un'affermazione di rilevanza.
7. Controlla i titoli: nominano il contenuto invece di anticiparlo (Regola 9)?
8. Controlla ripetizioni di punti e di forma delle sezioni (Regola 5).
9. Conta i marker di hedging per paragrafo. Più di 3 è un campanello d'allarme.
10. Leggi il testo ad alta voce. Se un'espressione suonerebbe innaturale a un collega, riscrivila.
