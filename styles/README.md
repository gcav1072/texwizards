# Mathwizards Consultoría Educativa STEM — Estilos LaTeX

Sistema de estilos con la identidad de marca: paleta del logo, tipografía
**Nexa** (títulos) + **Cabin** (cuerpo) y matemáticas en la fuente por defecto
(Latin Modern / Computer Modern).

## Compilación

Todos los estilos requieren **XeLaTeX**:

```bash
latexmk -xelatex guia.tex
```

### Cómo se resuelven los estilos (por orden de robustez)

1. **VS Code / LaTeX Workshop (Ctrl+S).** El repo incluye `.vscode/settings.json`
   que expone `styles/` vía `TEXINPUTS` usando el placeholder `%WORKSPACE_FOLDER%`.
   Es **portable**: cualquier PC que clone el repo compila sin configurar nada.
   (Necesario porque LaTeX Workshop compila desde la carpeta del `.tex` y `latexmk`
   solo lee `.latexmkrc` del cwd o de `$HOME`, nunca de carpetas padre.)
2. **CLI desde la raíz del repo.** El `.latexmkrc` de la raíz agrega `styles/`
   a `TEXINPUTS`.
3. **CLI desde cualquier directorio.** Instala los estilos en `TEXMFHOME`
   (idempotente y auto-reparable ante mudanzas del repo):

   ```bash
   ./setup_texmf.sh
   ```

   Esto enlaza `styles/*.sty` en `~/texmf/tex/latex/mathwizards/`.

### Fuentes necesarias (instaladas en el sistema)

- **Cabin** (OTF) — viene con TeX Live (`/usr/share/fonts/opentype/cabin/`)
- **Nexa Heavy** y **Nexa Extra Light** (TTF) — instaladas en `~/.local/share/fonts/`
  desde `assets/fonts/` (versiones gratuitas de Fontfabric)

## Herramientas del repo

| Herramienta | Qué hace |
|---|---|
| `compile_all.sh` | Recompila todos los `.tex` de `tex_files/` (o un filtro de ruta) |
| `generate_scr.py` | Genera versiones **sin respuestas** (`_scr`) de las guías |
| `setup_texmf.sh` | Enlaza los estilos en `~/texmf` para compilar desde cualquier carpeta |
| `.latexmkrc` | Agrega `styles/` a `TEXINPUTS` al compilar desde la raíz |
| `.vscode/settings.json` | Tool `xelatexmk` con `TEXINPUTS` portable (`%WORKSPACE_FOLDER%`) |

### `compile_all.sh`

```bash
./compile_all.sh                 # Todo tex_files/ (normal + _scr)
./compile_all.sh curso_3eraño    # Solo lo que coincida con esa ruta
./compile_all.sh guia1           # guía1...tex y su variante guia1..._scr.tex
./compile_all.sh -f -j 4         # Forzado (latexmk -g) y con 4 hilos
./compile_all.sh -c              # Limpia auxiliares tras compilar
```

Cada guía que use `\ifmwclaves` se compila **dos veces desde el mismo fuente**
(ver más abajo): la versión normal con respuestas y la variante `_scr` sin ellas.
Los documentos sin `\ifmwclaves` (exámenes, formularios, carruseles) se compilan una sola vez.

### `generate_scr.py`

```bash
python3 generate_scr.py --inplace-wrap          # Recomendado: envuelve las claves in-place
python3 generate_scr.py --inplace-wrap --dry-run # Ver qué haría, sin escribir
python3 generate_scr.py --filter curso_1eraño   # Limitar a una subcarpeta
```

Modos: por defecto trunca la sección de respuestas; `--wrap` envuelve en `\ifmwclaves`
y añade `\mwclavesoff` (legacy); `--inplace-wrap` envuelve **dentro del original** sin
alterar el paginado (idempotente).

## Estructura

```
styles/          Estilos .sty + este README
assets/img/      Logos (l.png, l_hires.png, l_white.png)
assets/fonts/    Cabin y Nexa (TTF/OTF)
tex_files/       Documentos .tex agrupados por curso/tema
rrss_info/       Planificación de redes sociales
compile_all.sh · generate_scr.py · setup_texmf.sh
```

