#!/usr/bin/env bash
# ==============================================================================
# setup_texmf.sh — Enlaza los estilos Mathwizards en TEXMFHOME
# ==============================================================================
# Hace que \usepackage{mathwizards-*} funcione desde CUALQUIER directorio,
# sin depender del cwd ni de TEXINPUTS. Es idempotente y auto-reparable:
# vuelve a enlazar (y limpia enlaces rotos) aunque muevas el repo de sitio.
#
#   ./setup_texmf.sh
#
# (La compilación con LaTeX Workshop / Ctrl+S ya funciona sin esto gracias a
#  .vscode/settings.json; esto es un extra para compilar por CLI en cualquier lado.)
# ==============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STYLES_DIR="$REPO_ROOT/styles"

if [[ ! -d "$STYLES_DIR" ]]; then
    echo "Error: no se encontró $STYLES_DIR" >&2
    exit 1
fi

# TEXMFHOME según kpathsea (fallback a ~/texmf)
TEXMFHOME="$(kpsewhich -var-value=TEXMFHOME 2>/dev/null || true)"
[[ -z "$TEXMFHOME" ]] && TEXMFHOME="$HOME/texmf"

DEST="$TEXMFHOME/tex/latex/mathwizards"
mkdir -p "$DEST"

# Elimina enlaces simbólicos rotos (p. ej. si el repo se movió)
find "$DEST" -maxdepth 1 -type l ! -exec test -e {} \; -delete

# (Re)enlaza todos los estilos actuales
ln -sf "$STYLES_DIR"/*.sty "$DEST/"

# Actualiza la base de datos de kpathsea
if command -v texhash >/dev/null 2>&1; then
    texhash "$TEXMFHOME" >/dev/null 2>&1 || true
fi

echo "✓ Estilos enlazados en: $DEST"
ls -1 "$DEST"
