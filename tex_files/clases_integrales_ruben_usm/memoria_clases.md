# Cálculo Integral — Memoria de clase

> Reconstrucción a partir de los apuntes del cuaderno + una pizarra.
> El cuerpo sigue el procedimiento tal como está escrito (interpretando la
> letra cuando es ambigua); las dudas, tachaduras y posibles errores se listan
> al final en **[Observaciones](#observaciones-y-puntos-a-verificar)**.
> Orden por tema (no necesariamente cronológico del cuaderno).

## Índice
- [0. Teoría y herramientas de apoyo](#0-teoría-y-herramientas-de-apoyo)
  - [0.1 Triángulo de Pascal](#01-triángulo-de-pascal)
  - [0.2 Propiedades de exponentes (pizarra)](#02-propiedades-de-exponentes-pizarra)
  - [0.3 Integrales trigonométricas — teoremas](#03-integrales-trigonométricas--teoremas)
- [1. Ejercicio 1 — Sustitución + Pascal](#1-ejercicio-1--sustitución--pascal)
- [2. Ejercicio 2 — Radicales anidados](#2-ejercicio-2--radicales-anidados)
- [3. Método (continuación) — División de polinomios](#3-método-continuación--división-de-polinomios)
- [4. Ejemplo de pizarra — Exponentes fraccionarios](#4-ejemplo-de-pizarra--exponentes-fraccionarios)
- [Observaciones y puntos a verificar](#observaciones-y-puntos-a-verificar)

---

## 0. Teoría y herramientas de apoyo

### 0.1 Triángulo de Pascal
Filas $n=0$ a $n=7$; se resalta la fila $n=6$ (la que se usa en el **Ejercicio 1**):

$$
\begin{array}{ccccccc}
&&&&&1&\\
&&&&1&&1\\
&&&1&&2&&1\\
&&1&&3&&3&&1\\
&1&&4&&6&&4&&1\\
1&&5&&10&&10&&5&&1\\
\boxed{1\quad 6\quad 15\quad 20\quad 15\quad 6\quad 1}\\
1&&7&&21&&35&&35&&21&&7&&1
\end{array}
$$

> *Nota al margen (cuaderno):* «Los signos se intercalan $\pm$; a veces, si todo
> es $(+)$, el resultado sale todo $(+)$.» → sirve para expandir $(a-b)^n$.

### 0.2 Propiedades de exponentes (pizarra)
Columna de reglas escritas a la izquierda de la pizarra (se usan en la §4):

$$
\left(\frac{a}{b}\right)^{-n}=\left(\frac{b}{a}\right)^{n}
\qquad
\frac{1}{a^{n}}=a^{-n}
\qquad
a^{-n}=\frac{1}{a^{n}}
\qquad
\frac{a\pm b\pm c\pm d}{n}=\frac{a}{n}\pm\frac{b}{n}\pm\frac{c}{n}\pm\frac{d}{n}
$$

### 0.3 Integrales trigonométricas — teoremas
Lista dictada en clase (rotulada `m1 … m6` en el cuaderno); $a$ constante $\neq 0$:

| # | Fórmula |
|---|---------|
| m1 | $\displaystyle\int \sin(ax)\,dx=-\frac{\cos(ax)}{a}+C$ |
| m2 | $\displaystyle\int \cos(ax)\,dx=\frac{\operatorname{sen}(ax)}{a}+C$ |
| m3 | $\displaystyle\int \sec^{2}(ax)\,dx=\frac{\tan(ax)}{a}+C$ |
| m4 | $\displaystyle\int \csc^{2}(ax)\,dx=-\frac{\cot(ax)}{a}+C$ |
| m5 | $\displaystyle\int \sec(ax)\tan(ax)\,dx=\frac{\sec(ax)}{a}+C$ |
| m6 | $\displaystyle\int \csc(ax)\cot(ax)\,dx=-\frac{\csc(ax)}{a}+C$ |

*(Estas fórmulas no se aplican en los ejercicios §1–§3; quedan como repertorio
para prácticas posteriores.)*

---

## 1. Ejercicio 1 — Sustitución + Pascal
> Enunciado del cuaderno («Resuelvan las siguientes integrales», 1):
> $\displaystyle\int \sqrt{(x^{2}+2)^{3}}\;\cdot\;x^{12}\,dx$

**Paso 1 — reescribir la raíz como potencia** y **sustitución**:

$$
u=x^{2}+2 \;\Rightarrow\; du=2x\,dx \;\Rightarrow\; dx=\frac{du}{2x}
$$
$$
u-2=x^{2}\;\Rightarrow\; x^{12}=(x^{2})^{6}=(u-2)^{6}
$$

**Paso 2 — montar la integral en $u$** (el factor $x$ del $dx$ se absorbe con
$x^{12}\to x^{11}\cdot x$; ver *Obs.* 1.1):

$$
\int u^{3/2}\,x^{12}\,\frac{du}{2x}=\frac{1}{2}\int u^{3/2}(u-2)^{6}\,du
$$

**Paso 3 — expandir $(u-2)^{6}$ con Pascal** (fila $n=6$, signos alternados):

$$
(u-2)^{6}=u^{6}-12u^{5}+60u^{4}-160u^{3}+240u^{2}-192u+64
$$

**Paso 4 — distribuir $u^{3/2}$** término a término:

$$
\frac{1}{2}\int\!\Big(u^{15/2}-12u^{13/2}+60u^{11/2}-160u^{9/2}+240u^{7/2}-192u^{5/2}+64u^{3/2}\Big)\,du
$$

> *Nota al margen (cuaderno):* «Se integra, se derriba $u$ y se le suma $1$ a
> cada exponente.»

**Paso 5 — integrar** (regla $\int u^{k}du=\frac{u^{k+1}}{k+1}$):

$$
=\frac{1}{2}\Big(u^{17/2}\tfrac{2}{17}-12u^{15/2}\tfrac{2}{15}+60u^{13/2}\tfrac{2}{13}-160u^{11/2}\tfrac{2}{11}+240u^{9/2}\tfrac{2}{9}-192u^{7/2}\tfrac{2}{7}+64u^{5/2}\tfrac{2}{5}\Big)+C
$$

**Paso 6 — regresar a $x$** ($u=x^{2}+2$; exponente fraccionario $\to$ raíz):

$$
=\frac{1}{2}\Bigg[\frac{2}{17}\sqrt{(x^{2}+2)^{17}}-\frac{24}{15}\sqrt{(x^{2}+2)^{15}}+\frac{120}{13}\sqrt{(x^{2}+2)^{13}}-\frac{320}{11}\sqrt{(x^{2}+2)^{11}}+\frac{480}{9}\sqrt{(x^{2}+2)^{9}}-\frac{384}{7}\sqrt{(x^{2}+2)^{7}}+\frac{128}{5}\sqrt{(x^{2}+2)^{5}}\Bigg]+C
$$

---

## 2. Ejercicio 2 — Radicales anidados
> Cuaderno, 2: $\displaystyle\int \sqrt{\,2-\sqrt{1+\sqrt{x}\,}\;}\;dx$

**Paso 1 — sustitución exterior** $u=2-\sqrt{1+\sqrt{x}}$:

$$
du=-\tfrac{1}{2}(1+x^{1/2})^{-1/2}\cdot\tfrac{1}{2}x^{-1/2}\,dx=-\frac{dx}{4\sqrt{1+\sqrt{x}}\,\sqrt{x}}
\;\Rightarrow\;
dx=-4\sqrt{1+\sqrt{x}}\,\sqrt{x}\,du
$$

**Paso 2 — despejes encadenados** (para matar los radicales que quedan):

$$
\sqrt{1+\sqrt{x}}=2-u \;\Rightarrow\; 1+\sqrt{x}=(2-u)^{2} \;\Rightarrow\; \sqrt{x}=(2-u)^{2}-1=u^{2}-4u+3
$$

**Paso 3 — sustituir en $\int u^{1/2}\,dx$**:

$$
-4\int u^{1/2}(2-u)(u^{2}-4u+3)\,du=-4\int u^{1/2}\big(-u^{3}+6u^{2}-11u+6\big)\,du
$$

**Paso 4 — distribuir $u^{1/2}$ e integrar**:

$$
-4\int\big(-u^{7/2}+6u^{5/2}-11u^{3/2}+6u^{1/2}\big)\,du
=-4\Big(-u^{9/2}\tfrac{2}{9}+6u^{7/2}\tfrac{2}{7}-11u^{5/2}\tfrac{2}{5}+6u^{3/2}\tfrac{2}{3}\Big)+C
$$

**Paso 5 — regresar a $x$** (factor $-4$ fuera, raíz con exponente entero):

$$
=-4\Bigg[-\frac{2}{9}\sqrt{(2-\sqrt{1+\sqrt{x}})^{9}}+\frac{12}{7}\sqrt{(2-\sqrt{1+\sqrt{x}})^{7}}-\frac{22}{5}\sqrt{(2-\sqrt{1+\sqrt{x}})^{5}}+4\sqrt{(2-\sqrt{1+\sqrt{x}})^{3}}\Bigg]+C
$$

---

## 3. Método (continuación) — División de polinomios
> Cuaderno, «Método 2: continuación». Integral racional:
> $\displaystyle\int \frac{x^{10}+2x^{9}+x^{8}-x^{8}-2x^{5}+2x^{2}}{2x^{6}+4x^{3}+2}\,dx$

**Regla (nota del cuaderno):** *cuando el grado del numerador $\geq$ el del
denominador, conviene dividir polinomios antes de integrar.*

**Paso 1 — ordenar y factorizar el denominador:**
$2x^{6}+4x^{3}+2=2(x^{6}+2x^{3}+1)=2(x^{3}+1)^{2}$, y se saca $\tfrac{1}{2}$ fuera.

**Paso 2 — división larga** de $N=x^{10}+2x^{9}+0x^{8}+0x^{7}+0x^{6}-2x^{5}+0x^{4}+0x^{3}+2x^{2}$
entre $D'=x^{6}+2x^{3}+1$ (primer término del cociente $x^{10}/x^{6}=x^{4}$,
resto producto–resta hasta que el grado del residuo $<$ $6$). El cociente que
queda escrito para integrar es $x^{4}-x^{2}$ y el residuo sobre el denominador
$\dfrac{3x^{2}}{(x^{3}+1)^{2}}$ *(ver *Obs.* 3.1 sobre la consistencia de este
cociente/residuo con el numerador de la hoja)*:

$$
\frac{1}{2}\int\!\left(x^{4}-x^{2}+\frac{3x^{2}}{(x^{3}+1)^{2}}\right)dx
$$

**Paso 3 — integrar el polinomio** término a término:

$$
=\frac{1}{2}\Bigg[\frac{x^{5}}{5}-\frac{x^{3}}{3}+3\int\frac{x^{2}}{(x^{3}+1)^{2}}\,dx\Bigg]
$$

**Paso 4 — sustitución en la fracción restante:** $u=x^{3}+1$,
$du=3x^{2}\,dx\Rightarrow \dfrac{du}{3x^{2}}=dx$ (anotado al margen en la hoja):

$$
3\int\frac{x^{2}}{u^{2}}\cdot\frac{du}{3x^{2}}=\int u^{-2}\,du=\frac{u^{-1}}{-1}=-\frac{1}{u}
$$

**Paso 5 — juntar y regresar a $x$:**

$$
=\frac{1}{2}\Bigg(\frac{x^{5}}{5}-\frac{x^{3}}{3}-\frac{1}{x^{3}+1}\Bigg)+C
$$

---

## 4. Ejemplo de pizarra — Exponentes fraccionarios
> Pizarra, «1)». Integral con radicales elevada al cuadrado; se simplifica a
> potencias de $x$ y se desarrolla el binomio. La primera línea (con raíces)
> está borrosa/con tachaduras; la versión legible y coherente es la de potencias
> *(ver *Obs.* 4.1)*:

$$
\int\left(\frac{\tfrac{3}{2}x^{-2/3}-\tfrac{1}{2}x^{-3/4}}{\tfrac{1}{4}x^{5/2}}\right)^{2}dx
$$

**Paso 1 — dividir término a término** (propiedad $\frac{a\pm b}{n}=\frac{a}{n}\pm\frac{b}{n}$ de §0.2), restando exponentes al dividir potencias:

$$
\frac{3/2}{1/4}\,x^{-2/3-5/2}-\frac{1/2}{1/4}\,x^{-3/4-5/2}=6\,x^{-19/6}-2\,x^{-13/4}
$$

**Paso 2 — elevar el binomio al cuadrado** $(A-B)^{2}=A^{2}-2AB+B^{2}$ con
$A=6x^{-19/6}$, $B=2x^{-13/4}$:

$$
\big(6x^{-19/6}-2x^{-13/4}\big)^{2}=36\,x^{-19/3}-24\,x^{-77/12}+4\,x^{-13/2}
$$

> *Cálculo del exponente medio (anotado en la pizarra con flecha «es la meta»):*
> $-\dfrac{19}{6}-\dfrac{13}{4}=\dfrac{-38-39}{12}=-\dfrac{77}{12}$.

**Paso 3 — integral resultante** (en la pizarra queda **inconclusa**; solo se
deja planteada la suma de potencias lista para integrar):

$$
\int\big(36\,x^{-19/3}-24\,x^{-77/12}+4\,x^{-13/2}\big)\,dx \quad \text{[pendiente]}
$$

---

## Observaciones y puntos a verificar

> Formato: **[página/tema]** → qué dice tu hoja vs. qué sale por regla. El cuerpo
> de arriba usa la versión *coherente*; aquí queda la trazabilidad.

**1.1 (Ej. 1 — factor $x$ del $dx$).** De $dx=du/(2x)$, al multiplicar por $x^{12}$
debería quedar $\tfrac{1}{2}x^{11}\,du$, no $\tfrac{1}{2}x^{12}\,du$. Como luego
$x^{12}$ se reemplaza por $(u-2)^{6}$, faltaría un factor $\sqrt{u-2}$ (el
integrando «limpio» sería $\tfrac{1}{2}(u-2)^{11/2}$, no $\tfrac{1}{2}(u-2)^{6}$).
→ Revisa el enunciado impreso: ¿es $x^{12}$ o $x^{11}$? ¿y el exponente de la
raíz ($3/2$ u otro)? De eso depende todo el ejercicio.

**1.2 (Ej. 1 — exponentes de la primitiva).** La línea de distribución da
$u^{15/2},u^{13/2},\dots,u^{3/2}$ (claro y correcto). Al integrar, la regla $+1$
da $17/2,15/2,\dots,5/2$ (lo que puse en el cuerpo). En tu hoja esa línea está
muy apretada y某些 trazos pueden leerse como $21/2,19/2,\dots,9/2$; verifica que
no hayas sumado $3$ en vez de $1$ en algún término. Ídem en la última línea (las
raíces deben ser de potencias $17,15,13,11,9,7,5$).

**2.1 (Ej. 2 — signo del factor global y último coeficiente).** La primitiva en
$u$ lleva factor $-4$; por eso en el cuerpo puse $-4[\dots]$. En tu hoja el
corchete final aparece con factor $+4$ y, en el último término, coeficiente
$\tfrac{4}{3}$; pero $6\cdot\tfrac{2}{3}=4$ (no $\tfrac{4}{3}$), y el signo global
debe ser $-4$ para cuadrar con el paso anterior. → Uniforma signo y ese $4$.

**3.1 (División de polinomios — cociente/residuo).** El cociente+residuo que se
integra en §3 ($x^{4}-x^{2}$ y $\tfrac{3x^{2}}{(x^{3}+1)^{2}}$) **no** coincide con
lo que saldría de dividir el numerador escrito en la hoja
($x^{10}+2x^{9}+x^{8}-x^{8}-2x^{5}+2x^{2}$) entre $x^{6}+2x^{3}+1$ (eso daría otro
cociente y un residuo de grado $5$). Además el numerador tiene $+x^{8}-x^{8}$
(cancelación sospechosa) y la división larga de esa página se ve como borrador
con tachaduras. → Confirma el enunciado original y rehaz la división larga; el
método (sacar $\tfrac12$, dividir, sustituir $u=x^{3}+1$ en la fracción) está
bien planteado, el riesgo está en los coeficientes del cociente.

**4.1 (Pizarra — primera línea).** La versión con radicales
$\big(\tfrac{2}{3}\sqrt[3]{x^{1/2}}-2\sqrt[4]{x^{-3}}\big)/\big(\tfrac{1}{4}\sqrt{x^{\dots}}\big)$
no reproduce por conversión directa los exponentes $-2/3,-3/4,5/2$ de la versión
de potencias (que sí cuadran entre sí y con el desarrollo del cuadrado). La
pizarra parece tener una reescritura con tachaduras. → Si necesitas el enunciado
exacto, cópialo de la versión de potencias de la §4, que es la autoconsistente.

**4.2 (Pizarra — cierre).** El ejercicio queda sin integrar en la pizarra. Por si
te sirve el resultado esperado (regla $\int x^{k}dx=\tfrac{x^{k+1}}{k+1}$):
$$
-\tfrac{27}{4}x^{-16/3}+\tfrac{288}{65}x^{-65/12}-\tfrac{8}{11}x^{-11/2}+C
$$

**General.** Varias fotos vienen rotadas y la caligrafía es apretada; donde dudé
elegí la lectura matemáticamente coherente y la marqué arriba. Si al abrir el
`.md` en Obsidian/VS Code quieres anclas por ejercicio, los títulos ya son
clicables desde el índice; dime si prefieres también etiquetas `#sustitución`,
`#pascal`, `#racionales`, `#trigonometría` al pie de cada sección.