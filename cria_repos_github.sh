#!/usr/bin/env bash
set -euo pipefail
USER="sashyabc"
BASE="../repos-modulos"   # se estiver a rodar dentro de iot-simulation/, isso está correto

for d in "$BASE"/*; do
  [ -d "$d/.git" ] || { echo "Pulando '$d' (não é repo git)"; continue; }
  repo="$(basename "$d")"
  echo "==> Processando $USER/$repo"

  # Verifica se o repo já existe no GitHub
  if gh repo view "$USER/$repo" >/dev/null 2>&1; then
    echo "   Repo já existe no GitHub. Só vou configurar remote e dar push."
    if ! git -C "$d" remote | grep -q '^origin$'; then
      git -C "$d" remote add origin "git@github.com:${USER}/${repo}.git"
    fi
    git -C "$d" push -u origin main
  else
    echo "   Criando no GitHub e fazendo push..."
    gh repo create "$USER/$repo" --private -y
    if ! git -C "$d" remote | grep -q '^origin$'; then
      git -C "$d" remote add origin "git@github.com:${USER}/${repo}.git"
    fi
    git -C "$d" push -u origin main
    # (opcional) definir main como branch padrão
    gh repo edit "$USER/$repo" --default-branch main >/dev/null 2>&1 || true
  fi

  echo "✓ $repo ok"
  echo
done

