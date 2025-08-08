#!/usr/bin/env bash
set -euo pipefail

# Caminho para a pasta onde estão os repositórios individuais clonados
BASE="../repos-modulos"
USER="sashyabc"

# Lista de módulos que serão sincronizados
MODULES=(
  common
  agri-drone
  air-quality-sensor
  camera-sim
  energy-meter
  gate-controller
  gps-tracker
  heart-rate-monitor
  humidity-sensor
  oximeter
  pir-motion-sensor
  rfid-reader
  robot-vacuum
  smart-dispenser
  smart-lamp
  smart-lock
  smart-plug
  smart-traffic-light
  smoke-sensor
  soil-sensor
  temperature-sensor
  thermostat
  vibration-sensor
  water-level-sensor
  weather-station
)

echo "=== Sincronizando do monorepo para repos individuais ==="

for module in "${MODULES[@]}"; do
  SRC_DIR="$module"
  DEST_DIR="$BASE/$module"

  # Verifica se o repositório destino existe e é um repo Git
  if [ ! -d "$DEST_DIR/.git" ]; then
    echo "⚠️  $DEST_DIR não encontrado ou não é um repositório Git. Pulando..."
    continue
  fi

  echo "==> Atualizando módulo: $module"

  # Sincroniza do monorepo para o repositório individual, preservando o .git
  rsync -a --delete --exclude '.git' "$SRC_DIR/" "$DEST_DIR/"

  # Commit e push das alterações
  pushd "$DEST_DIR" > /dev/null
    git add -A
    if git diff --cached --quiet; then
      echo "   Nenhuma alteração para enviar."
    else
      git commit -m "Sincronização automática do monorepo"
      git push -u origin main
    fi
  popd > /dev/null
done

echo "=== Sincronização concluída ==="