## Archivos

| Archivo | Uso | Carpeta típica |
|---|---|---|
| `mathwizards-palette.sty` | Solo la paleta de colores (con aliases de compatibilidad) | — |
| `mathwizards-guia.sty` | Guías de estudio, exámenes (artículo Letter) | `curso_1eraño` … `curso_4toaño`, `curso_preuni`, `Integrales`, `T_y_C`, `lead_magnets` |
| `mathwizards-beamer.sty` | Presentaciones (Beamer 16:9) | `curso_preuni_beamers`, `minicurso_derivadas` |
| `mathwizards-carrusel.sty` | Carruseles Instagram 1:1 (1080×1080) | `carruseles` |
| `mathwizards-formulario.sty` | Formularios de referencia (landscape compacto) | `Formularios` |
| `mathwizards-ingles.sty` | Curso de inglés (cajas tcolorbox con título) | `cursoinglés` |

## Paleta

| Nombre | Valor | Rol |
|---|---|---|
| `mwprimario` | `#E2232D` | Títulos, teoría, definiciones, encabezados |
| `mwmagenta` | `#E3229F` | Soluciones, ejemplos resueltos |
| `mwnaranja` | `#E36322` | Pasos, procedimientos |
| `mwrojonaranja` | `#E34122` | Advertencias, errores clásicos |
| `mwvioleta` | `#C922E3` | Notas, curiosidades, desafíos |
| `mwgrisoscuro` | `RGB(51,51,51)` | Textos de énfasis oscuro |
| `mwgris` | `RGB(102,102,102)` | Textos secundarios, pies de página |
| `mwgrisclaro` | `#F5F5F8` | Fondos de notas / info |

Aliases de compatibilidad (nombres antiguos): `azulprincipal`, `azulclaro`,
`verdeprincipal`, `verdeclaro`, `naranjaprincipal`, `naranjaclaro`, `grisclaro`,
`rojoprincipal`, `moradoprincipal`, `moradoclaro`.

> `mathwizards-carrusel.sty` define además `mwverde` (`#2E9E4F`) con alcance local,
> solo para las marcas ✓/✗ de los carruseles.

## mathwizards-guia.sty

Guías de estudio y exámenes en hoja **Letter** (216 × 279 mm), con encabezado
que incluye el logo, numeración y pie de página institucional.

```latex
\documentclass[12pt, letterpaper]{article}
\usepackage{mathwizards-guia}
\mwguia{Guía 1 — Aritmética con Naturales y Decimales}{Ing. Gabriel Astudillo $\cdot$ Curso 1er Año}
\begin{document}
\mwportada{Guía de Estudio 1}{Aritmética con Naturales y Decimales}{Lema opcional}
...
\end{document}
```

| Comando | Efecto |
|---|---|
| `\mwguia{encabezado}{autor $\cdot$ curso}` | Encabezado de página: el texto de la izquierda y el autor/curso de la derecha |
| `\mwportada{título}{subtítulo}{lema}` | Portada con logo `l_hires.png` |
| `\ejercicio` | Numerador de ejercicios con contador propio (`1.`, `2.`, …) |

### Cuadros (`mdframed`)

| Entorno | Color | Uso |
|---|---|---|
| `cuadroteoria` | rojo | Definiciones, leyes, fórmulas |
| `cuadroteorianobg` | rojo (sin fondo) | Igual, pero sobre fondo blanco |
| `cuadrosolucion` | magenta | Ejemplos resueltos, soluciones |
| `cuadropasos` | naranja | Procedimientos paso a paso |
| `cuadroadvertencia` | rojo-naranja | Errores clásicos, «ojo con esto» |
| `cuadroextra` | violeta | Notas, curiosidades, desafíos |
| `cuadroinfo` | gris | Presentación, información general |

Aliases de los nombres antiguos: `cuadroazul`, `cuadroverde`, `cuadronaranja`,
`cuadromorado`, `cuadrogris`.

### Claves de respuestas (versiones `_scr`)

El estilo define un interruptor para compilar la misma guía con o sin la sección
de respuestas:

