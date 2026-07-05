#!/usr/bin/env bash
# PreToolUse hook for the Agent tool: blocks spawning live/headless-browser
# testing agents in this project. User preference: manual review instead.
input="$(cat)"

prompt="$(echo "$input" | grep -o '"prompt"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1)"
lower="$(echo "$prompt" | tr '[:upper:]' '[:lower:]')"

if echo "$lower" | grep -qE 'playwright|headless|puppeteer|browser test|chromium'; then
  echo "User preference for this project: no automated live/headless-browser testing. Ask the user to manually review/test in their own browser instead of spawning a testing agent." >&2
  exit 2
fi

exit 0
