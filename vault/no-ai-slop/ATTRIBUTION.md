# Attribuzione

Questa skill è un adattamento italiano della skill `no-ai-slop` distribuita nel repository:

- **Upstream:** [realrossmanngroup/no_ai_slop_writing_rules](https://github.com/realrossmanngroup/no_ai_slop_writing_rules)
- **Commit sorgente:** `b812c96c0abe9c0891a583a86d22a14145de5ac0` (main, 2026-05-28)
- **File sorgente:**
  - `.claude/skills/no-ai-slop/SKILL.md`
  - `.claude/skills/no-ai-slop/references/ai-writing-detection.md`

## Licenza

Il repository upstream non dichiara una licenza esplicita al commit citato. Questo adattamento mantiene attribuzione e link upstream come buona pratica.

## Cosa è cambiato

- Tradotto e riformulato in italiano (non traduzione 1:1).
- Liste di parole bandite riadattate al lessico accademico italiano (verbi svuotati: "rappresenta", "costituisce", "si configura come"; transizioni: "Inoltre", "Tuttavia", "Pertanto", "In tal senso"; tells: "il presente lavoro", "nella fattispecie", "alla luce di", "in definitiva").
- Esempi WRONG/RIGHT riscritti con casi pertinenti al contesto del paper CIM 2026 (informatica musicale, sintesi granulare, sistema PGE).
- Aggiunti tells specifici dell'italiano accademico (abuso del gerundio in coda, doppi aggettivi decorativi, virgolette caporali).
- Sezione di self-check estesa con i due nuovi check italiani (gerundi a coda; verbi svuotati `rappresenta`/`costituisce`).

## Skill non importate dall'upstream

L'upstream contiene anche la skill `rossmann-voice` (profilo della voce di Louis Rossmann, marcatamente anglofono e persona-specifico). Non importata: non adatta a scrittura accademica italiana.
