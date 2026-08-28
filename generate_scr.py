#!/usr/bin/env python3
# ==============================================================================
#  generate_scr.py — Genera versiones sin respuestas (_scr) de las guías TeX
# ==============================================================================
#  Para cada archivo .tex dentro de tex_files/ que contenga una sección de
#  respuestas (`\section{Clave de Respuestas}` o `\section*{Respuestas
#  seleccionadas}`), escribe una copia `<nombre>_scr.tex` con esa sección
#  eliminada (modo por defecto, "truncar") o envuelta en \ifmwclaves (modo --wrap).
#
#  Uso:
#    python3 generate_scr.py                     # todos los .tex con respuestas
#    python3 generate_scr.py --filter guia1      # solo rutas que contengan "guia1"
#    python3 generate_scr.py --dry-run           # solo listar, sin escribir
#    python3 generate_scr.py --wrap              # envolver con \ifmwclaves (Parte 2)
#    python3 generate_scr.py --root tex_files    # otra raíz (por defecto tex_files)
#
#  Propiedades:
#    * Solo usa la biblioteca estándar, con codificación UTF-8 (rutas con acentos).
#    * Idempotente: reescribir sobre el mismo original no cambia el resultado.
#    * Ignora los archivos que ya terminan en _scr.tex o _sr.tex.
# ==============================================================================

import argparse
import io
import re
import sys
from pathlib import Path

# ── Configuración ─────────────────────────────────────────────────────────────
DEFAULT_ROOT = "tex_files"
GENERATED_MARKER = "% Generado automáticamente: versión sin respuestas (_scr)"
END_DOC = r"\end{document}"
SECTION_BEGIN = r"\begin{document}"

# Patrones de sección de respuestas (tolera `\section*` y espacios iniciales).
# Cada entrada es (regex, True si es el patrón "Respuestas seleccionadas").
ANSWER_SECTION_RES = [
    (re.compile(r"^\s*\\section\s*\{\s*Clave de Respuestas\s*\}"), False),
    (re.compile(r"^\s*\\section\*\s*\{\s*Respuestas seleccionadas\s*\}"), True),
]

# Líneas con ruido de maquetación que se recortan al final de la versión _scr.
NOISE_LINES = [
    re.compile(r"^%[=\-─_~\.\s]*$"),  # banners decorativos tipo % =====, % -----
    re.compile(r"^\\newpage\s*$"),
    re.compile(r"^\\vspace\s*\{"),
]


def find_answer_section_start(lines):
    """Devuelve el índice de la primera línea que abre una sección de respuestas
    (o None si no aparece). También informa de qué patrón fue."""
    for i, line in enumerate(lines):
        for regex, is_selected in ANSWER_SECTION_RES:
            if regex.match(line):
                return i, is_selected
    return None, False


def find_line(lines, pattern):
    for i, line in enumerate(lines):
        if pattern.match(line):
            return i
    return -1


def trim_trailing_noise(lines):
    """Elimina, desde el final, líneas en blanco, banners `%`, `\newpage` y
    `\vspace{...}` que queden colgando antes de la sección de respuestas."""
    result = list(lines)
    while result:
        stripped = result[-1].strip()
        if stripped == "":
            result.pop()
        elif any(rx.match(stripped) for rx in NOISE_LINES):
            result.pop()
        else:
            break
    return result


def find_document_end(lines):
    """Índice de la línea que contiene \\end{document} (o None si no existe)."""
    for i, line in enumerate(lines):
        if line.strip() == END_DOC:
            return i
    return None


def build_preamble_with_claves_off(lines):
    """Inserta `\\mwclavesoff` justo antes de `\\begin{document}` (modo --wrap)."""
    idx = find_line(lines, re.compile(r"^\\begin\{document\}\s*$"))
    out = list(lines)
    if idx != -1:
        out.insert(idx, "\\mwclavesoff\n")
    return out


def truncate_section(lines):
    """Elimina la sección de respuestas: corta en esa línea y añade \\end{document}."""
    idx, _ = find_answer_section_start(lines)
    if idx is None:
        return None

    kept = trim_trailing_noise(lines[:idx])
    # Asegurar una sola línea nueva al final del contenido conservado.
    while kept and not kept[-1].endswith("\n"):
        # las líneas cortadas por splitlines(keepends) conservan su \n salvo la última
        break
    out = list(kept)
    out.append(END_DOC + "\n")
    return out


