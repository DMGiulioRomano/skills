#!/usr/bin/env python3
"""Status line di Claude Code, su due righe.

Riga 1: cartella, git, modello ed effort, durata, costo stimato, righe modificate.
Riga 2: token, contesto, limiti 5 ore e 7 giorni con il ritmo settimanale.

Claude Code passa i dati come JSON su stdin e mostra cio' che si stampa su stdout.
I limiti arrivano solo con un abbonamento e dopo la prima risposta della sessione.
"""
import json
import math
import os
import subprocess
import sys
import time
from datetime import datetime

LARGHEZZA = 10
SOGLIA_COMPACT = 80
SETTIMANA = 7 * 24 * 3600
RESET = "\033[0m"
GIALLO = "\033[33m"


def colore(percento):
    if percento >= 90:
        return "\033[31m"
    if percento >= 70:
        return GIALLO
    return "\033[32m"


def barra(etichetta, percento, coda=""):
    percento = max(0.0, min(100.0, float(percento)))
    piene = round(percento / 100 * LARGHEZZA)
    disegno = "█" * piene + "░" * (LARGHEZZA - piene)
    testo = f"{etichetta} {colore(percento)}{disegno}{RESET} {percento:.0f}%"
    return f"{testo} {coda}" if coda else testo


def compatto(numero):
    if numero >= 1_000_000:
        return f"{numero / 1_000_000:.1f}M"
    if numero >= 1_000:
        return f"{numero / 1_000:.1f}k"
    return str(numero)


def scadenza(epoca, formato):
    if not epoca:
        return ""
    return "↻ " + datetime.fromtimestamp(float(epoca)).strftime(formato)


def git(cartella):
    """Branch e numero di file modificati; stringa vuota fuori da un repo."""

    def esegui(*argomenti):
        return subprocess.run(
            ["git", "--no-optional-locks", "-C", cartella, *argomenti],
            capture_output=True,
            text=True,
            timeout=1,
            check=True,
        ).stdout

    try:
        branch = esegui("branch", "--show-current").strip()
        if not branch:
            branch = esegui("rev-parse", "--short", "HEAD").strip()
        modificati = len(esegui("status", "--porcelain").splitlines())
    except (OSError, subprocess.SubprocessError):
        return ""
    return f"⎇ {branch} ●{modificati}" if modificati else f"⎇ {branch}"


def effort(dati):
    """Effort dai dati della sessione, altrimenti quello salvato nelle impostazioni."""
    valore = dati.get("effort")
    if isinstance(valore, dict):
        valore = valore.get("level")
    if valore:
        return valore
    try:
        with open(os.path.expanduser("~/.claude/settings.json")) as file:
            impostazioni = json.load(file)
        modello = (dati.get("model") or {}).get("id")
        return impostazioni["modelSettings"][modello]["effortLevel"]
    except (OSError, ValueError, KeyError, TypeError):
        return ""


def durata(millisecondi):
    minuti = int(millisecondi // 60000)
    if minuti >= 60:
        return f"⏱ {minuti // 60}h{minuti % 60:02d}m"
    return f"⏱ {minuti}m"


def giorno_settimana(resets_at):
    """Giorno corrente, da 1 a 7, della finestra settimanale che scade a resets_at."""
    trascorso = SETTIMANA - (float(resets_at) - time.time())
    return max(1, min(7, math.ceil(trascorso / 86400)))


def riga_sessione(dati):
    parti = []
    spazio = dati.get("workspace") or {}
    cartella = spazio.get("current_dir") or dati.get("cwd") or ""
    if cartella:
        parti.append(os.path.basename(cartella.rstrip("/")) or cartella)
        stato_git = git(cartella)
        if stato_git:
            parti.append(stato_git)

    nome = (dati.get("model") or {}).get("display_name") or ""
    livello = effort(dati)
    modello = " · ".join(x for x in (nome, livello) if x)
    if modello:
        parti.append(modello)

    costo = dati.get("cost") or {}
    if costo.get("total_duration_ms") is not None:
        parti.append(durata(costo["total_duration_ms"]))
    if costo.get("total_cost_usd") is not None:
        parti.append(f"${costo['total_cost_usd']:.2f}")
    aggiunte = costo.get("total_lines_added")
    rimosse = costo.get("total_lines_removed")
    if aggiunte is not None or rimosse is not None:
        parti.append(f"+{aggiunte or 0} −{rimosse or 0}")
    return " │ ".join(parti)


def riga_consumi(dati):
    parti = []
    contesto = dati.get("context_window") or {}
    token = (contesto.get("total_input_tokens") or 0) + (
        contesto.get("total_output_tokens") or 0
    )
    parti.append(f"token {compatto(token)}")
    usato = contesto.get("used_percentage")
    if usato is not None:
        parti.append(barra("contesto", usato))

    limiti = dati.get("rate_limits") or {}
    cinque = limiti.get("five_hour") or {}
    if cinque.get("used_percentage") is not None:
        parti.append(
            barra("5h", cinque["used_percentage"], scadenza(cinque.get("resets_at"), "%H:%M"))
        )

    sette = limiti.get("seven_day") or {}
    if sette.get("used_percentage") is not None:
        coda = []
        if sette.get("resets_at"):
            coda.append(f"(giorno {giorno_settimana(sette['resets_at'])}/7)")
            coda.append(scadenza(sette["resets_at"], "%a %H:%M"))
        parti.append(barra("7g", sette["used_percentage"], " ".join(coda)))

    if usato is not None and usato >= SOGLIA_COMPACT:
        parti.append(f"{GIALLO}⚠ /compact{RESET}")
    return " │ ".join(parti)


def main():
    dati = json.load(sys.stdin)
    print(riga_sessione(dati))
    print(riga_consumi(dati))


if __name__ == "__main__":
    try:
        main()
    except Exception:
        print("status line: dati non leggibili")
