#!/bin/bash

# Lista de módulos
modules=(
  common
  temperature-sensor
  humidity-sensor
  pir-motion-sensor
  smart-lamp
  smart-plug
  smart-lock
  smoke-sensor
  camera-sim
  robot-vacuum
  air-quality-sensor
  weather-station
  thermostat
  energy-meter
  soil-sensor
  agri-drone
  smart-dispenser
  gate-controller
  water-level-sensor
  smart-traffic-light
  vibration-sensor
  heart-rate-monitor
  oximeter
  rfid-reader
  gps-tracker
)

# Criar estrutura de cada módulo
for module in "${modules[@]}"; do
  mkdir -p "$module/src/main/java"
  mkdir -p "$module/src/main/resources"
  mkdir -p "$module/src/test/java"
  echo "Estrutura criada para: $module"
done

echo "✅ Todos os módulos foram criados com src/main/java, src/main/resources e src/test/java."
