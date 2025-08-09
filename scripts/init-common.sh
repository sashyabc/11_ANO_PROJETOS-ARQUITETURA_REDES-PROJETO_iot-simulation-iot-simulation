#!/usr/bin/env bash
set -euo pipefail

COMMON_URL="${1:-}"
if [[ -z "${COMMON_URL}" ]]; then
  echo "Uso: ./scripts/init-common.sh <URL-do-repo-common.git>"
  exit 1
fi

if [[ ! -d ".git" ]]; then
  git init
  git add .
  git commit -m "chore: initial template"
fi

if [[ -d "common/.git" ]]; then
  echo "Submódulo 'common' já existe."
else
  git submodule add "${COMMON_URL}" common
fi

git commit -am "chore: add common as submodule" || true
echo "OK: submódulo common configurado."
