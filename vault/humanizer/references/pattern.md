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

