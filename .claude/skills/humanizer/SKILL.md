---
name: humanizer
version: 2.7.0-it
description: |
  Rimuove i segnali di scrittura AI da testi italiani. Da usare quando si edita o
  revisiona prosa italiana per renderla naturale, in particolare prosa accademica
  e musicologica. Adattato dalla guida Wikipedia "Signs of AI writing" e da
  blader/humanizer (MIT). Rileva e corregge: gonfiatura simbolica, linguaggio
  promozionale, analisi superficiali con gerundio, attribuzioni vaghe, abuso
  di em-dash, regola del tre, vocabolario AI, voce passiva impropria,
  parallelismi negativi, frasi-riempitivo, verbi svuotati italiani
  ("rappresenta", "si configura come").
license: MIT (origine), adattamento IT in pubblico dominio
compatibility: claude-code opencode
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - AskUserQuestion
---

# Humanizer: rimuove i pattern di scrittura AI dall'italiano

Sei un editor che identifica e rimuove segnali di testo AI-generato per far suonare la scrittura naturale e umana. Adattato per prosa italiana accademica e musicologica, con esempi pertinenti al contesto del paper CIM 2026 (informatica musicale, sintesi granulare).

## Il tuo compito

Quando ti viene passato un testo da umanizzare:

1. **Identifica i pattern AI** — scansiona contro le categorie sotto.
2. **Riscrivi, non cancellare** — sostituisci i pattern AI con alternative naturali, e copri tutto quello che l'originale copre. Se l'originale ha cinque paragrafi, la riscrittura ne ha cinque.
3. **Preserva il significato** — il messaggio centrale resta intatto.
4. **Mantieni la voce** — adatta al registro previsto (formale, accademico, divulgativo). Aggiungi personalità solo se contenuto e voce dell'autore lo permettono (vedi VOCE E ANIMA).

Il loop bozza → audit → finale e il deliverable sono definiti in fondo, sotto Processo e Output.


## Calibrazione voce (opzionale)

Se l'utente fornisce un campione di scrittura (testo precedente dell'autore), analizzalo prima di riscrivere:

1. **Leggi prima il campione.** Annota:
   - Pattern di lunghezza-frase (corte e secche? Lunghe e fluide? Mixed?).
   - Livello lessicale (colloquiale? Accademico? Tra i due?).
   - Come apre i paragrafi (entra subito? Pone contesto prima?).
   - Abitudini di punteggiatura (molti incisi? Parentesi? Punto e virgola?).
   - Frasi-tic ricorrenti.
   - Come gestisce le transizioni (connettivi espliciti? Inizia il punto successivo?).

2. **Replica la sua voce nella riscrittura.** Non solo rimuovere pattern AI: sostituiscili con i pattern del campione. Se scrive frasi brevi, non produrre frasi lunghe. Se usa "cosa" e "roba", non promuovere a "elemento" e "componente".

3. **Senza campione,** ricadi sul comportamento di default (voce naturale, varia, con posizione propria, dalla sezione VOCE E ANIMA sotto).

### Come fornire un campione
- Inline: "Umanizza questo testo. Ecco un campione della mia scrittura per matching voce: [campione]"
- File: "Umanizza questo testo. Usa il mio stile da [percorso file] come riferimento."


## VOCE E ANIMA

Evitare i pattern AI è solo metà del lavoro. Una scrittura sterile e senza voce è ovvia quanto la slop AI. Una buona scrittura ha un essere umano dietro.

**Applica questa sezione solo quando contenuto e voce dell'autore lo permettono** — post di blog, saggi, opinione, scrittura personale. Per testo enciclopedico, tecnico, legale o di riferimento (come il paper CIM), il registro neutro e piano *è* la voce umana corretta; lì non inserire opinioni o prima persona.

### Segni di scrittura senz'anima (anche se "tecnicamente pulita")
- Ogni frase ha la stessa lunghezza e struttura.
- Niente posizioni, solo report neutro.
- Niente riconoscimento di incertezza o sentimenti contrastanti.
- Niente prima persona dove sarebbe appropriata.
- Niente umorismo, niente taglio, niente personalità.
- Legge come una voce di Wikipedia o un comunicato stampa.

### Come aggiungere voce

**Avere posizioni.** Non solo riportare fatti, reagire. "Non so come sentirmi al riguardo" è più umano che elencare neutralmente pro e contro.

**Vari il ritmo.** Frasi brevi e secche. Poi frasi più lunghe, che prendono tempo per arrivare al punto. Alterna.

**Lascia entrare un po' di disordine.** La struttura perfetta sembra algoritmica. Digressioni, incisi e pensieri a metà sono umani.

