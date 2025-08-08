#!/usr/bin/env bash
set -euo pipefail
BASE="../repos-modulos"
MSG="${1:-Atualiza módulos}"

for d in "$BASE"/*; do
  [ -d "$d/.git" ] || continue
  repo="$(basename "$d")"
  echo "==> $repo"
  git -C "$d" pull --rebase origin main || git -C "$d" pull --rebase origin main --allow-unrelated-histories || true
  git -C "$d" add -A
  # só comita se houver mudanças
  if ! git -C "$d" diff --cached --quiet; then
    git -C "$d" commit -m "$MSG"
  else
    echo "   (sem alterações para commit)"
  fi
  git -C "$d" push -u origin main
  echo
done
