#!/usr/bin/env bash
set -euo pipefail

### ============================
### Configurações
### ============================
# Lista dos módulos (pastas) a exportar. Inclui "common".
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

# Diretório onde os repositórios exportados serão criados (fora do monorepo)
EXPORT_BASE="../repos-modulos"
mkdir -p "$EXPORT_BASE"

# Default: não reescrever pom; use --rewrite-pom para ativar
REWRITE_POM="false"

# Informativo: usuário/org GitHub e protocolo para montar o comando "remote add"
GITHUB_USER=""
PROTOCOL="ssh"   # ssh|https

### ============================
### Parse de argumentos
### ============================
usage() {
  cat <<EOF
Uso: $0 [--rewrite-pom] [--github-user SEU_USUARIO] [--protocol ssh|https]

--rewrite-pom       Reescreve pom.xml de cada módulo para compilar sozinho (sem parent).
--github-user USER  Seu usuário ou organização no GitHub (apenas para imprimir comandos 'remote add').
--protocol PROTO    'ssh' (padrão) ou 'https' para a URL do remote.
EOF
}
while [[ $# -gt 0 ]]; do
  case "$1" in
    --rewrite-pom) REWRITE_POM="true"; shift;;
    --github-user) GITHUB_USER="$2"; shift 2;;
    --protocol) PROTOCOL="$2"; shift 2;;
    -h|--help) usage; exit 0;;
    *) echo "Arg desconhecido: $1"; usage; exit 1;;
  esac
done

### ============================
### Templates
### ============================

GITIGNORE_CONTENT='
# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties

# IntelliJ
.idea/
*.iml
out/

# Sistema
.DS_Store
Thumbs.db

# Logs
*.log
'

# POM stand-alone para módulos (sem parent). Para o "common", packaging jar sem deps.
pom_standalone_common() { cat <<'EOF'
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>pt.projeto.iot</groupId>
  <artifactId>common</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>
  <name>common</name>
  <properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
  </properties>
</project>
EOF
}

pom_standalone_modulo() {
  local artifact="$1"
  cat <<EOF
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>pt.projeto.iot</groupId>
  <artifactId>${artifact}</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>
  <name>${artifact}</name>
  <properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
  </properties>
  <dependencies>
    <!-- Cada aluno clona o repo 'common' e roda: mvn -q -f common/pom.xml install -->
    <dependency>
      <groupId>pt.projeto.iot</groupId>
      <artifactId>common</artifactId>
      <version>1.0-SNAPSHOT</version>
    </dependency>
  </dependencies>
</project>
EOF
}

remote_hint() {
  local repo="$1"
  if [[ -z "$GITHUB_USER" ]]; then
    echo "   -> Depois crie o repositório no GitHub e rode:"
    echo "      git remote add origin <URL-do-seu-repositorio> && git push -u origin main"
    return
  fi
  if [[ "$PROTOCOL" == "ssh" ]]; then
    echo "   -> Remote sugerido:"
    echo "      git remote add origin git@github.com:${GITHUB_USER}/${repo}.git"
  else
    echo "   -> Remote sugerido:"
    echo "      git remote add origin https://github.com/${GITHUB_USER}/${repo}.git"
  fi
  echo "      git push -u origin main"
}

### ============================
### Execução
### ============================

echo "Exportando módulos para: $EXPORT_BASE"
for module in "${MODULES[@]}"; do
  src_dir="./${module}"
  [[ -d "$src_dir" ]] || { echo "!! Pasta não encontrada: ${src_dir} (pulando)"; continue; }

  out_dir="${EXPORT_BASE}/${module}"
  if [[ -d "$out_dir/.git" ]]; then
    echo "-- Repo já existente: ${out_dir} (pulando init)"
    continue
  fi

  echo "==> Exportando ${module}"
  mkdir -p "$out_dir"
  rsync -a --delete --exclude '.git' --exclude 'target' "${src_dir}/" "${out_dir}/"

  # Reescrever POM se solicitado
  if [[ "$REWRITE_POM" == "true" ]]; then
    if [[ "$module" == "common" ]]; then
      mv "${out_dir}/pom.xml" "${out_dir}/pom.monorepo.xml" || true
      pom_standalone_common > "${out_dir}/pom.xml"
    else
      mv "${out_dir}/pom.xml" "${out_dir}/pom.monorepo.xml" || true
      pom_standalone_modulo "$module" > "${out_dir}/pom.xml"
    fi
  fi

  # .gitignore
  if [[ ! -f "${out_dir}/.gitignore" ]]; then
    echo "$GITIGNORE_CONTENT" > "${out_dir}/.gitignore"
  fi

  # Git init
  pushd "$out_dir" >/dev/null
  git init
  git add .
  git commit -m "Export inicial do módulo '${module}'"
  git branch -M main
  popd >/dev/null

  echo "✓ Módulo '${module}' exportado em: ${out_dir}"
  remote_hint "$module"
  echo
done

echo "Concluído. Repositórios locais criados em: $EXPORT_BASE"
echo "Agora crie os repositórios privados no GitHub, adicione os colaboradores e faça o 'push' conforme instruções acima."