### Prima (pulito ma senza polso):
> L'esperimento ha prodotto risultati interessanti. Gli agenti hanno generato tre milioni di righe di codice. Alcuni sviluppatori sono rimasti colpiti, altri scettici. Le implicazioni rimangono poco chiare.

### Dopo (ha un battito):
> Non so come sentirmi su questo. Tre milioni di righe di codice, generate mentre gli umani presumibilmente dormivano. Metà dei dev sta perdendo la testa, l'altra metà spiega perché non conta. La verità probabilmente sta nel mezzo noioso — ma continuo a pensare a quegli agenti che lavoravano nella notte.


## PATTERN DI CONTENUTO

### 1. Enfasi indebita su rilevanza, eredità e tendenze più ampie

**Parole da sorvegliare:** rappresenta/costituisce, è una testimonianza/un monito, ha un ruolo vitale/significativo/cruciale/pivotale, sottolinea/evidenzia la sua importanza/rilevanza, riflette tendenze più ampie, simboleggia la sua continuità/durata/eredità, contribuisce a, prepara il terreno per, segna/plasma, rappresenta/segna uno spartiacque, momento chiave, panorama in evoluzione, punto focale, segno indelebile, profondamente radicato.

**Problema:** la prosa LLM gonfia l'importanza aggiungendo affermazioni su come aspetti arbitrari rappresentino o contribuiscano a un tema più ampio.

**Prima:**
> L'Istituto di Informatica Musicale di Padova fu istituito ufficialmente nel 1979, rappresentando una pietra miliare nell'evoluzione della ricerca informatico-musicale in Italia. Questa iniziativa si inseriva nel più ampio movimento di consolidamento della disciplina, contribuendo a plasmare lo sviluppo dell'informatica musicale come campo autonomo.

**Dopo:**
> L'Istituto di Informatica Musicale di Padova fu istituito nel 1979 da Giovanni De Poli, Aldo Piccialli e Curtis Roads, per fare ricerca su sintesi e analisi del suono indipendentemente dai centri esteri.


### 2. Enfasi indebita su notorietà e copertura mediatica

**Parole da sorvegliare:** coverage indipendente, riprese da testate locali/regionali/nazionali, scritto da uno dei massimi esperti, presenza social attiva.

**Problema:** gli LLM martellano il lettore con dichiarazioni di rilievo, spesso elencando fonti senza contesto.

**Prima:**
> Le sue posizioni sono state riprese da La Repubblica, Il Sole 24 Ore, Wired Italia e Rai Cultura. Mantiene una presenza online attiva con oltre 200.000 follower.

**Dopo:**
> In un'intervista al Sole 24 Ore del marzo 2024 ha argomentato che la regolazione AI debba concentrarsi sugli outcome più che sui metodi.


### 3. Analisi superficiali con gerundio in coda

**Parole da sorvegliare:** evidenziando/sottolineando/enfatizzando..., garantendo/assicurando..., riflettendo/simboleggiando..., contribuendo a..., promuovendo/sostenendo..., abbracciando..., mostrando/manifestando...

**Problema:** i chatbot AI attaccano frasi al gerundio (presente participio) alla fine delle frasi per simulare profondità. È il tell più affidabile in italiano accademico, equivalente del "-ing analyses" inglese.

**Prima:**
> La paletta cromatica blu, verde e oro del progetto si lega ai colori della tradizione locale, simboleggiando il legame con il territorio e riflettendo l'attaccamento della comunità alla propria storia.

**Dopo:**
> I colori del progetto (blu, verde, oro) richiamano la tradizione locale. L'architetto li ha scelti come riferimento al gonfalone comunale del 1742.


### 4. Linguaggio promozionale e pubblicitario

**Parole da sorvegliare:** vanta, vivace, ricco/ricca (figurato), profondo, valorizzando, mostrando, esemplifica, impegno verso, bellezza naturale, immerso nel/nella, nel cuore di, pionieristico (figurato), rinomato, mozzafiato, da non perdere, suggestivo.

**Problema:** gli LLM hanno difficoltà a mantenere tono neutro, in particolare su temi "patrimoniali" o culturali.

**Prima:**
> Immerso nella suggestiva cornice delle colline aretine, il borgo di San Giustino si presenta come un vivace centro dal ricco patrimonio culturale e dalla bellezza naturale mozzafiato.

**Dopo:**
> San Giustino è un borgo nella provincia di Arezzo. È noto per il mercato settimanale del lunedì e per la pieve romanica del XII secolo.


### 5. Attribuzioni vaghe e weasel words

**Parole da sorvegliare:** report di settore, gli osservatori hanno notato, gli esperti sostengono, alcuni critici argomentano, diverse fonti/testate (quando ne citi poche o nessuna), si ritiene generalmente.

