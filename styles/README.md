# Mathwizards Consultoría Educativa STEM — Estilos LaTeX

Sistema de estilos con la identidad de marca: paleta del logo, tipografía
**Nexa** (títulos) + **Cabin** (cuerpo) y matemáticas en la fuente por defecto
(Latin Modern / Computer Modern).

## Compilación

Todos los estilos requieren **XeLaTeX**:

```bash
latexmk -xelatex guia.tex
```

El archivo `.latexmkrc` de la raíz ya configura el motor y agrega `styles/`
a `TEXINPUTS`. Los estilos también están enlazados en `~/texmf/tex/latex/mathwizards/`.

### Fuentes necesarias (instaladas en el sistema)

- **Cabin** (OTF) — viene con TeX Live (`/usr/share/fonts/opentype/cabin/`)
- **Nexa Heavy** y **Nexa Extra Light** (TTF) — instaladas en `~/.local/share/fonts/`
  desde `assets/fonts/` (versiones gratuitas de Fontfabric)

## Archivos

| Archivo | Uso |
|---|---|
| `mathwizards-palette.sty` | Solo la paleta de colores (con aliases de compatibilidad) |
| `mathwizards-guia.sty` | Guías de matemáticas / exámenes |
| `mathwizards-ingles.sty` | Curso de inglés (cajas tcolorbox con título) |
| `mathwizards-formulario.sty` | Formularios compactos (landscape) |

## Paleta

| Nombre | Hex | Rol |
|---|---|---|
| `mwprimario` | `#E2232D` | Títulos, teoría, definiciones, encabezados |
| `mwmagenta` | `#E3229F` | Soluciones, ejemplos resueltos |
| `mwnaranja` | `#E36322` | Pasos, procedimientos |
| `mwrojonaranja` | `#E34122` | Advertencias, errores clásicos |
| `mwvioleta` | `#C922E3` | Notas, curiosidades, desafíos |
| `mwgris` / `mwgrisclaro` | — | Textos secundarios, info |

## mathwizards-guia.sty — uso rápido

```latex
\documentclass[12pt, a4paper]{article}
\usepackage{mathwizards-guia}
\mwguia{Guía 1 — Título corto}{Autor $\cdot$ Curso}
\begin{document}
\mwportada{Título grande}{Subtítulo}{Lema}
...
\end{document}
```

Cuadros: `cuadroteoria`, `cuadrosolucion`, `cuadropasos`, `cuadroadvertencia`,
`cuadroextra`, `cuadroinfo`. Los nombres antiguos (`cuadroazul`, `cuadroverde`,
`cuadronaranja`, `cuadromorado`, `cuadrogris`) siguen funcionando como aliases.
Estrellas de dificultad: `\facil`, `\medio`, `\dificil` (en paleta).

## mathwizards-ingles.sty

Define las cajas del curso (`cajachunk`, `cajagrammar`, `cajaejemplo`,
`cajamineria`, `cajanivel`, `cajatransicion`, `cajaconsolidacion`, `cajabueno`,
`cajamalo`, `cajaprincipio`, `cajatarjeta`, `cajafilosofia`, `cajames`,
`cajanota`, `cajaherramienta`, `cajapaso`, `cajaalerta`, `cajaexito`,
`cajacodigo`, `cajasesion`, `cajasemana`, `cajaseccion`) y los comandos
`\eng`, `\esp`, `\sesion`. Los colores viejos (`mes1`, `mes2`, `mes3`, `chunk`,
`grammar`, etc.) apuntan a la paleta.

## mathwizards-formulario.sty

Define `\cajatitulo`, `\cajainfo`, secciones estilo formulario y los aliases
`primary`, `primarylight`, `secondary`, `darkbg`, `resultcolor`, `divcolor`.
El documento debe declarar su propio `\documentclass` (p. ej.
`[9pt,landscape,a4paper]`).
