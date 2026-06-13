#!/usr/bin/env bash
set -euo pipefail

ROOT="/root/espiao"
LOG_DIR="$ROOT/automation/logs"
STAMP="$(date +%Y%m%d-%H%M%S)"
LOG="$LOG_DIR/autocorrecao-$STAMP.log"

mkdir -p "$LOG_DIR"
{
  echo "# Autocorrecao segura — $STAMP"
  echo
  echo "## Git status"
  git -C "$ROOT" status --short || true
  echo
  echo "## Skills check"
  openclaw skills check || true
  echo
  echo "## Gbrain doctor"
  export PATH="/root/.bun/bin:$PATH"
  gbrain doctor || true
  echo
  echo "## Arquivos essenciais"
  for f in mapa.md People.md Projects.md Pendencias.md MEMORY.md SOUL.md AGENTS.md; do
    if [ -f "$ROOT/$f" ]; then
      echo "OK $f"
    else
      echo "MISSING $f"
    fi
  done
} > "$LOG" 2>&1

echo "$LOG"