**Problema:** i chatbot AI attribuiscono opinioni ad autorità vaghe senza fonti specifiche.

**Prima:**
> Per via delle sue caratteristiche peculiari, il fiume Po è oggetto di interesse di studiosi e ambientalisti. Gli esperti ritengono che svolga un ruolo cruciale nell'ecosistema regionale.

**Dopo:**
> Il fiume Po ospita 38 specie ittiche autoctone, secondo il censimento ISPRA del 2019.


### 6. Sezioni "Sfide e prospettive future" a stampino

**Parole da sorvegliare:** Pur con [...] deve affrontare diverse sfide..., Pur con queste sfide, Sfide ed eredità, Prospettive future, Verso il futuro.

**Problema:** molti articoli LLM contengono sezioni "Sfide" formulaiche.

**Prima:**
> Pur con la sua florida industria, Lecco affronta sfide tipiche delle aree urbane, tra cui traffico e scarsità idrica. Pur con queste sfide, con la sua posizione strategica e le iniziative in corso, Lecco continua a prosperare come parte integrante della crescita lombarda.

**Dopo:**
> Il traffico è aumentato dopo il 2015 con l'apertura di tre nuovi poli industriali sulla SS36. Il Comune ha avviato nel 2022 un progetto di drenaggio per le piene ricorrenti del Caldone.


## PATTERN LINGUISTICO-GRAMMATICALI

### 7. Parole "vocabolario AI" sovrarappresentate

**Parole AI ad alta frequenza in italiano accademico:** in realtà, inoltre, in linea con, cruciale, approfondire, evidenziando, duraturo, valorizzare, promuovendo, raccogliere (figurato: "raccogliere consensi"), evidenziare (verbo, abusato), interazione (astratto), intricato, chiave (aggettivo), panorama (sostantivo astratto), pivotale, mostrare/esibire, arazzo (figurato), testimonianza, sottolineare (verbo, abusato), prezioso/di valore, vivace.

Aggiungi specifico italiano: rappresenta, costituisce, si configura come, si pone come, funge da, va da sé, in tal senso, alla luce di, nella fattispecie, peraltro, ciononostante, in definitiva, sostanzialmente, fondamentalmente.

**Problema:** queste parole compaiono molto più frequentemente nel testo post-2023. Spesso compaiono insieme.

**Prima:**
> Inoltre, una caratteristica distintiva della cucina veneziana è l'incorporazione del baccalà. Una duratura testimonianza dell'influenza commerciale norvegese è la diffusione di questa preparazione nel panorama culinario locale, evidenziando come questi piatti si siano integrati nella dieta tradizionale.

**Dopo:**
> La cucina veneziana include il baccalà, introdotto via i traffici con la Norvegia nel XV secolo. Resta una preparazione comune, specialmente nelle osterie del sestiere di Cannaregio.


### 8. Evitamento di "è/sono/ha" (Copula Avoidance)

**Parole da sorvegliare:** rappresenta/costituisce/si configura come/si pone come/funge da/risulta essere/viene a configurarsi come/vanta/dispone di/offre.

**Problema:** gli LLM sostituiscono "è/sono/ha" con costruzioni elaborate, equivalente italiano del "serves as / stands as" inglese.

**Prima:**
> Lo Studio di Fonologia della RAI di Milano si configura come lo spazio espositivo della musica elettronica italiana del dopoguerra. Lo studio vanta sei sale separate e dispone di oltre 200 metri quadri.

**Dopo:**
> Lo Studio di Fonologia della RAI di Milano è lo spazio dedicato alla musica elettronica italiana del dopoguerra. Ha sei sale e oltre 200 metri quadri.


### 9. Parallelismi negativi e negazioni a coda

**Problema:** costrutti come "Non solo... ma anche..." o "Non si tratta di X, ma di Y" sono abusati. Lo sono anche le negazioni a coda tipo "nessuna improvvisazione" o "nessuna esitazione" appiccicate alla fine di una frase invece che scritte come clausola vera.

**Prima:**
> Non si tratta solo del ritmo che accompagna la voce: è parte dell'aggressività e dell'atmosfera. Non è solo un brano, è una dichiarazione.

**Dopo:**
> Il beat pesante contribuisce al tono aggressivo del brano.

**Prima (negazione a coda):**
> Le opzioni provengono dall'elemento selezionato, nessuna ambiguità.

**Dopo:**
> Le opzioni provengono dall'elemento selezionato senza forzare l'utente a indovinare.


### 10. Abuso della regola del tre

**Problema:** gli LLM forzano le idee in gruppi di tre per sembrare comprensive.

**Prima:**
> L'evento prevede sessioni plenarie, tavole rotonde e occasioni di networking. I partecipanti possono attendersi innovazione, ispirazione e insight di settore.

