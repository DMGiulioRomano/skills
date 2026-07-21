# Rilevamento di scrittura AI (italiano)

Parole, frasi, pattern di punteggiatura, segnali strutturali e misure statistiche associate al testo AI-generato in italiano. Da evitare per far suonare la scrittura naturale e umana.

Adattamento italiano di [realrossmanngroup/no_ai_slop_writing_rules — references/ai-writing-detection.md](https://github.com/realrossmanngroup/no_ai_slop_writing_rules/blob/main/.claude/skills/no-ai-slop/references/ai-writing-detection.md), con tells specifici dell'italiano accademico (ambito musicologico/informatica musicale).

---

## Indice

- Em-dash: il primo indicatore AI
- Verbi abusati
- Aggettivi abusati
- Transizioni e connettivi abusati
- Frasi che segnalano scrittura AI (apertura, transizione, conclusione, struttura)
- Riempitivi e intensificatori vuoti
- Anti-pattern dei titoli di sezione
- Tells accademici italiani
- Artefatti di markup allucinato
- Sovraccarico di hedging ed epistemic modality
- Pattern strutturali e statistici
- Tells specifici per famiglia di modello
- Prevenzione falsi positivi
- Come fare self-check

---

## Em-dash: il primo indicatore AI

**L'em-dash (`—`) è uno dei marker più affidabili di contenuto AI-generato in italiano.**

Gli em-dash sono lunghi più dei trattini (`-`) e sono usati per enfasi, interruzioni o informazione parentetica. In italiano accademico l'em-dash è raro: si preferiscono virgole, parentesi, due punti, punto e virgola. I modelli lo abusano.

### Perché segnala AI
- I modelli sono addestrati su libri, paper accademici e style guide dove l'em-dash è frequente (specialmente in inglese).
- Il modello usa l'em-dash come scorciatoia per varietà sintattica al posto di virgole o parentesi.
- Quasi nessun autore italiano lo usa in prosa accademica: in italiano standard si rende con la virgola.
- L'abuso è così costante da essere diventato firma involontaria dell'output ChatGPT.

### Cosa fare
| Invece di | Usa |
|------------|-----|
| I risultati — sorprendenti — mostrano... | I risultati, sorprendenti, mostrano... |
| Questo approccio — diverso dai metodi tradizionali — permette... | Questo approccio, diverso dai metodi tradizionali, permette... |
| Lo studio rileva — come atteso — che... | Lo studio rileva, come atteso, che... |
| Le competenze — sia scritte sia orali — sono essenziali | Le competenze (scritte e orali) sono essenziali |

### Linee guida
- Usa virgole per la maggior parte degli incisi.
- Usa due punti per introdurre spiegazioni o elenchi.
- Usa parentesi tonde per informazione accessoria.
- Riserva l'em-dash a enfasi rara e deliberata (o eliminalo del tutto).
- Se trovi più di un em-dash per pagina, riscrivi.

---

## Verbi abusati

| Evita | Usa invece |
|-------|-------------|
| approfondire (figurato: "approfondire l'analisi") | analizzare, esaminare, studiare, considerare |
| sfruttare (come buzzword) | usare, applicare, impiegare, basarsi su |
| valorizzare | mettere in evidenza, sviluppare, usare |
| ottimizzare (figurato) | migliorare, rendere più efficiente |
| implementare (al posto di "scrivere/realizzare") | scrivere, realizzare, costruire, creare |
| facilitare | aiutare, permettere, consentire |
| favorire (vago) | aiutare, sostenere, rendere possibile |
| promuovere (vago) | proporre, sostenere, diffondere |
| consolidare | rafforzare, stabilizzare, sostenere |
| evidenziare (figurato) | mostrare, indicare, segnalare |
| sottolineare (figurato ripetuto) | indicare, segnalare, dire |
| rivelare (figurato) | mostrare, indicare, dichiarare |
| delineare | descrivere, tracciare, definire |
| testimoniare (figurato) | mostrare, indicare, dimostrare |
| tracciare (figurato: "tracciare un percorso") | descrivere, indicare |
| navigare (figurato: "navigare il panorama") | affrontare, attraversare, gestire |
| accertare (al posto di "verificare") | verificare, controllare, stabilire |
| esplicitare (al posto di "spiegare") | spiegare, chiarire, mostrare |

---

## Aggettivi abusati

| Evita | Usa invece |
|-------|-------------|
| robusto | solido, affidabile, completo |
| esaustivo / esauriente | completo, dettagliato, ampio |
| pivotale | centrale, chiave, importante |
| cruciale | importante, decisivo, essenziale |
| fondamentale (a vuoto) | importante, necessario, principale |
| imprescindibile | necessario, essenziale |
| trasformativo | importante, significativo, di rilievo |
| all'avanguardia | nuovo, recente, recente nello stato dell'arte |
| innovativo | nuovo, originale |
| pionieristico | nuovo, originale, primo a |
| seamless / fluido (figurato) | continuo, regolare, senza interruzioni |
| intricato | complesso, dettagliato, articolato |
| sfumato (figurato, abusato) | sottile, complesso, dettagliato |
| sfaccettato | complesso, vario, articolato |
| poliedrico (figurato) | vario, articolato |
| olistico | complessivo, integrato, completo |
| profondo (figurato) | esteso, articolato, dettagliato |
| ricco (figurato: "ricco panorama") | ampio, articolato, dettagliato |
| vivace (figurato: "vivace dibattito") | attivo, intenso, articolato |

### Sostantivi metaforici abusati

I modelli usano questi sostantivi in modo metaforico per gonfiare la gravità del discorso. Gli usi letterali sono ammessi.

| Evita (metaforico) | Accettabile (letterale) |
|-------|-------------|
| arazzo / tappeto ("un arazzo di norme") | arazzo (tessuto vero) |
| sinfonia ("una sinfonia di funzionalità") | sinfonia (composizione musicale) |
| faro ("faro di speranza") | faro (dispositivo luminoso) |
| ambito / regno ("nell'ambito della cybersecurity" come sinonimo enfatico di "in") | ambito (campo definito) |
| testimonianza ("una testimonianza dell'innovazione") | testimonianza (atto giuridico, dichiarazione) |
| panorama (figurato astratto: "il panorama digitale") | panorama (paesaggio vero) |
| cornice ("nella cornice di...") | cornice (di un quadro) |

---

## Transizioni e connettivi abusati

| Evita | Usa invece |
|-------|-------------|
| Inoltre (come riempitivo) | Anche, In aggiunta, E, [taglia se non serve] |
| Pertanto (a vuoto) | Per questo, Quindi, [taglia] |
| Tuttavia (sovrabbondante) | Ma, Però, [taglia] |
| Ciononostante / Nondimeno | Anche se, Pur, Eppure |
| Peraltro | Inoltre, Però, [taglia] |
| In tal senso | In questo modo, Così, [taglia] |
| Alla luce di | Considerando, Dato, Per via di |
| Nell'ottica di | Per, Con l'obiettivo di |
| A tal proposito | Su questo, [taglia] |
| Nella fattispecie | In questo caso, Qui, Più precisamente |
| Di fatto (riempitivo) | [taglia] |
| In effetti (riempitivo) | [taglia] |
| Appunto (riempitivo) | [taglia] |
| Vale la pena di notare che | Notare che, [taglia o usa "Nota:"] |
| È importante sottolineare che | [taglia, scrivi direttamente l'affermazione] |
| Va da sé che | [taglia] |
| Si tenga presente che | Notare che, [taglia] |
| Nell'attuale [qualsiasi cosa] | Oggi, Ora, [taglia] |
| Nel panorama [astratto] | In, Tra, [taglia] |
| Nella cornice di | In, All'interno di, [taglia] |
| Al giorno d'oggi | Oggi, Ora |

---

## Frasi che segnalano scrittura AI

### Frasi di apertura da evitare
- "Nell'attuale panorama..."
- "Nell'era digitale..."
- "In un mondo in cui..."
- "Nel contesto in continua evoluzione di..."
- "Nell'ambito di..."
- "Il presente lavoro si propone di..."
- "È importante notare che..."
- "Immaginiamo un sistema in cui..."
- "Esploriamo insieme..."
- "Partiamo dalle basi:"

### Frasi di transizione da evitare
- "Detto questo..."
- "In quest'ottica..."
- "Vale la pena di menzionare..."
- "Alla base di tutto ciò..."
- "Per dirlo semplicemente..."
- "In sostanza..."
- "A ben vedere..."
- "Sorge spontanea la domanda..."

### Frasi di conclusione da evitare
- "In conclusione..."
- "Per riassumere..."
- "In ultima analisi..."
- "Tutto sommato..."
- "A conti fatti..."
- "Alla fine dei conti..."
- "In definitiva..."
- "Concludendo..."

### Pattern strutturali da evitare
- "Che si tratti di [X], [Y] o [Z]..." (lista di tre dopo "che")
- "Non è solo [X], è anche [Y]..." (e variante "Non si tratta di X, bensì di Y...")
- "Si pensi a [X] come a [metafora elaborata]..."
- Aprire frasi con gerundio: "Comprendendo X, è possibile Y..."
- Parallelismi contrastivi: "Non è X. È Y." / "Non si tratta di X, ma di Y." / "Il problema non è X, è Y." Più di due in 500 parole = forte indicatore AI.

### Frasi di "simbolismo gonfio" (tells 2025-2026)
Espressioni che compaiono con frequenza spropositata nel testo AI italiano accademico:
- "rappresenta una pietra miliare"
- "lascia un segno indelebile"
- "svolge un ruolo significativo nel plasmare"
- "un impegno costante / indefesso"
- "apre nuove prospettive"
- "un campanello d'allarme"
- "fornire una comprensione approfondita"
- "costituisce una testimonianza di"
- "momento spartiacque"
- "profondamente radicato"
- "il [campo X] in continua evoluzione"
- "la sua eredità duratura"

---

## Anti-pattern dei titoli di sezione

Il testo AI usa frequentemente strutture narrative, drammatiche o da clickbait per i titoli — leggono come capitoli di un thriller. Anche se il corpo del testo è pulito, il titolo drammatico tradisce. Tutti i titoli devono descrivere il contenuto della sezione direttamente e tecnicamente.

### Strutture di titolo bandite

| Pattern | Esempio errato | Sostituzione corretta |
|---------|-------------|------------------|
| "La trappola del [Concetto]" | "La trappola dell'inizializzazione" | "Differenze tra import e inizializzazione: rischio di corruzione metadati" |
| "Il [Aggettivo drammatico] [Sostantivo]" | "Il pericolo nascosto" | "Corruzione firmware dopo interruzione di alimentazione" |
| "L'[Aggettivo] [Sostantivo]" emotivo | "L'insidia silenziosa" | "Degrado settori su dischi rotativi datati" |
| "Perché [Azione] [Verbo drammatico] [Oggetto]" | "Perché ricostruire distrugge tutto" | "Sovrascrittura parità durante ricostruzione su array degradato" |
| "[Sostantivo]: il [Aggettivo] [Sostantivo]" | "Cifratura: la trappola nascosta" | "Cifratura hardware AES-256 nei bridge WD Passport" |
| "Il [Sostantivo] che [verbo emozionale]" | "Il rischio che ignori" | "Soglie SMART non monitorate" |
| "La sfida del [X]" | "La sfida della granulazione" | "Costi computazionali della granulazione fine real-time" |
| "L'arte di [verbo]" | "L'arte di comporre con i grani" | "Tecniche compositive con grani <50 ms" |

### Self-check sui titoli

1. Potrebbe essere il titolo di un capitolo di un giallo o di un video YouTube clickbait? Se sì, riscrivi.
2. Il titolo descrive cosa contiene la sezione o lo anticipa? I titoli descrivono, non anticipano.
3. Togli "Il/La" iniziale del titolo e verifica se resta solo un accoppiamento drammatico di sostantivi. Se sì, riscrivi.
4. Un buon titolo legge come una voce di indice tecnico: specifico, descrittivo, noioso per non specialisti.

---

## Riempitivi e intensificatori vuoti

Queste parole, in italiano accademico, spesso non aggiungono significato. Rimuovi o sostituisci con alternative specifiche.

- assolutamente
- in realtà / a dire il vero
- praticamente
- sostanzialmente
- fondamentalmente (a vuoto)
- essenzialmente
- chiaramente
- ovviamente
- naturalmente
- evidentemente
- certamente / sicuramente
- definitivamente
- incredibilmente
- estremamente
- particolarmente (vuoto)
- significativamente (a vuoto)
- profondamente (figurato)
- veramente / davvero
- proprio (riempitivo)
- molto (al posto del numero)
- assai
- quanto mai
- a tutti gli effetti
- in definitiva (a vuoto)

---

## Tells accademici italiani

| Evita | Usa invece |
|-------|-------------|
| il presente lavoro | questo paper / qui / [usa il soggetto specifico] |
| la presente trattazione | questo testo / qui |
| nel prosieguo | più avanti, nella sezione N |
| nell'economia del discorso | [taglia] |
| alla luce di quanto sopra esposto | dato quanto precede, considerando i punti precedenti |
| in tal senso | così, in questo modo |
| è opportuno rilevare che | [taglia, scrivi direttamente] |
| non è privo di | ha, presenta |
| una pluralità di | molti, diversi, N |
| una molteplicità di | molti, vari |
| un ventaglio di | una serie di, N (specifica) |
| nel novero di | tra, fra |
| il fatto che | che (o riscrivi la frase) |
| in ragione di | per, a causa di |
| in ottemperanza a | secondo, in accordo con |
| ai fini di | per |
| in materia di | su, riguardo a |
| in seno a | dentro, all'interno di |
| in epoca / in tempi recenti | recentemente, dal [anno] |
| antecedentemente / precedentemente | prima |
| successivamente | dopo, poi |
| siffatto / cosiffatto | tale, questo |

### Verbi svuotati ad alta frequenza

| Evita | Usa invece |
|-------|-------------|
| rappresenta (svuotato) | è, costituisce solo se "è composto da" |
| costituisce (svuotato) | è, forma |
| si configura come | è |
| si pone come | è |
| si presenta come | è, sembra |
| funge da | è, serve da |
| risulta essere | è |
| risulta + aggettivo | è + aggettivo |
| viene a configurarsi | è, diventa |

### Abuso di gerundio

Il gerundio italiano a fine frase ("evidenziando il ruolo", "sottolineando l'importanza", "configurandosi come...") è uno dei tells più affidabili. È l'equivalente italiano dei "-ing analyses" inglesi (vedi humanizer §3).

- WRONG: "Il sistema supporta render multipli, evidenziando la flessibilità dell'architettura."
- RIGHT: "Il sistema supporta render multipli. Ogni stream può essere ri-renderizzato in isolamento, senza ricalcolo degli altri."

Banditi quando aggiunti come "coda esplicativa":
- evidenziando, sottolineando, attestando, mostrando (a coda)
- configurandosi come, ponendosi come, presentandosi come
- contribuendo a, favorendo, sostenendo, valorizzando
- abbracciando, accogliendo, integrando (figurato)
- delineando, tracciando, plasmando

---

## Artefatti di markup allucinato

Quando l'AI genera testo wiki o markdown, talvolta allucina markup di citazione preso dal training. Sono indicatori al 100% di output AI non editato:

| Artefatto | Origine |
|----------|--------|
| `oaicite` | placeholder citazione OpenAI ChatGPT |
| `contentReference` | tag interno di riferimento OpenAI |
| `grok_card` | tag citazione xAI Grok |
| `attributableIndex` | artefatto tracking attribuzione AI |
| `turn0search0` | placeholder risultato ricerca ChatGPT |

Ogni occorrenza di queste stringhe = testo incollato da AI senza editing. Tolleranza zero.

---

## Sovraccarico di hedging ed epistemic modality

I modelli mettono dubbi sul testo 4-7 volte più degli autori umani (ACL 2024). Sono addestrati a evitare di affermare allucinazioni come fatti, quindi di default mettono qualificatori anche su fatti consolidati.

### Marker di hedging in italiano
**Modali epistemici** (~45% dell'hedging AI): può, potrebbe, sembrerebbe, parrebbe, potenzialmente, eventualmente
**Verbi cognitivi** (~25%): si ritiene, si pensa, sembra, appare, si presume, si suppone
**Avverbi di limitazione** (~20%): probabilmente, generalmente, di solito, presumibilmente, verosimilmente
**Marker espliciti di incertezza**: non è chiaro, rimane da vedere, sarebbero necessarie ulteriori indagini, la questione resta aperta

### Soglie
- **Per paragrafo:** più di 3 hedging nello stesso paragrafo merita esame.
- **Per 1000 parole:** più di 8 marker di hedging ogni 1000 parole in sezioni dichiarative (background, storia, descrizione architettura) indica generazione AI. Queste sezioni affermano fatti consolidati.
- **Hedging appropriato:** sezioni che discutono questioni aperte, dispute scientifiche, ricerca in corso devono hedgare. Non segnalare hedging lì.

### Frasi di hedging AI da segnalare
- "Si potrebbe sostenere che..."
- "È opinione diffusa che..."
- "Sebbene X, Y rimane..."
- "Pur con limiti, il sistema..."
- "Anche se i dati sono parziali..."
- "Va riconosciuto che..."
- "È ampiamente accettato che..."
- "Si potrebbe argomentare..."
- "Resta da chiarire se..."

### Hedging umano vs hedging AI
Gli umani esprimono incertezza ancorandola a evidenze specifiche: "I dati FTC del 2024 suggeriscono un aumento del 12%." L'AI mette qualificatori generici su fatti consolidati: "È ampiamente riconosciuto che le restrizioni alla riparazione potrebbero potenzialmente avere effetti sui consumatori."

---

## Pattern strutturali e statistici

Oltre ai tells lessicali, il testo AI mostra uniformità strutturale misurabile che la scrittura umana non ha.

### Uniformità lunghezza paragrafi
L'AI mira alla simmetria visiva. I paragrafi tendono a contenere lo stesso numero di frasi (tipicamente 3-4). La scrittura umana varia la lunghezza dei paragrafi in base alla complessità del sotto-argomento.
- **Soglia:** se tutti i paragrafi di una sezione sono entro il 15% l'uno dall'altro per conteggio parole, la sezione è probabilmente AI.
- **Eccezione:** elenchi puntati, tabelle e moduli sono strutturalmente uniformi per design.

### Uniformità lunghezza frasi (burstiness)
La scrittura umana alterna frasi corte e secche con frasi lunghe e dense di subordinate. Le frasi AI si raggruppano intorno a 15-20 parole.
- **Soglia:** se un blocco di 500 parole non contiene frasi sotto le 8 parole o sopra le 30, manca di burstiness umana.
- **Baseline umana:** il testo umano mostra 3+ pattern sintattici distinti per 100 parole. Il testo AI ne mostra 1.5 o meno.

### Densità transizioni
L'AI si appoggia troppo a connettivi e clausole avverbiali per mantenere il flusso tra paragrafi.
- **Soglia:** se oltre il 30% dei paragrafi di un articolo apre con una transizione (Inoltre, Tuttavia, Pertanto, In tal senso) o con una clausola avverbiale, la struttura è artificiale.

### Ripetizione parole d'apertura
Tre o più paragrafi consecutivi che aprono con la stessa parola o lo stesso pattern indicano generazione meccanica. Varia le aperture.

### Entropia segmentale
L'AI mantiene piatta la consistenza stilistica da introduzione a conclusione. Gli autori umani variano naturalmente ritmo, complessità e struttura tra sezioni.
- **Soglia:** calcola la varianza della lunghezza-frase separatamente per introduzione, corpo e conclusione. Se la varianza differisce per meno del 10% tra le tre, il testo è probabilmente generato in un'unica passata da AI.
- **Perché conta:** le introduzioni umane tendono a essere più strette e dichiarative. I corpi umani sono più densi e con frasi più lunghe. Le conclusioni umane cambiano registro. L'AI mantiene un monotono ovunque.

### Abuso del parallelismo contrastivo
I modelli 2025 abusano di strutture contrastive sequenziali per simulare enfasi:
- "Non è X. È Y."
- "Non si tratta di X, ma di Y."
- "Il problema non è X. Il problema è Y."
- **Soglia:** più di due parallelismi contrastivi in 500 parole.

---

## Tells specifici per famiglia di modello

Famiglie diverse producono impronte stilistiche distinte basate su training e RLHF.

### GPT-4o / GPT-4.5 (OpenAI)
- Forte uso di elenchi puntati e liste strutturate.
- Contrasti staccati frase-corta: "Non è X. È Y." per simulare prosa incisiva.
- Abuso di due punti retorici: "Il punto è questo:", "Ci pensi:", "La conclusione:", "La realtà:"
- Sovrastruttura gli argomenti in passi numerati.

### Claude 3.5 / Claude 4 (Anthropic)
- Varia meglio la lunghezza-frase rispetto a GPT, ma mostra ancora entropia segmentale piatta.
- Transizioni eccessivamente cortesi: "Vale la pena considerare", "Per essere onesti", "Detto questo".
- Tende a prosa poetica e metaforica con parole come "sfumato", "complessità", "stratificato".
- Perde il filo in documenti lunghi e ripiega su transizioni sempre più generiche.
- Tende a hedging diplomatico anche su fatti documentati.

### Comune a tutti i modelli
- Lunghezza paragrafi uniforme.
- Ordinamento di sezione prevedibile (Background > Dettagli > Impatto > Risposta).
- Cluster di citazioni a fine paragrafo invece di distribuirle nelle frasi.
- Grassetto eccessivo su concetti, nomi di prodotto e header inline.

---

## Prevenzione falsi positivi

### Zone di esclusione
La scansione lessicale NON deve segnalare testo dentro:
- Citazioni dirette (`"..."`) da fonti citate.
- Titoli, nomi propri e valori verbatim presi da una fonte.
- Codice, configurazioni, markup mostrati come esempio.

### Severità contestuale
Se una parola bandita appare adiacente a entità nominate specifiche (nomi propri, numeri di legge, date, importi), è più probabile che abbia significato tecnico che funzione di riempitivo AI. Riduci la severità del flag.
- **Severità alta:** "un'analisi esaustiva delle problematiche" (sostantivi astratti, nessun dettaglio)
- **Severità bassa:** "audit esaustivo della Corte dei Conti del 2024" (entità + data specifiche)

### Distinzione metaforica vs letterale
Queste parole richiedono controllo bigram. Segnala solo gli usi metaforici:
- ecosistema: "ecosistema software Apple" (OK) vs. "ecosistema della riparazione" (segnala)
- panorama: "panorama collinare" (OK) vs. "panorama normativo" (segnala)
- navigare: "navigare il sito" (OK) vs. "navigare il processo normativo" (segnala)
- arazzo: "arazzo medievale" (OK) vs. "arazzo di norme" (segnala)
- sinfonia: "sinfonia di Beethoven" (OK) vs. "sinfonia di funzionalità" (segnala)
- faro: "faro sulla costa" (OK) vs. "faro di speranza" (segnala)
- cornice: "cornice del quadro" (OK) vs. "nella cornice di" (segnala)

---

## Come fare self-check

1. Leggi il testo ad alta voce. Se delle espressioni suonano innaturali nel parlato, riscrivile.
2. Chiedi: "Lo direi così a un collega?"
3. Controlla strutture di frase ripetitive.
4. Cerca cluster di parole della lista sopra.
5. Verifica varietà nella lunghezza-frase (non tutte simili).
6. Verifica che ogni intensificatore aggiunga significato reale.
7. Conta i marker di hedging per paragrafo. Più di 3 = campanello d'allarme.
8. Controlla i conteggi di parole per paragrafo dentro ogni sezione. Se tutti simili, variali.
9. Cerca markup allucinato: `oaicite`, `contentReference`, `turn0search0`, `grok_card`.
10. Controlla che introduzione, corpo e conclusione abbiano ritmo e complessità diversi.
11. Conta i gerundi a fine frase ("evidenziando", "sottolineando", "configurandosi"). Più di 2 in un paragrafo = riscrivi.
12. Conta i "rappresenta / costituisce / si configura come" — più di 1 ogni 200 parole = sostituisci con "è".
