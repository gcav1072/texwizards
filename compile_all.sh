#!/usr/bin/env bash
# ==============================================================================
# compile_all.sh — Recompilador de documentos LaTeX para Mathwizards STEM
# ==============================================================================
# Uso:
#   ./compile_all.sh                  # Recompila todos los .tex en tex_files/
#   ./compile_all.sh curso_3eraño     # Recompila solo los que coincidan con la ruta
#   ./compile_all.sh -f               # Fuerza recompilación (-g en latexmk)
#   ./compile_all.sh -c               # Limpia auxiliares luego de compilar
#   ./compile_all.sh -j 4             # Compila usando 4 hilos en paralelo
#
# Cada guía con respuestas (\ifmwclaves) se compila DOS veces desde el MISMO
# fuente: la versión normal y la variante _scr (sin respuestas), usando
# -usepretex='\AtBeginDocument{\mwclavesoff}' + -jobname=<stem>_scr.
# Los archivos sin \ifmwclaves (exámenes, etc.) se compilan una sola vez.
#   ./compile_all.sh guia1            # guia1...tex y guia1..._scr.tex
# ==============================================================================

set -euo pipefail

# Colores y formato
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Directorio raíz del proyecto
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEX_DIR="$REPO_ROOT/tex_files"
STYLES_DIR="$REPO_ROOT/styles"

# Exportar TEXINPUTS para que xelatex/latexmk siempre encuentren los estilos
export TEXINPUTS="$STYLES_DIR//:${TEXINPUTS:-}:"

# Opciones por defecto
FORCE_FLAG=""
CLEAN_AUX=false
JOBS=1
FILTER=""

print_help() {
    echo -e "${BOLD}Uso:${NC} ./compile_all.sh [opciones] [filtro_de_ruta]"
    echo ""
    echo "Opciones:"
    echo "  -f, --force         Fuerza la recompilación completa (latexmk -g)"
    echo "  -c, --clean         Limpia archivos auxiliares (.aux, .log, .xdv, etc.) tras compilar"
    echo "  -j, --jobs N        Número de compilaciones en paralelo (por defecto: 1)"
    echo "  -h, --help          Muestra esta ayuda"
    echo ""
    echo "Cada guía con respuestas (\\ifmwclaves) se compila DOS veces desde el"
    echo "mismo fuente: la versión normal y la variante _scr (sin respuestas)."
    echo ""
    echo "Ejemplos:"
    echo "  ./compile_all.sh                      # Todo tex_files/ (normal + _scr)"
    echo "  ./compile_all.sh lead_magnets         # Solo la carpeta lead_magnets"
    echo "  ./compile_all.sh conversiones.tex     # Solo conversiones.tex"
    echo "  ./compile_all.sh guia1                # guia1...tex y guia1..._scr.tex"
    echo "  ./compile_all.sh -f -j 4              # Todo, forzado y con 4 hilos"
    exit 0
}

# Procesar argumentos
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--force)
            FORCE_FLAG="-g"
            shift
            ;;
        -c|--clean)
            CLEAN_AUX=true
            shift
            ;;
        -j|--jobs)
            JOBS="$2"
            shift 2
            ;;
        -h|--help)
            print_help
            ;;
        -*)
            echo -e "${RED}Opción desconocida: $1${NC}"
            print_help
            ;;
        *)
            FILTER="$1"
            shift
            ;;
    esac
done

if [[ ! -d "$TEX_DIR" ]]; then
    echo -e "${RED}Error: No se encontró el directorio $TEX_DIR${NC}"
    exit 1
fi

echo -e "${BOLD}${CYAN}======================================================${NC}"
echo -e "${BOLD}${CYAN}   Mathwizards STEM — Compilador de Documentos TeX    ${NC}"
echo -e "${BOLD}${CYAN}======================================================${NC}"
echo -e "${BOLD}Directorio raíz:${NC} $REPO_ROOT"
echo -e "${BOLD}Estilos:${NC}         $STYLES_DIR"
if [[ -n "$FILTER" ]]; then
    echo -e "${BOLD}Filtro aplicado:${NC} $FILTER"
fi
echo -e "${BOLD}Paralelismo:${NC}     $JOBS proceso(s)"
echo -e "${CYAN}------------------------------------------------------${NC}"

# Buscar archivos .tex
mapfile -t ALL_FILES < <(find "$TEX_DIR" -type f -name "*.tex" | sort)

FILES_TO_COMPILE=()
for f in "${ALL_FILES[@]}"; do
    if [[ -z "$FILTER" ]] || [[ "$f" == *"$FILTER"* ]]; then
        FILES_TO_COMPILE+=("$f")
    fi
done