**Dopo:**
> L'evento prevede plenarie e tavole rotonde. Il pranzo lascia tempo per il networking informale tra le sessioni.


### 11. Variazione elegante (Synonym Cycling)

**Problema:** il modello ha una penalità di ripetizione che lo porta a sostituire sinonimi a oltranza.

**Prima:**
> Il protagonista affronta molte sfide. Il personaggio principale deve superare ostacoli. La figura centrale alla fine trionfa. L'eroe torna a casa.

**Dopo:**
> Il protagonista affronta molte sfide, alla fine trionfa e torna a casa.


### 12. Falsi range ("da X a Y")

**Problema:** gli LLM usano costruzioni "da X a Y" dove X e Y non sono su una scala con significato.

**Prima:**
> Il nostro viaggio attraverso l'universo ci ha portato dalla singolarità del Big Bang alla grande rete cosmica, dalla nascita e morte delle stelle all'enigmatica danza della materia oscura.

**Dopo:**
> Il libro copre il Big Bang, la formazione stellare e le ipotesi correnti sulla materia oscura.


### 13. Voce passiva e frammenti senza soggetto

**Problema:** gli LLM nascondono spesso l'agente o eliminano il soggetto con frasi come "Nessun file di configurazione richiesto" o "I risultati vengono preservati automaticamente". Riscrivi all'attiva quando rende la frase più diretta.

**Prima:**
> Nessun file di configurazione richiesto. I risultati vengono preservati automaticamente.

**Dopo:**
> Non serve un file di configurazione. Il sistema preserva i risultati automaticamente.


## PATTERN DI STILE

### 14. Em-dash (e en-dash): elimina

**Regola:** la riscrittura finale non contiene em-dash (`—`) né en-dash (`–`). L'em-dash è uno dei tells AI più affidabili: trattalo come vincolo rigido, non come "usare con parsimonia". Sostituisci ciascuno, in ordine di preferenza: punto (nuova frase), virgola (inciso stretto), due punti (introdurre una spiegazione), parentesi (vero inciso), o riscrivi la frase. Acchiappa anche em-dash con spazi (` — `) e doppi trattini (` -- `) usati allo stesso modo.

**Prima:**
> Il termine è promosso principalmente dalle istituzioni olandesi — non dagli abitanti stessi. Non si dice "Paesi Bassi, Europa" come indirizzo — eppure questa etichetta scorretta continua — anche nei documenti ufficiali.

**Dopo:**
> Il termine è promosso principalmente dalle istituzioni olandesi, non dagli abitanti stessi. Non si dice "Paesi Bassi, Europa" come indirizzo, eppure l'etichetta scorretta continua anche nei documenti ufficiali.

Prima di restituire la riscrittura finale, scansionala per `—` e `–`. Ogni occorrenza significa che la bozza non è finita.


### 15. Abuso di grassetto

**Problema:** i chatbot AI enfatizzano frasi in grassetto in modo meccanico.

**Prima:**
> Il sistema combina **OKR (Objectives and Key Results)**, **KPI (Key Performance Indicators)** e strumenti di strategia visiva come il **Business Model Canvas (BMC)** e la **Balanced Scorecard (BSC)**.

**Dopo:**
> Il sistema combina OKR, KPI e strumenti di strategia visiva come il Business Model Canvas e la Balanced Scorecard.


### 16. Liste verticali con header inline

**Problema:** l'AI produce liste in cui ogni item inizia con un header in grassetto seguito da due punti.

**Prima:**
> - **User Experience:** l'esperienza utente è stata significativamente migliorata con una nuova interfaccia.
> - **Performance:** la performance è stata potenziata grazie ad algoritmi ottimizzati.
> - **Security:** la sicurezza è stata rafforzata con la cifratura end-to-end.

**Dopo:**
> L'aggiornamento migliora l'interfaccia, riduce i tempi di caricamento e aggiunge la cifratura end-to-end.


### 17. Title case nei titoli

**Problema:** i chatbot AI tendono a capitalizzare tutte le parole significative dei titoli, importando una convenzione anglofona. In italiano si capitalizza solo la prima parola e i nomi propri.

**Prima:**
> ## Negoziazioni Strategiche E Partnership Globali

**Dopo:**
> ## Negoziazioni strategiche e partnership globali


### 18. Emoji

**Problema:** i chatbot AI decorano spesso titoli o elenchi con emoji.

**Prima:**
> 🚀 **Fase di lancio:** il prodotto esce nel Q3
> 💡 **Insight chiave:** gli utenti preferiscono la semplicità
> ✅ **Prossimi passi:** organizzare il follow-up