```latex
\ifmwclaves
\section{Clave de Respuestas}
...
\fi
```

| Comando | Efecto |
|---|---|
| `\mwclaveson` / `\mwclavesoff` | Muestra / oculta la sección de claves |
| `\mwclavesestado` | Imprime «con respuestas» o «sin respuestas» |
| `\ifmwclaves` … `\fi` | Envuelve el bloque de respuestas en el `.tex` |

`compile_all.sh` genera la variante sin respuestas con
`-usepretex='\AtBeginDocument{\mwclavesoff}'` y `-jobname=<stem>_scr`,
así que **no existe un `.tex` aparte**: solo el PDF `_scr`.

### Estrellas de dificultad

`\facil` (★), `\medio` (★★), `\dificil` (★★★), `\muyDificil` (★★★★).
Se usan tanto en guías como en beamer.

Fuentes auxiliares: `\nxheav` (Nexa Heavy) y `\nxlight` (Nexa Extra Light).

## mathwizards-ingles.sty

Curso de inglés. Todas las cajas son **tcolorbox** con título opcional y muchas
son `breakable` (se parten entre páginas). Geometría `margin=2.5cm`.

| Caja | Nota |
|---|---|
| `cajachunk`, `cajagrammar`, `cajamineria`, `cajatransicion`, `cajabueno`, `cajamalo`, `cajaprincipio`, `cajafilosofia`, `cajaherramienta` | Cajas grandes con título |
| `cajaconsolidacion`, `cajaejemplo`, `cajatarjeta`, `cajanota`, `cajapaso`, `cajaalerta`, `cajaexito` | Cajas medianas |
| `cajacodigo` | Monoespaciada, sin título |
| `cajanivel[mwmagenta]` | El **color es el argumento opcional** (por defecto `mwprimario`) |
| `cajames{título}{color}`, `cajasemana{título}{color}`, `cajaseccion{título}{color}`, `cajasesion{título}{color}` | Título + color por argumento |

Cajas base reutilizables: `cajagrande{título}{color}` y `cajamediana{título}{color}`.

Comandos de apoyo:

| Comando | Efecto |
|---|---|
| `\eng{texto}` | Inglés destacado (negrita itálica en rojo) |
| `\esp{texto}` | Traducción / aclaración en gris y pequeño entre paréntesis |
| `\sesion{n}{título}{descripción}` | Encabezado de sesión con casilla `□` |

Los colores antiguos (`mes1`, `mes2`, `mes3`, `chunk`, `grammar`, `ejemplo`,
`mineria`, `transicion`, `consolidacion`, `bueno`, `malo`, `acento`, `grissuave`,
`fondo`, `herramienta`, `paso`, `alerta`, `exito`, `codefondo`) apuntan a la paleta.

## mathwizards-formulario.sty

Formularios de referencia en **landscape compacto** (`9pt`). El documento debe
declarar su propio `\documentclass`:

```latex
\documentclass[9pt, landscape, letterpaper]{extarticle}
\usepackage{mathwizards-formulario}
\mwformulario{Formulario de Electromagnetismo}{Ing. Gabriel Astudillo $\cdot$ Física II}
\begin{document}
\nuevotema{Fundamentos y Herramientas Matemáticas}
...
\end{document}
```

| Elemento | Uso |
|---|---|
| `\mwformulario{título}{subtítulo $\cdot$ autor}` | Datos del encabezado |
| `\nuevotema{título}` | Nueva página con banner rojo de tema |
| `formulabox{título}` | Fórmulas principales (rojo) |
| `despejesbox{título}` | Despejes y fórmulas derivadas (naranja) |
| `tablabox{título}` | Tablas de referencia (gris, contenido centrado) |
| `notabox{título}` | Notas, principios y tips (magenta) |
| `\tablacompacta` | Compacta el espaciado de una tabla |
| `C{ancho}` / `L{ancho}` | Tipos de columna centrada / izquierda con ancho fijo |

También define espaciado global compacto (párrafos, listas, columnas y ecuaciones).

Comandos legacy v1: `\cajatitulo{título}` (banner rojo) y `\cajainfo{texto}`
(caja informativa clara). Aliases de color: `primary`, `primarylight`,
`secondary`, `darkbg`, `resultcolor`, `divcolor`.

