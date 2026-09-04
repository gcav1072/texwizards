# Plan — Minicurso de Derivadas (Cálculo I · Nivel Universitario)

**Audiencia:** estudiantes de Cálculo I universitario (nivel Mates II / Ruben Valderrama).
**Duración:** 6 clases de 2 horas (12 h, ~2 semanas).
**Formato:** 6 guías PDF LaTeX (teoría + ejemplos + ejercicios con clave) + 6 presentaciones beamer.
**Dificultad:** desafiante desde el inicio — ★★ medio → ★★★ difícil → ★★★★ muy difícil (sin ★ fácil).
**Fuente de ejercicios:** `ejercicios_base.md` (reorganizado por temas 1–10).

---

## Visión general por clases

| Clase | Tema | ★★ | ★★★ | ★★★★ | Total |
|:-----:|------|:--:|:---:|:----:|:-----:|
| 1 | Derivación: reglas + definición | 7 | 10 | 8 | 25 |
| 2 | Derivación implícita + orden superior | 7 | 10 | 8 | 25 |
| 3 | Recta tangente y normal | 7 | 10 | 8 | 25 |
| 4 | Derivadas paramétricas | 7 | 10 | 8 | 25 |
| 5 | L'Hôpital + derivabilidad | 7 | 10 | 8 | 25 |
| 6 | Estudio completo de curvas | 6 | 10 | 9 | 25 |
| | **Total** | **41** | **60** | **49** | **150** |

> Cada beamer presenta **10 ejercicios** de su guía correspondiente (o variantes directas), no se cuentan aparte.

---

## Planificación por clase

### Clase 1 — El arte de derivar: reglas y definición
- **Objetivo:** dominar el cálculo de derivadas mediante reglas de derivación y la definición por límite.
- **Contenido:** definición de derivada como límite; reglas de potencia, producto, cociente y cadena (funciones compuestas anidadas); notación de Leibniz vs. prima.
- **Actividad:** 3–4 ejemplos resueltos (uno por definición, dos por reglas combinadas, uno con función «enmarañada» tipo Examen 2 Prob. 1); 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (7): derivación directa de funciones compuestas (cadena simple, producto, cociente).
  - ★★★ (10): productos trigonométricos con argumentos compuestos (Ex. 2c / Ex. 6b); derivada por definición con raíz (Ex. 3A Prob. 1).
  - ★★★★ (8): funciones muy enmarañadas (Ex. 2b / Ex. 6a); derivada por definición de racional (Ex. 1 Inciso I).

### Clase 2 — Derivación implícita y derivadas de orden superior
- **Objetivo:** derivar funciones definidas implícitamente y calcular derivadas sucesivas.
- **Contenido:** diferenciación implícita (tratamiento de $y$ como función de $x$); derivadas sucesivas; notación $y'$, $y''$, $y'''$, $f^{(n)}$.
- **Actividad:** 3 ejemplos resueltos; 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (7): implícita polinómica de 1–2 pasos; segundas derivadas sencillas.
  - ★★★ (10): implícita con trigonométricas; tercera derivada de producto trigonométrico (Ex. 5 Prob. 6).
  - ★★★★ (8): implícita extensa (Ex. 5 Prob. 2); tercera derivada de $\cot^4(2x^2)$ (Ex. 2 Prob. 2).

### Clase 3 — Recta tangente y normal
- **Objetivo:** aplicar la derivada a la interpretación geométrica de curvas.
- **Contenido:** interpretación geométrica de la derivada; ecuación punto-pendiente; pendiente de la normal como negativo recíproco; tangentes a curvas implícitas.
- **Actividad:** 3 ejemplos resueltos; 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (7): tangente a funciones explícitas y curvas implícitas sencillas.
  - ★★★ (10): tangente con trigonométricas (Ex. 4 Prob. 3 / Ex. 7A Prob. 2).
  - ★★★★ (8): tangente en punto con $\pi$ (Ex. 3A Prob. 4 / Ex. 8B Prob. 2); tangente con raíz (Ex. 3 Prob. 1).

### Clase 4 — Derivadas paramétricas
- **Objetivo:** calcular $\frac{dy}{dx}$ y $\frac{d^2y}{dx^2}$ a partir de ecuaciones paramétricas.
- **Contenido:** derivada de $y$ respecto a $x$ vía $\frac{dy/dt}{dx/dt}$; segunda derivada paramétrica $\frac{d^2y}{dx^2} = \frac{d(dy/dx)/dt}{dx/dt}$; demostraciones con identidades trigonométricas.
- **Actividad:** 3 ejemplos resueltos; 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (7): hallar $\frac{dy}{dx}$ (Ex. 6 Prob. 4); paramétricas polinómicas.
  - ★★★ (10): demostraciones de $\frac{d^2y}{dx^2}$ (Ex. 3A Prob. 2 / Ex. 7A Prob. 1).
  - ★★★★ (8): demostraciones con identidades complejas (Ex. 8B Prob. 1 / Ex. 1 Inciso III).

### Clase 5 — L'Hôpital y derivabilidad
- **Objetivo:** resolver límites indeterminados y analizar continuidad/derivabilidad.
- **Contenido:** formas indeterminadas $0/0$, $\infty/\infty$; regla de L'Hôpital (enunciado y condiciones); aplicaciones repetidas; continuidad vs. derivabilidad; derivadas laterales; funciones diferenciables a trozos.
- **Actividad:** 3–4 ejemplos resueltos; 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (7): L'Hôpital directo $0/0$; análisis de continuidad.
  - ★★★ (10): L'Hôpital con manipulación previa o repetición (Ex. 4 Prob. 2 / Ex. 7A Prob. 3); derivabilidad a trozos (Ex. 3A Prob. 5).
  - ★★★★ (8): L'Hôpital con demostración de valor exacto (Ex. 6 Prob. 3 / Ex. 8B Prob. 3); hallar constantes para diferenciabilidad (Ex. 5 Prob. 5).

