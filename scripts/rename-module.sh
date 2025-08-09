#!/usr/bin/env bash
set -euo pipefail

NEW_NAME="${1:-}"
if [[ -z "${NEW_NAME}" ]]; then
  echo "Uso: ./scripts/rename-module.sh <nome-modulo>"
  exit 1
fi

# Pai: artifactId = <nome>-parent
sed -i.bak "s/<artifactId>module-parent<\/artifactId>/<artifactId>${NEW_NAME}-parent<\/artifactId>/g" pom.xml && rm -f pom.xml.bak
# Filho app: artifactId = <nome>
sed -i.bak "s/<artifactId>app<\/artifactId>/<artifactId>${NEW_NAME}<\/artifactId>/g" app/pom.xml && rm -f app/pom.xml.bak
# Atualiza a referência do parent no app
sed -i.bak "s/<artifactId>module-parent<\/artifactId>/<artifactId>${NEW_NAME}-parent<\/artifactId>/g" app/pom.xml && rm -f app/pom.xml.bak

echo "OK: renomeado para '${NEW_NAME}' (pai: ${NEW_NAME}-parent / app: ${NEW_NAME})."