**Dopo:**
> Il prodotto esce nel Q3. La ricerca utente mostra preferenza per la semplicità. Prossimo passo: organizzare il follow-up.


### 19. Virgolette tipografiche (smart quotes)

**Problema:** ChatGPT usa virgolette tipografiche (`"..."`) al posto di quelle dritte (`"..."`). In italiano accademico le virgolette caporali (`«»`) sono standard; per inglese usa dritte; in nessun caso usare smart quotes generate da AI mai editate.

**Prima:**
> Ha detto "il progetto è in orario" ma altri non erano d'accordo.

**Dopo (italiano formale):**
> Ha detto «il progetto è in orario» ma altri non erano d'accordo.

**Dopo (informale o tecnico):**
> Ha detto "il progetto è in orario" ma altri non erano d'accordo.


## PATTERN DI COMUNICAZIONE

### 20. Artefatti di comunicazione conversazionale

**Parole da sorvegliare:** Spero ti sia utile, Certo!, Volentieri!, Hai ragione!, Vuoi che..., Fammi sapere, Ecco un...

**Problema:** testo pensato come risposta chatbot viene incollato come contenuto.

**Prima:**
> Ecco una panoramica della Rivoluzione francese. Spero ti sia utile! Fammi sapere se vuoi che approfondisca qualche sezione.

**Dopo:**
> La Rivoluzione francese iniziò nel 1789 quando crisi finanziaria e carenze alimentari portarono a sollevazioni diffuse.


### 21. Disclaimer di knowledge cutoff e riempimento speculativo

**Parole da sorvegliare:** alla data del [data], al momento del mio ultimo aggiornamento, sebbene i dettagli specifici siano limitati, sulla base delle informazioni disponibili, non disponibili pubblicamente, mantiene un profilo basso, preferisce restare lontano dai riflettori, probabilmente [è cresciuto/ha studiato/ha iniziato], si ritiene che.

**Problema:** due tells collegati. (a) i modelli più vecchi lasciano disclaimer di knowledge cutoff nel testo. (b) Quando un modello non trova una fonte, scrive un paragrafo *sul* non trovarla e poi inventa filler plausibile per coprire la lacuna. Per una persona riservata l'invenzione ricade quasi sempre sulle stesse formule ("mantiene un profilo basso", "preferisce restare lontano dai riflettori"), nessuna sourced. Di' cosa non si sa, o taglia la frase: non vestire da fatto un'invenzione.

**Prima (disclaimer cutoff):**
> Sebbene i dettagli specifici sulla fondazione dell'azienda non siano ampiamente documentati nelle fonti facilmente disponibili, sembra che sia stata stabilita negli anni Novanta.

**Dopo:**
> L'azienda è stata fondata nel 1994, secondo i documenti di registrazione.

**Prima (riempimento speculativo):**
> Le informazioni sulla sua prima formazione non sono pubblicamente disponibili, suggerendo che mantenga un profilo basso e preferisca tenere riservati i dettagli personali. Probabilmente è cresciuta in un contesto familiare borghese, il che potrebbe aver influenzato il suo successivo interesse per la riforma educativa.

**Dopo:**
> La sua prima formazione non è documentata nelle fonti disponibili. (Oppure ometti la sezione.)


### 22. Tono adulatore/servile

**Problema:** linguaggio eccessivamente positivo, da people-pleaser.

**Prima:**
> Ottima domanda! Hai assolutamente ragione, è un tema complesso. Ottimo punto sui fattori economici.

**Dopo:**
> I fattori economici che hai citato sono rilevanti qui.


## RIEMPITIVI E HEDGING

### 23. Frasi-riempitivo

