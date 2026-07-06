#!/data/data/com.termux/files/usr/bin/sh
# Fetches recent SMS via Termux:API and prints minimal JSON fields.
# Requires: pkg install termux-api + Termux:API app (F-Droid).

LIMIT="${1:-5}"

if ! command -v termux-sms-list >/dev/null 2>&1; then
    echo '{"error": "termux-sms-list not found. Run: pkg install termux-api, and install the Termux:API app from F-Droid."}'
    exit 1
fi

termux-sms-list -l "$LIMIT" | python -c '
import json, sys
messages = json.load(sys.stdin)
summary = [
    {"from": m.get("number"), "body": m.get("body"), "date": m.get("received")}
    for m in messages
]
print(json.dumps(summary))
'
