---
name: read-sms
description: Read recent SMS messages on the Android device via Termux:API. Use when the user asks about text messages, SMS, or wants a summary of recent messages.
---

# Read SMS

Requires `pkg install termux-api` and the Termux:API companion app (F-Droid,
same source as Termux — mismatched sources will silently fail to connect).

Reading SMS sends that content to whatever model provider is configured
(here, NVIDIA's API) as part of the conversation. Tell the user this before
running it the first time in a session.

## Usage

Run the bundled script and summarize its output for the user:

```bash
bash "$SKILL_DIR/read_sms.sh" 10
```

The argument is how many recent messages to fetch (default 5). Output is
JSON: a list of {"from", "body", "date"} objects. Do not print raw phone
numbers back to the user unless asked — prefer summarizing content.
