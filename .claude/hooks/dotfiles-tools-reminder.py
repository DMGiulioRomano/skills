#!/usr/bin/env python3
# PreToolUse/Bash: se il comando installa un programma, ricorda di proporre tools.txt.
import json,re,sys
c=json.load(sys.stdin).get("tool_input",{}).get("command","")
s=r"(?:^|[;&|\n(]\s*)(?:sudo\s+)?"
if re.search(s+r"(?:brew\s+(?:\S+\s+)?install|port\s+(?:-\S+\s+)*install)\b",c) or re.search(s+r"(?:curl|wget)\b[^\n;&]*\|\s*(?:sudo\s+)?(?:ba|z)?sh\b",c):
    print(json.dumps({"hookSpecificOutput":{"hookEventName":"PreToolUse","additionalContext":"Questo comando installa un programma sul computer. Se non è già in tools.txt di ~/github/DMGiulioRomano/dotfiles, chiedi all'utente se aggiungerlo (regola dotfiles-tools)."}}))