def wrap_section(lines):
    """Envuelve la sección de respuestas entre `\\ifmwclaves` y `\\fi` y añade
    `\\mwclavesoff` en el preámbulo (modo --wrap, Parte 2)."""
    idx, _ = find_answer_section_start(lines)
    if idx is None:
        return None

    end_doc = find_document_end(lines)
    end_idx = end_doc if end_doc is not None else len(lines)

    before = trim_trailing_noise(lines[:idx])
    answer = lines[idx:end_idx]
    # Recortar ruido posterior a la sección de respuestas (antes de \end{document}).
    answer = trim_trailing_noise(answer)

    out = build_preamble_with_claves_off(before)
    out.append("\\ifmwclaves\n")
    out.extend(answer)
    out.append("\\fi\n\n")
    out.append(END_DOC + "\n")
    return out


# ── Parte 3.1: envolver en el propio archivo (idempotente) ────────────────
WRAP_IF = r"\ifmwclaves"
WRAP_FI = r"\fi"


def is_already_wrapped(lines, answer_idx):
    """True si la línea no-blanco inmediatamente anterior a la sección de
    respuestas es `\\ifmwclaves` (es decir, ya está envuelta)."""
    i = answer_idx - 1
    while i >= 0 and lines[i].strip() == "":
        i -= 1
    return i >= 0 and lines[i].strip() == WRAP_IF


def inplace_wrap_section(lines):
    """Envuelve la sección de respuestas en `\\ifmwclaves ... \\fi` DENTRO del
    archivo original, sin añadir `\\mwclavesoff` (por defecto las claves se
    muestran). Es PUROMENTE insertivo: no elimina `\\newpage`, banners `%` ni
    `\\vspace`, para no alterar el paginado de la versión normal. Idempotente:
    si ya está envuelta, no cambia nada."""
    idx, _ = find_answer_section_start(lines)
    if idx is None:
        return None

    if is_already_wrapped(lines, idx):
        return lines  # idempotente

    end_doc = find_document_end(lines)
    out = list(lines)

    # Insertar `\ifmwclaves` justo antes de la línea de la sección de respuestas.
    out.insert(idx, WRAP_IF + "\n")
    # `\fi` justo antes de `\end{document}` (o al final si no existe).
    if end_doc is not None:
        end_idx = end_doc + 1  # +1 porque ya insertamos una línea antes
    else:
        end_idx = len(out)
    out.insert(end_idx, WRAP_FI + "\n")
    return out


def process_file(path, wrap=False, inplace=False, dry_run=False):
    """Procesa un .tex. Devuelve un estado:
    - modo `inplace`: envuelve la sección en `\\ifmwclaves` dentro del propio
      archivo (Parte 3.1). No `_scr` ni `\\mwclavesoff`.
    - modo `wrap`: escribe `<stem>_scr.tex` con `\\ifmwclaves` + `\\mwclavesoff`.
    - default: escribe `<stem>_scr.tex` truncando (Parte 1).
    """
    if path.name.endswith("_scr.tex") or path.name.endswith("_sr.tex"):
        return "skip"

    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError) as exc:
        return f"err:{exc}"

    lines = text.splitlines(keepends=True)
    if find_answer_section_start(lines)[0] is None:
        return "no-key"

    if inplace:
        out_lines = inplace_wrap_section(lines)
        if out_lines is None:
            return "no-key"
        content = "".join(out_lines)
        path = path.resolve()
        if dry_run:
            return f"would:inplace {path.relative_to(Path.cwd())}"
        try:
            path.write_text(content, encoding="utf-8")
        except OSError as exc:
            return f"err:{exc}"
        return f"ok:inplace {path.relative_to(Path.cwd())}"

    out_lines = wrap_section(lines) if wrap else truncate_section(lines)
    if out_lines is None:
        return "no-key"

    target = path.with_name(path.stem + "_scr.tex").resolve()
    content = "".join(out_lines)
    # Añadir el marcador de generado justo tras el primer bloque de comentarios.
    content = inject_marker(content)

    if dry_run:
        return f"would:{target.relative_to(Path.cwd())}"

    try:
        target.write_text(content, encoding="utf-8")
    except OSError as exc:
        return f"err:{exc}"
    return f"ok:{target.relative_to(Path.cwd())}"


