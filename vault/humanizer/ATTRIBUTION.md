# Attribuzione

Questa skill è un adattamento italiano della skill `humanizer`:

- **Upstream:** [blader/humanizer](https://github.com/blader/humanizer)
- **Autore:** Siqi Chen
- **Commit sorgente:** `a2ace14a88a6746f64f1f53ed8272d6788828038` (main, 2026-05-28)
- **File sorgente:** `SKILL.md` (versione 2.7.0)
- **Licenza upstream:** MIT (vedi sotto)

## Licenza MIT (upstream)

```
MIT License

Copyright (c) 2025 Siqi Chen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Cosa è cambiato

- Tradotto e riformulato in italiano (non traduzione 1:1).
- Tutti i 30 pattern di Wikipedia/humanizer mantenuti con titoli italiani equivalenti.
- Esempi WRONG/RIGHT riscritti con casi italiani plausibili (cucina veneziana, Lecco, San Giustino, Studio di Fonologia RAI Milano, IIM Padova) invece dei casi statunitensi/canadesi originali.
- Aggiunto pattern 8 con verbi svuotati italiani ("rappresenta", "costituisce", "si configura come", "si pone come", "funge da").
- Aggiunto pattern 17 adattato (title case): convenzione italiana = solo prima parola e nomi propri capitalizzati.
- Aggiunto pattern 19 adattato (virgolette): caporali `«»` come standard italiano accademico, dritte `"` per inglese o tecnico, mai smart quotes generate.
- Aggiunto pattern 26 adattato (compound con trattino): nota su quando tradurre `real-time → in tempo reale` vs quando tenere l'inglese come termine tecnico.
- Aggiunto pattern 7 con tells italiani specifici ("rappresenta", "costituisce", "in tal senso", "alla luce di", "nella fattispecie", "peraltro", "ciononostante", "in definitiva", "sostanzialmente", "fondamentalmente").
- Pattern 3 (gerundi a coda) enfatizzato come tell italiano più affidabile: equivalente del "-ing analyses" inglese.
- Esempio finale completo riscritto con tema "AI assistenti programmazione", mantenuto in italiano coerente.

## Versione

L'header YAML `version: 2.7.0-it` indica versione 2.7.0 upstream + adattamento `it`.
