#!/usr/bin/env bash
set -euo pipefail
BASE="../repos-modulos"

for d in "$BASE"/*; do
  [ -d "$d/.git" ] || continue
  repo="$(basename "$d")"
  echo "==> $repo"
  git -C "$d" remote | grep -q '^origin$' || git -C "$d" remote add origin "git@github.com:sashyabc/${repo}.git"
  git -C "$d" fetch origin || true
  # Traz o que existe no GitHub e reaplica seus commits locais
  git -C "$d" pull --rebase origin main || git -C "$d" pull --rebase origin main --allow-unrelated-histories || true
  git -C "$d" push -u origin main
  echo
done