def inject_marker(content):
    """Inserta el comentario de 'generado automáticamente' tras el primer bloque
    de comentarios del archivo (o al principio si no hay bloque)."""
    lines = content.splitlines(keepends=True)
    out = []
    inserted = False
    for i, line in enumerate(lines):
        out.append(line)
        if not inserted and line.lstrip().startswith("%"):
            # Mantener juntas las líneas consecutivas de comentarios; al terminar
            # el primer bloque, inserar el marcador.
            nxt = lines[i + 1] if i + 1 < len(lines) else ""
            if not nxt.lstrip().startswith("%"):
                out.append(GENERATED_MARKER + "\n")
                inserted = True
        elif not inserted and not line.lstrip().startswith("%"):
            # Primera línea que no es comentario: insertar justo antes.
            out.insert(len(out) - 1, GENERATED_MARKER + "\n")
            inserted = True
    if not inserted:
        out.append(GENERATED_MARKER + "\n")
    return "".join(out)


def collect_tex_files(root, filter_str=None):
    """Devuelve los .tex a procesar, excluyendo las versiones _scr/_sr para no
    regenerar sobre ellas (son idempotentes por diseño, pero así el conteo y la
    salida quedan limpios)."""
    root_path = Path(root)
    files = sorted(
        f for f in root_path.rglob("*.tex")
        if not (f.name.endswith("_scr.tex") or f.name.endswith("_sr.tex"))
    )
    if filter_str:
        files = [f for f in files if filter_str in str(f)]
    return files


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Genera versiones _scr (sin respuestas) de las guías TeX."
    )
    parser.add_argument(
        "--root", default=DEFAULT_ROOT,
        help="Directorio raíz a escanear (por defecto: %(default)s).",
    )
    parser.add_argument(
        "--filter", default=None,
        help="Solo procesar rutas que contengan esta subcadena.",
    )
    parser.add_argument(
        "--wrap", action="store_true",
        help="Envolver la sección en \\ifmwclaves en vez de eliminarla (Parte 2).",
    )
    parser.add_argument(
        "--inplace-wrap", action="store_true",
        help="Envolver la sección en \\ifmwclaves DENTRO del archivo original, "
             "sin \\mwclavesoff y sin crear _scr (Parte 3.1). Idempotente.",
    )
    parser.add_argument(
        "--dry-run", action="store_true",
        help="Solo listar lo que se haría, sin escribir archivos.",
    )
    args = parser.parse_args(argv)

    if args.inplace_wrap and args.wrap:
        parser.error("--inplace-wrap y --wrap son mutuamente excluyentes.")

    files = collect_tex_files(args.root, args.filter)
    if not files:
        print(f"No se encontraron archivos .tex bajo '{args.root}'.")
        return 0

    print(f"{'#' * 70}")
    print("  Generador de versiones sin respuestas (_scr)")
    print(f"  Raíz      : {args.root}")
    if args.filter:
        print(f"  Filtro    : {args.filter}")
    if args.inplace_wrap:
        modo = "--inplace-wrap (envolver en origen, Parte 3.1)"
    elif args.wrap:
        modo = "--wrap (ifmwclaves, Parte 2)"
    else:
        modo = "truncar (por defecto, Parte 1)"
    print(f"  Modo      : {modo}")
    print(f"{'#' * 70}")

    stats = {"ok": 0, "no-key": 0, "skip": 0, "err": 0}
    for f in files:
        result = process_file(f, wrap=args.wrap, inplace=args.inplace_wrap,
                              dry_run=args.dry_run)
        if result.startswith("ok:"):
            stats["ok"] += 1
            print(f"  [ OK ] {result[3:]}")
        elif result.startswith("would:"):
            print(f"  [-- DRY --] {result[6:]}")
        elif result.startswith("err:"):
            stats["err"] += 1
            print(f"  [ERR ] {result[4:]}")
        elif result == "no-key":
            stats["no-key"] += 1
        elif result == "skip":
            stats["skip"] += 1

    if not args.dry_run and stats["ok"]:
        print(f"\nGenerados: {stats['ok']} | Sin sección de respuestas: {stats['no-key']}"
              f" | Ignorados (_scr/_sr): {stats['skip']} | Errores: {stats['err']}")
    elif not args.dry_run:
        print("\nNada que generar.")

    return 0


if __name__ == "__main__":
    sys.exit(main())
