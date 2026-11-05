#!/usr/bin/env python3
"""Status line di Claude Code: token di sessione, contesto, limiti 5 ore e 7 giorni.

Claude Code passa i dati come JSON su stdin e mostra cio' che si stampa su stdout.
I limiti arrivano solo con un abbonamento e dopo la prima risposta della sessione.
"""
import json
import sys
from datetime import datetime

LARGHEZZA = 10
RESET = "\033[0m"


def colore(percento):
    if percento >= 90:
        return "\033[31m"
    if percento >= 70:
        return "\033[33m"
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


def main():
    dati = json.load(sys.stdin)
    parti = []

    contesto = dati.get("context_window") or {}
    token = (contesto.get("total_input_tokens") or 0) + (
        contesto.get("total_output_tokens") or 0
    )
    parti.append(f"token {compatto(token)}")
    if contesto.get("used_percentage") is not None:
        parti.append(barra("contesto", contesto["used_percentage"]))

    limiti = dati.get("rate_limits") or {}
    for chiave, etichetta, formato in (
        ("five_hour", "5h", "%H:%M"),
        ("seven_day", "7g", "%a %H:%M"),
    ):
        limite = limiti.get(chiave) or {}
        if limite.get("used_percentage") is not None:
            parti.append(
                barra(
                    etichetta,
                    limite["used_percentage"],
                    scadenza(limite.get("resets_at"), formato),
                )
            )

    print(" │ ".join(parti))


if __name__ == "__main__":
    try:
        main()
    except Exception:
        print("status line: dati non leggibili")
