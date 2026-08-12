import os
import re
import subprocess

def main():
    tex_path = "f_int_v2.tex"
    if not os.path.exists(tex_path):
        print(f"Error: {tex_path} not found.")
        return

    with open(tex_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Preámbulo estándar para standalone
    preamble = r"""\documentclass[varwidth=8.6cm, border=10pt]{standalone}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{amsmath, amssymb}
\usepackage{xcolor}
\usepackage{enumitem}
\usepackage{tcolorbox}
\usepackage{lmodern}

\definecolor{primary}{RGB}{160, 43, 147}
\definecolor{secondary}{RGB}{180, 50, 50}

\newcommand{\dd}{\mathop{}\!\mathrm{d}}
\newcommand{\deriv}[2]{\frac{\mathrm{d} #1}{\mathrm{d} #2}}
\DeclareMathOperator{\sen}{sen}
\DeclareMathOperator{\arcsen}{arc\,sen}
\DeclareMathOperator{\arccos}{arc\,cos}
\DeclareMathOperator{\arctan}{arc\,tan}
\DeclareMathOperator{\arccot}{arc\,cot}
\DeclareMathOperator{\arcsec}{arc\,sec}
\DeclareMathOperator{\arccsc}{arc\,csc}
\renewcommand{\sin}{\sen} % Para asegurar compatibilidad si se usa \sin

\setlist[enumerate]{itemsep=3pt, parsep=0pt, leftmargin=*, label=\textbf{\arabic*.}}
"""

    # Extraer contenido dentro de multicols
    multicols_match = re.search(r"\\begin\{multicols\}\{3\}(.*?)\\end\{multicols\}", content, re.DOTALL)
    if not multicols_match:
        print("Error: no se encontró el bloque \\begin{multicols}{3} en el archivo.")
        return

    multicols_content = multicols_match.group(1).strip()
    
    # Dividir contenido usando \columnbreak
    columns = [col.strip() for col in multicols_content.split(r"\columnbreak")]
    if len(columns) != 3:
        print(f"Advertencia: Se esperaban 3 columnas, pero se encontraron {len(columns)}. Procesando las encontradas.")

    column_names = [
        "col_1_derivadas",
        "col_2_integrales",
        "col_3_identidades"
    ]

    for idx, col_content in enumerate(columns):
        if idx < len(column_names):
            name = column_names[idx]
        else:
            name = f"col_{idx+1}"

        print(f"Procesando columna {idx+1}: {name}...")
        
        # Construir código LaTeX para esta columna
        tex_source = f"{preamble}\n\\begin{{document}}\n{col_content}\n\\end{{document}}\n"
        
        tex_file = f"{name}.tex"
        dvi_file = f"{name}.dvi"
        svg_file = f"{name}.svg"
        
        with open(tex_file, "w", encoding="utf-8") as out:
            out.write(tex_source)

        # Compilar a DVI con latex (tolerando advertencias/errores menores si se genera el DVI)
        print(f"  Compilando {tex_file} con latex...")
        subprocess.run(
            ["latex", "-interaction=nonstopmode", tex_file],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

        if not os.path.exists(dvi_file):
            print(f"  Error: No se pudo generar el archivo DVI {dvi_file} debido a errores de LaTeX.")
            continue

        # Convertir DVI a SVG con dvisvgm (usando el motor nativo de DVI para vectorizar todos los símbolos)
        print(f"  Convertiendo {dvi_file} a SVG usando dvisvgm...")
        subprocess.run(
            ["dvisvgm", "--no-fonts", dvi_file],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

        if not os.path.exists(svg_file):
            print(f"  Error: No se pudo convertir {dvi_file} a SVG.")
            continue

        # Limpiar archivos temporales
        print(f"  Limpiando archivos temporales para {name}...")
        for ext in [".tex", ".aux", ".log", ".dvi"]:
            tmp_file = f"{name}{ext}"
            if os.path.exists(tmp_file):
                os.remove(tmp_file)

    print("\n¡Proceso finalizado con éxito! Archivos SVG generados:")
    for name in column_names[:len(columns)]:
        target_svg = f"{name}.svg"
        if os.path.exists(target_svg):
            print(f" - {target_svg}")

if __name__ == "__main__":
    main()