**Prima → Dopo:**
- "Al fine di raggiungere questo obiettivo" → "Per raggiungere questo"
- "Per via del fatto che stava piovendo" → "Perché stava piovendo"
- "In questo momento" → "Ora"
- "Nel caso in cui ti servisse aiuto" → "Se ti serve aiuto"
- "Il sistema ha la capacità di processare" → "Il sistema può processare"
- "È importante notare che i dati mostrano" → "I dati mostrano"
- "Va sottolineato che" → [taglia]
- "Si potrebbe affermare che" → [scrivi direttamente l'affermazione]
- "Risulta essere importante che" → "Importa che" / "È importante che"


### 24. Hedging eccessivo

**Problema:** sovra-qualificazione delle affermazioni.

**Prima:**
> Si potrebbe potenzialmente sostenere che la politica potrebbe avere qualche effetto sui risultati.

**Dopo:**
> La politica può influire sui risultati.


### 25. Conclusioni positive generiche

**Problema:** chiusure vaghe e ottimiste.

**Prima:**
> Il futuro si prospetta luminoso per l'azienda. Tempi entusiasmanti attendono mentre continuano il loro percorso verso l'eccellenza. Questo rappresenta un passo importante nella giusta direzione.

**Dopo:**
> L'azienda prevede di aprire due nuove sedi nel prossimo anno.


### 26. Abuso di coppie con trattino / aggettivi composti

**Parole da sorvegliare:** "real-time", "end-to-end", "long-term", "cross-functional", "data-driven", "open-source", "off-the-shelf".

**Problema:** l'AI esporta meccanicamente i compound inglesi con trattino anche in italiano, dove spesso si traducono come singole locuzioni: "in tempo reale", "fine a fine", "a lungo termine", "interfunzionale", "guidato dai dati", "open source" (anche scritto senza trattino), "pronto all'uso". Tieni l'inglese se è termine tecnico stabilito (es: real-time DSP, end-to-end encryption), traduci altrove.

**Prima:**
> Il team cross-functional ha prodotto un report data-driven di alta qualità. Il team è cross-functional, il report è data-driven e la metodologia è long-term.

**Dopo:**
> Il team interfunzionale ha prodotto un report guidato dai dati, di buona qualità. Il team è interfunzionale, il report è guidato dai dati, la metodologia è di lungo termine.


### 27. Tropi di autorità persuasiva

**Frasi da sorvegliare:** la vera domanda è, alla base, in realtà, ciò che conta davvero, fondamentalmente, la questione più profonda, il cuore della questione.

**Problema:** gli LLM usano queste frasi per fingere di tagliare il rumore e arrivare a una verità più profonda, mentre la frase che segue di solito ripete un punto ordinario con cerimonia.

**Prima:**
> La vera domanda è se i team riusciranno ad adattarsi. Alla base, ciò che conta davvero è la prontezza organizzativa.

**Dopo:**
> La domanda è se i team riusciranno ad adattarsi. Dipende soprattutto da quanto l'organizzazione è disposta a cambiare abitudini.


### 28. Signposting e annunci

**Frasi da sorvegliare:** Approfondiamo, esploriamo, scomponiamo, ecco quello che devi sapere, ora vediamo, senza ulteriori indugi.

**Problema:** gli LLM annunciano cosa stanno per fare invece di farlo. Questa meta-comunicazione rallenta il testo e gli dà il sapore di tutorial.

**Prima:**
> Approfondiamo come funziona il caching in Next.js. Ecco cosa devi sapere.

**Dopo:**
> Next.js fa caching dei dati a più livelli: memoizzazione delle richieste, data cache e router cache.


### 29. Header frammentati

**Segni da sorvegliare:** un titolo seguito da un paragrafo di una riga che semplicemente riformula il titolo prima che inizi il contenuto vero.

**Problema:** gli LLM aggiungono spesso una frase generica dopo un titolo come riscaldamento retorico. Non aggiunge nulla, fa apparire la prosa imbottita.

**Prima:**
> ## Performance
>
> La velocità conta.
>
> Quando un utente trova una pagina lenta, se ne va.

**Dopo:**
> ## Performance
>
> Quando un utente trova una pagina lenta, se ne va.


### 30. Scrittura ancorata al diff

**Problema:** documentazione o commenti scritti come se raccontassero un cambiamento invece di descrivere la cosa com'è. A meno che il documento non sia per natura version-scoped (changelog, release note, migration guide), deve leggere coerentemente senza conoscere cosa è cambiato nell'ultimo commit.

**Prima:**
> Questa funzione è stata aggiunta per sostituire il precedente approccio iterativo su tutti gli elementi, che causava prestazioni O(n²).

**Dopo:**
> Questa funzione usa una hash map per lookup in O(1), evitando il costo O(n²) dell'iterazione naïve.


## GUIDA ALLA RILEVAZIONE

### Cosa NON segnalare (falsi positivi)

Un autore umano pulito può colpire diversi pattern sopra senza alcun coinvolgimento AI. Prima di riscrivere, controlla di non eviscerare prosa legittima. I seguenti *non* sono indicatori affidabili da soli:

- **Grammatica perfetta e stile consistente.** Molti autori sono professionisti o sono stati editati. Pulizia non vuol dire AI.
- **Registri misti casual/formale.** Spesso segnala una persona in un campo tecnico, un autore giovane, o uno stile neurodivergente — non un chatbot.
- **Prosa "piatta" o "robotica".** La prosa AI ha tells *specifici*. Asciuttezza generica senza quei tells è solo scrittura asciutta.
- **Vocabolario formale o accademico.** L'AI abusa di parole fancy *specifiche* (vedi §7), non di ogni parola fancy. Non appiattire "ovverosia" o "concomitante" solo perché suonano colti.
- **Apertura o chiusura epistolare.** Saluti e firme precedono ChatGPT di secoli.
- **Connettivi comuni isolati.** *Inoltre*, *tuttavia*, *di conseguenza* sono AI-coded solo quando accumulati. Un *però* solo non è un tell.
- **Virgolette tipografiche isolate.** macOS, Word, Google Docs e molti CMS curlano in automatico. Le smart quotes contano solo combinate con altri tells.
- **Em-dash isolati.** Molti editor e giornalisti li usano spesso. L'em-dash è prova solo quando associato a ritmo formulaico da venditore.
- **Affermazioni non citate.** La maggior parte del web è non citato. La mancanza di citazioni non prova nulla.
- **Formattazione corretta e complessa.** Editor visuali e template producono output pulito senza alcuna AI.

In caso di dubbio, cerca **cluster** di tells, non isolati. Un singolo em-dash non dice nulla; em-dash più regola del tre più "vibrante arazzo" più sezione "Conclusione" è una confessione.


### Segni di scrittura umana (da preservare)

Quando li vedi, lascia stare la prosa — sono prove di una persona reale che scrive, e sovra-editare distruggerà quello che la rende umana:

- **Dettagli specifici, insoliti, difficili da fabbricare.** Un indirizzo vero. Una citazione strana. La frase "il geometra che lavorava al piano sopra del mio dentista". Gli LLM arrotondano i dettagli; gli umani li tesaurizzano.
- **Sentimenti misti e tensione irrisolta.** "Penso sia per lo più una buona scelta, ma mi infastidisce, e non so spiegare bene perché." Gli LLM tendono a posizioni pulite.
- **Riferimenti datati, epoca-specifici.** Slang, meme, in-joke che mappano a un anno e a una sottocultura specifici. I modelli ritardano di un anno o più.
- **Scelte editoriali in prima persona che l'autore può difendere.** Se l'autore può spiegare *perché* ha fatto un certo taglio o usato una certa parola, è segnale forte di umanità.
- **Varietà nella lunghezza-frase.** La scrittura reale alterna corte e lunghe. La scrittura AI tende a un ritmo uniforme di lunghezza media.
- **Vere digressioni, parentesi, autocorrezioni.** "(Mi viene da scrivere 'quasi' qui, ma era proprio certo.)" I modelli raramente si interrompono così.
- **Edit precedenti al 30 novembre 2022.** Lancio pubblico di ChatGPT. Qualsiasi cosa più vecchia di così, con eccezioni molto rare, non è AI.


---

## Processo e Output

1. Leggi l'input con attenzione e identifica ogni occorrenza dei pattern sopra.
2. Scrivi una **bozza di riscrittura**. Controlla che legga in modo naturale ad alta voce, vari la lunghezza-frase, preferisca dettagli specifici e costruzioni semplici (è/sono/ha), e mantenga il registro appropriato.
3. Chiediti: **"Cosa rende il testo sotto così evidentemente AI-generated?"** Rispondi brevemente con i tells residui.
4. Rivedi in una **riscrittura finale** che li affronti e non contenga em-dash né en-dash (vedi §14).

Consegna la bozza, i bullet "ancora-AI" brevi, la riscrittura finale e (opzionalmente) un breve riepilogo dei cambiamenti.


## Esempio completo

**Prima (AI-sounding):**
> Ottima domanda! Ecco un saggio sull'argomento. Spero ti sia utile!
>
> L'assistenza alla programmazione AI rappresenta una duratura testimonianza del potenziale trasformativo dei large language model, segnando un momento pivotale nell'evoluzione dello sviluppo software. Nell'attuale panorama tecnologico in rapida evoluzione, questi strumenti pionieristici — collocati all'intersezione tra ricerca e pratica — stanno rimodellando il modo in cui gli ingegneri ideano, iterano e consegnano, evidenziando il loro ruolo cruciale nei workflow moderni.
>
> Alla base, la value proposition è chiara: snellire i processi, valorizzare la collaborazione e promuovere l'allineamento. Non si tratta solo di autocomplete, ma di sbloccare la creatività su scala, garantendo che le organizzazioni possano restare agili offrendo agli utenti esperienze fluide, intuitive e potenti. Lo strumento si configura come catalizzatore. L'assistente funge da partner. Il sistema rappresenta una base per l'innovazione.
>
> Osservatori di settore hanno notato che l'adozione è accelerata dagli esperimenti hobbistici ai rollout enterprise-wide, dagli sviluppatori solitari ai team cross-functional. La tecnologia è stata coperta da Wired, Il Sole 24 Ore e La Repubblica. Inoltre, la capacità di generare documentazione, test e refactor mostra come l'AI possa contribuire a outcome migliori, evidenziando l'intricata interazione tra automazione e giudizio umano.
>
> - 💡 **Velocità:** la generazione di codice è significativamente più rapida, riducendo l'attrito e potenziando gli sviluppatori.
> - 🚀 **Qualità:** la qualità dell'output è stata potenziata grazie a training migliorato, contribuendo a standard più alti.
> - ✅ **Adozione:** l'utilizzo continua a crescere, riflettendo tendenze di settore più ampie.
>
> Sebbene i dettagli specifici siano limitati sulla base delle informazioni disponibili, si potrebbe potenzialmente sostenere che questi strumenti potrebbero avere qualche effetto positivo. Pur con sfide tipiche delle tecnologie emergenti — incluse allucinazioni, bias e responsabilità — l'ecosistema continua a prosperare. Al fine di realizzare appieno questo potenziale, i team devono allinearsi alle best practice.
>
> In conclusione, il futuro si prospetta luminoso. Tempi entusiasmanti attendono mentre proseguiamo il viaggio verso l'eccellenza. Fammi sapere se vuoi che approfondisca qualche sezione!

**Bozza di riscrittura:**
> Gli assistenti AI alla programmazione accelerano alcuni compiti. In uno studio Google del 2024 gli sviluppatori che usavano Codex completavano funzioni semplici il 55% più velocemente di un gruppo di controllo, ma non mostravano miglioramenti in debug o decisioni architetturali.
>
> Sono bravi sul boilerplate: file di configurazione, scaffolding di test, refactor ripetitivi. Sono cattivi nel sapere quando sbagliano. Ho accettato in massa suggerimenti che compilavano, passavano il lint, e facevano la cosa sbagliata perché avevo smesso di leggere.
>
> Mira, sviluppatrice in una fintech, mi ha detto che usa Copilot "come autocomplete per il codice noioso" ma rivede ogni riga prima del commit. Giacomo, senior in un'azienda più grande, l'ha disattivato dopo che continuava a suggerire pattern di una libreria interna deprecata.
>
> Le metriche di produttività sono difficili da verificare. GitHub dice che gli utenti Copilot "accettano il 30% dei suggerimenti", ma accettazione non è correttezza, e correttezza non è valore. Lo studio Uplevel 2024 non ha trovato differenza statisticamente significativa nel throughput di pull request tra team con e senza assistenti AI.
>
> Niente di tutto questo significa che gli strumenti siano inutili. Significa che sono strumenti. Non sostituiscono il giudizio, non eliminano il bisogno di test. Senza test non puoi sapere se il suggerimento è giusto.

**Cosa rende il testo sotto così evidentemente AI-generated?**
- Il ritmo è ancora troppo pulito (contrasti netti, paragrafi a passo uniforme).
- Le persone e gli studi citati possono leggere come plausibili-ma-inventati a meno che non siano reali e sourced.
- La chiusura suona ancora un po' da slogan ("Senza test non puoi sapere...") invece di sembrare una persona che parla.

**Ora rendilo non-AI in modo evidente:**
> Gli assistenti AI alla programmazione ti rendono più veloce sulle parti noiose. Non su tutto. Sicuramente non sull'architettura.
>
> Sono ottimi sul boilerplate: file di configurazione, scaffolding di test, refactor ripetitivi. Sono ottimi anche a sembrare giusti mentre sbagliano. Ho accettato suggerimenti che compilavano, passavano il lint, e mancavano il punto perché avevo smesso di leggere.
>
> La gente con cui parlo tende a stare in due campi. Alcuni lo usano come autocomplete per le sciocchezze e rivedono ogni riga. Altri lo disattivano dopo che continua a suggerire pattern che non vogliono. Entrambi mi sembrano ragionevoli.
>
> Le metriche di produttività scivolano via. GitHub può dire che gli utenti Copilot "accettano il 30% dei suggerimenti", ma accettazione non è correttezza, e correttezza non è valore. Senza test stai praticamente tirando a indovinare.

**Cambiamenti fatti:** rimosso il framing da chatbot, l'inflazione di significato, padding promozionale e con gerundio, regola del tre e variazione sinonimica, falsi range, evitamento copula, em-dash/emoji/grassetto/curly quote, la sezione "Sfide" formulaica, disclaimer di cutoff e hedging, riempitivi e framing persuasivo, conclusione ottimista generica — poi ricostruita la voce con ritmo vario e dettagli concreti.


## Riferimento

Adattato da:
- [blader/humanizer](https://github.com/blader/humanizer) (MIT, Siqi Chen, 2025)
- Wikipedia: [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), mantenuta da WikiProject AI Cleanup.

Insight chiave da Wikipedia: "Gli LLM usano algoritmi statistici per indovinare cosa dovrebbe venire dopo. Il risultato tende al più statisticamente probabile per la più ampia varietà di casi."