## mathwizards-beamer.sty

Tema de presentaciones **16:9** basado en el tema `default` con inner theme
`rounded` y sin símbolos de navegación. La portada es roja con el logo blanco
(`l_white.png`) y el pie muestra institución · clase · `n/N`.

```latex
\documentclass[aspectratio=169]{beamer}
\usepackage{mathwizards-beamer}
\mwbeamer{Clase 4}{Funciones Racionales, Composición e Inversas}{Semana 2}

\begin{document}
\begin{frame}[plain]
  \titlepage
\end{frame}
...
\end{document}
```

`\mwbeamer{título}{subtítulo}{semana}` fija título, subtítulo, autor
(Ing. Gabriel Astudillo), instituto, fecha y los textos del pie.

### Bloques

| Entorno | Color |
|---|---|
| `mwejercicio[título]` | Gris oscuro (enunciados) |
| `mwextra[título]` | Violeta (notas) |
| `mwpasos[título]` | Naranja (procedimientos) |
| `block` / `exampleblock` / `alertblock` | Rojo / magenta / rojo-naranja |

Cada `\section` inserta automáticamente un frame separador a pantalla completa.

### Anclaje superior de ejercicios

El cuerpo del frame se **ancla arriba** cuando contiene un `mwejercicio`, de modo
que el espacio en blanco quede **debajo** del enunciado y sirva para resolver a
mano sobre el PDF (OpenBoard, Xournal++, etc.). **No hace falta ningún `\vspace`
manual.** Si bajo el enunciado va una solución en el mismo frame, inserta
`\mwtopanchoroff` antes del bloque y `\mwtopanchoron` después.

| Comando | Efecto |
|---|---|
| `\mwtopanchoroff` / `\mwtopanchoron` | Desactiva / reactiva el anclaje superior |
| `\setlength{\mwtopejercicio}{0.2cm}` | Separación extra entre el título del frame y el enunciado (0pt por defecto) |
| `\mwtopanchor` | Inserta el anclaje manualmente |

### Personalización del pie

`\mwfootleft`, `\mwfootcenter`, `\mwfootright` son redefinibles para cambiar los
textos del pie (izquierda, centro y derecha — este último lleva `n/N`).

Fuente auxiliar: `\nxheav` (Nexa Heavy).

## mathwizards-carrusel.sty

Carruseles de Instagram en formato **1:1 (1080 × 1080 px)**. Cada página es una
lámina cuadrada de 10.8 × 10.8 cm: **una lámina = una página**.

```latex
\documentclass[12pt]{article}
\usepackage{mathwizards-carrusel}
\mwcartotal{9}                 % total de láminas (para el indicador n/N)
\begin{document}
\mwcarportada{Kit de arranque}{Semana 0: Cositas qué recordar}{@mathwizards.ve}

\begin{mwcarlamina}{Álgebra: 3 errores que reprueban}
  ...contenido...
\end{mwcarlamina}

\mwcarfin{Mensaje de cierre}{Síguenos para más}
\end{document}
```

| Comando / entorno | Uso |
|---|---|
| `\mwcartotal{N}` | Fija el total de láminas del indicador `n/N` |
| `\mwcarportada{título}{subtítulo}{lema}` | Lámina de portada (fondo oscuro, logo blanco) |
| `\begin{mwcarlamina}{título}` … `\end{mwcarlamina}` | Lámina de contenido (fondo claro, cabecera con barra roja) |
| `\mwcarfin{mensaje}{CTA}` | Lámina de cierre con llamada a la acción |
| `\mwcarhandle` | Handle mostrado en el pie (por defecto `@mathwizards.ve`) |
| `\mwcarconttop` | Espacio tras el título antes del contenido (por defecto `1.8cm`) |

Cajas de contenido (`mdframed`): `cajateoria` (rojo), `cajaerror` (rojo-naranja),
`cajaok` (verde), `cajapasos` (naranja) y `cajaformula` (gris).

Marcas: `\bien` (✓ verde) y `\mal` (✗ rojo-naranja).