### Clase 6 — Estudio completo de curvas
- **Objetivo:** realizar el análisis completo de una función y trazar su gráfica.
- **Contenido:** dominio y rango; cortes con ejes; simetría (par/impar); asíntotas verticales, horizontales y oblicuas; intervalos de crecimiento/decrecimiento (1ra derivada); máximos y mínimos; concavidad y puntos de inflexión (2da derivada); trazado de gráfica.
- **Actividad:** 2–3 ejemplos resueltos; 25 ejercicios propuestos.
- **Ejercicios propuestos (25):**
  - ★★ (6): dominio, cortes, simetría, asíntotas de funciones dadas.
  - ★★★ (10): monotonía y extremos (Ex. 6 Prob. 5); concavidad e inflexión (Ex. 6 Prob. 6).
  - ★★★★ (9): estudio completo con gráfica y rango (Ex. 3 Prob. 4 / Ex. 7A Prob. 4 / Ex. 8B Prob. 4).

---

## Estructura de cada guía PDF

```
\documentclass[12pt, letterpaper]{article}
\usepackage{mathwizards-guia}
\mwguia{Clase N — Título}{Ing. Gabriel Astudillo $\cdot$ Minicurso Derivadas}

\mwportada{Clase N}{Título del tema}{Lema motivador}

\begin{cuadroinfo}  ← presentación + leyenda de dificultad (★★ medio, ★★★ difícil, ★★★★ muy difícil)

\section{Marco Teórico}
  \subsection{Concepto 1} → texto + \begin{cuadroteoria} definición/fórmula \end{cuadroteoria}
  \subsection{Concepto 2} → \begin{cuadropasos} procedimiento \end{cuadropasos} + \begin{cuadroadvertencia} errores comunes \end{cuadroadvertencia}

\section{Ejemplos Resueltos}
  \begin{cuadrosolucion} → ejemplo paso a paso (\textbf{Ejemplo resuelto N})

\section{Ejercicios Propuestos}
  \begin{enumerate}[leftmargin=*]
    \item \medio{} ... (★★)   %% 7
    \item \dificil{} ... (★★★) %% 10
    \item \muyDificil{} ... (★★★★) %% 8
  \end{enumerate}
  25 ejercicios, numeración continua 1–25

\ifmwclaves
  \section{Clave de Respuestas}
  \begin{enumerate}[leftmargin=*, label=\textbf{\arabic*.}]
    %% respuestas cortas 1–25, con \setcounter{enumi} si se divide en secciones
  \end{enumerate}
\fi
```

## Estructura de cada beamer

```
\documentclass[aspectratio=169]{beamer}
\usepackage{mathwizards-beamer}
\mwbeamer{Clase N}{Título}{Minicurso Derivadas}

\begin{frame}[plain]\titlepage\end{frame}
\section{Marco Teórico} → 2–3 frames (bloques \begin{block}, alertblock)
\section{Ejercicios de Clase} → 10 frames "Ejercicio N"
  \begin{frame}{Ejercicio N}
    \begin{mwejercicio}[Ejercicio N — ... \quad \medio/\dificil/\muyDificil]
      enunciado
    \end{mwejercicio}
  \end{frame}
  Dificultad: E1–3 \medio, E4–7 \dificil, E8–10 \muyDificil
```

---

## Convenciones a respetar

- **Motor:** XeLaTeX (`latexmk -xelatex`).
- **Estilos:** `mathwizards-guia` (guías), `mathwizards-beamer` (presentaciones).
- **Notación trigonométrica:** `\operatorname{sen}`, `\operatorname{tg}` (notación venezolana original).
- **Coma decimal:** `{,}` en matemáticas.
- **Dificultad:** `\medio` (★★), `\dificil` (★★★), `\muyDificil` (★★★★) — NO usar `\facil`.
- **Cajas:** `cuadroinfo` (presentación), `cuadroteoria` (definiciones), `cuadropasos` (procedimientos), `cuadrosolucion` (ejemplos), `cuadroadvertencia` (errores), `cuadroextra` (notas/desafíos).
- **Guías:** `\mwportada` + `cuadroinfo` + secciones + `\section{Clave de Respuestas}` con `\ifmwclaves`.
- **Beamer:** 10 ejercicios por clase, frames «Ejercicio N», bloque `mwejercicio[dificultad]`.

---

## Archivos

### Guías PDF (6)
- `guia1_derivacion_reglas_definicion.tex`
- `guia2_implicita_orden_superior.tex`
- `guia3_recta_tangente_normal.tex`
- `guia4_parametricas.tex`
- `guia5_lhopital_derivabilidad.tex`
- `guia6_estudio_curvas.tex`

### Presentaciones beamer (6)
- `beamer1_derivacion_reglas_definicion.tex`
- `beamer2_implicita_orden_superior.tex`
- `beamer3_recta_tangente_normal.tex`
- `beamer4_parametricas.tex`
- `beamer5_lhopital_derivabilidad.tex`
- `beamer6_estudio_curvas.tex`

---

## Verificación

1. Todo compila con `latexmk -xelatex` sin errores.
2. Cada guía: **25 propuestos + 25 claves** (total 150).
3. Cada beamer: exactamente 10 frames «Ejercicio N».
4. Dificultad en guías: sin `\facil`, solo `\medio`/`\dificil`/`\muyDificil`.
5. Dificultad en beamers: E1–3 `\medio`, E4–7 `\dificil`, E8–10 `\muyDificil`.
6. Cobertura de los temas 1–10 de `ejercicios_base.md`.