TOTAL=${#FILES_TO_COMPILE[@]}

if [[ $TOTAL -eq 0 ]]; then
    echo -e "${YELLOW}No se encontraron archivos .tex que coincidan con el filtro.${NC}"
    exit 0
fi

echo -e "Archivos a procesar: ${BOLD}$TOTAL${NC}\n"

# Directorio temporal para logs de error
TEMP_LOG_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_LOG_DIR"' EXIT

compile_single_file() {
    local tex_path="$1"
    local force="$2"
    local clean="$3"
    local rel_path="${tex_path#$REPO_ROOT/}"
    local dir_name="$(dirname "$tex_path")"
    local base_name="$(basename "$tex_path")"
    local stem="${base_name%.tex}"
    local log_file="$TEMP_LOG_DIR/$(echo "$rel_path" | tr '/ ' '__').log"

    cd "$dir_name"

    # Detectar si el fuente tiene la sección de respuestas envuelta (\ifmwclaves).
    # Si la tiene, además de la versión normal compilamos la variante _scr
    # (sin respuestas) usando -usepretex + -jobname, desde el MISMO fuente.
    local has_claves=false
    if grep -q "ifmwclaves" "$base_name" 2>/dev/null; then
        has_claves=true
    fi

    local ok_total=true
    local FIRST_CMD="latexmk -xelatex -interaction=nonstopmode -halt-on-error $force \"$base_name\""
    if eval "$FIRST_CMD" > "$log_file" 2>&1; then
        :
    else
        ok_total=false
    fi

    if [[ "$has_claves" == "true" ]]; then
        local SECOND_CMD="latexmk -xelatex -interaction=nonstopmode -halt-on-error $force -usepretex='\\AtBeginDocument{\\mwclavesoff}' -jobname=${stem}_scr \"$base_name\""
        if eval "$SECOND_CMD" >> "$log_file" 2>&1; then
            :
        else
            ok_total=false
        fi
    fi

    if [[ "$ok_total" == "true" ]]; then
        if [[ "$clean" == "true" ]]; then
            latexmk -c "$base_name" > /dev/null 2>&1 || true
        fi
        echo "OK|$rel_path"
    else
        echo "ERR|$rel_path|$log_file"
    fi
}

export -f compile_single_file
export REPO_ROOT
export STYLES_DIR
export TEXINPUTS
export TEMP_LOG_DIR

START_TIME=$(date +%s)
PASSED=0
FAILED=0
FAILED_LIST=()

if [[ "$JOBS" -gt 1 ]]; then
    # Ejecución en paralelo con xargs
    printf "%s\n" "${FILES_TO_COMPILE[@]}" | \
        xargs -I {} -P "$JOBS" bash -c 'compile_single_file "{}" "'"$FORCE_FLAG"'" "'"$CLEAN_AUX"'"' | \
        while IFS='|' read -r status path log; do
            if [[ "$status" == "OK" ]]; then
                echo -e "  [${GREEN} OK ${NC}] $path"
            else
                echo -e "  [${RED}FAIL${NC}] $path"
                if [[ -f "$log" ]]; then
                    echo -e "         ${YELLOW}Últimas líneas del error:${NC}"
                    tail -n 12 "$log" | sed 's/^/         │ /'
                fi
            fi
        done
else
    # Ejecución secuencial con conteo detallado
    COUNT=0
    for file in "${FILES_TO_COMPILE[@]}"; do
        COUNT=$((COUNT + 1))
        rel_path="${file#$REPO_ROOT/}"
        printf "  [%2d/%2d] Compilando %-60s ... " "$COUNT" "$TOTAL" "$rel_path"
        
        result=$(compile_single_file "$file" "$FORCE_FLAG" "$CLEAN_AUX")
        status=$(echo "$result" | cut -d'|' -f1)
        
        if [[ "$status" == "OK" ]]; then
            echo -e "[ ${GREEN}OK${NC} ]"
            PASSED=$((PASSED + 1))
        else
            echo -e "[${RED}FAIL${NC}]"
            FAILED=$((FAILED + 1))
            FAILED_LIST+=("$rel_path")
            log=$(echo "$result" | cut -d'|' -f3)
            if [[ -f "$log" ]]; then
                echo -e "         ${YELLOW}Últimas líneas del error:${NC}"
                tail -n 12 "$log" | sed 's/^/         │ /'
                echo ""
            fi
        fi
    done
fi

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo -e "\n${BOLD}${CYAN}======================================================${NC}"
echo -e "${BOLD}Resumen de Compilación:${NC}"
echo -e "  Tiempo total : ${BOLD}${DURATION}s${NC}"
if [[ "$JOBS" -eq 1 ]]; then
    echo -e "  Exitosos     : ${GREEN}${BOLD}${PASSED}${NC} / $TOTAL"
    if [[ $FAILED -gt 0 ]]; then
        echo -e "  Fallidos     : ${RED}${BOLD}${FAILED}${NC}"
        echo -e "\nArchivos con errores:"
        for f in "${FAILED_LIST[@]}"; do
            echo -e "  - ${RED}$f${NC}"
        done
    else
        echo -e "  Estado       : ${GREEN}${BOLD}¡Todos los documentos compilaron sin errores!${NC}"
    fi
else
    echo -e "  Total procesados: ${BOLD}$TOTAL${NC}"
fi
echo -e "${BOLD}${CYAN}======================================================${NC}"
