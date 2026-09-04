# Ejercicios de derivadas: Clases comisionadas Ruben Valderrama, mates ii

> **Nota:** Los ejercicios están reorganizados **por tema**. Cada ejercicio conserva entre paréntesis la referencia al examen original de donde proviene (`[Examen #]`).

---

## Índice de temas

1. Derivación de funciones (regla de la cadena, producto, cociente)
2. Derivada por definición
3. Derivadas de orden superior
4. Derivación implícita
5. Recta tangente y normal
6. Derivadas paramétricas
7. Regla de L'Hôpital
8. Derivabilidad y continuidad
9. Estudio completo de curvas
10. Expresión adicional (borrador)

---

## 1. Derivación de funciones

> Derivar cada una de las siguientes funciones (regla de la cadena, producto y cociente).

**1.1** [Examen 2, Prob. 1]

**a)** $f(x) = \left(\dfrac{-2x^{-1} - 3x + 1}{3x - 2x^2 + 3}\right)^8$ *(3 ptos)*

**b)** $f(x) = \sqrt{\left(2\sqrt{x^3} - 3\sqrt[3]{x^{31}}\right)^5}$ *(3,5 ptos)*

**c)** $f(x) = \operatorname{sen}^4(\pi^2 a x^5) \cdot \cos^8(\pi^2 a x^5)$ *(3 ptos)*

**d)** $f(x) = \dfrac{\cos(2x) - \operatorname{sen}(2x)}{\operatorname{sen}(2x) + \cos(2x)}$ *(3 ptos)*

**1.2** [Examen 5, Prob. 1]

**a)** $f(x) = (2/3)\cdot\sqrt{\cot^3(\pi - \pi x^2)^2}$ *(3 ptos)*

**b)** $f(x) = \left[\dfrac{(x^2 - 3)^2}{5 - x^2}\right]^3$ *(2 ptos)*

**1.3** [Examen 6, Prob. 1]

**a)** $f(x) = \left[\dfrac{2x^{-1} + x^2 + 3}{x^{-2} - 4}\right]^5$

**b)** $f(x) = \operatorname{sen}^2(-3\pi x^2)\cdot\cos^3\left(\frac{\pi}{2}x^3\right)$ *(4 ptos)*

---

## 2. Derivada por definición

**2.1** [Examen 1, Inciso I] Halle la derivada por definición de $f(x) = \dfrac{2x}{1-x}$ *(3 ptos)*

**2.2** [Examen 3 (A), Prob. 1] Aplicando la definición de derivada, determinar $f'(x)$ de la siguiente función:

$$f(x) = (4x^2 + 1)^{1/2} \quad \text{Valor: 2 puntos}$$

---

## 3. Derivadas de orden superior

**3.1** [Examen 2, Prob. 2] Hallar la tercera derivada de:

$$f(x) = \cot^4(2x^2) \quad (3{,}5 \text{ ptos})$$

**3.2** [Examen 5, Prob. 6] Hallar la tercera derivada de la función: *(2 ptos)*

$$f(x) = \operatorname{sen}(\pi x)\cdot\cos(\pi x)$$

**3.3** [Examen 5, Prob. 3] Dada $x^2 + y^2 = 100$, compruebe que: $y'' = -\dfrac{100}{y^3}$ *(3 ptos)*

---

## 4. Derivación implícita

**4.1** [Examen 2, Prob. 3] Hallar $y'$ por diferenciación implícita.

$$x^3 y^2 - x^2 y^3 + (2x-y)^2 = y^3 + (y-2x)^2 \quad (4 \text{ ptos})$$

**4.2** [Examen 5, Prob. 2] Hallar $y'$ por diferenciación implícita: *(3 ptos)*

$$(y^2 - 2x^2)^2 - (x^2 - 2y^2)^2 = 3xy + 1$$

**4.3** [Examen 6, Prob. 2] Obtenga $y'$ por diferenciación implícita: *(4 ptos)*

**a)** $\csc(x - y) + \sec(x + y) = x$

**b)** $(xy)^2 - xy^2 = x^3 + y^3$

---

## 5. Recta tangente y normal

**5.1** [Examen 1, Inciso II] Halle la ecuación de la recta tangente y normal a la curva $xy^2 - \cos(x-y) = x - y$ en el punto $(1,1)$ *(3 ptos)*

**5.2** [Examen 3 (A), Prob. 4] Hallar las ecuaciones de la recta tangente y normal a la gráfica de la curva dada por:

$$x + \operatorname{sen}(xy) = y + \frac{\pi}{2} \quad \text{en el punto } \left(\frac{\pi}{2}, 1\right) \quad \text{Valor: 2 puntos}$$

**5.3** [Examen 3 (III Parcial), Prob. 1] Hallar la ecuación de la recta tangente y normal a la curva dada por:

$$\sqrt{x^2 + y^2} + x^2 = 5y + 6$$

en el punto $(4, 3)$. *(3 ptos)*

**5.4** [Examen 4, Prob. 3] Hallar la ecuación de la recta tangente y la recta normal a:

$$\cos(x - y) = y\cdot x^2 + y - x^3$$

en el punto $(1, 1)$. *(4 ptos)*

**5.5** [Examen 5, Prob. 4] Hallar la ecuación de la recta tangente y normal a la curva:

$$(x + y)^2 - 3x - 2y = 0$$

en el punto $(-1, -2)$. *(4 ptos)*

**5.6** [Examen 7 (A), Prob. 2] Hallar las ecuaciones de las rectas tangente y normal a la curva:

$$(x - y)^2 + x = \operatorname{sen}(x - y)$$

en el punto $(0, \pi)$. *(3 ptos)*

**5.7** [Examen 8 (B), Prob. 2] Hallar las ecuaciones de las rectas tangente y normal a la curva:

$$x^2 y + y^3 = \cos(x + 4)$$

en el punto $(0, -\pi/2)$. *(3 ptos)*

---

## 6. Derivadas paramétricas

**6.1** [Examen 1, Inciso III] Dada $\begin{cases} y = \operatorname{sen}(2t) \\ x = 2\operatorname{sen}^2(2t) \end{cases}$ Demuestre que $\dfrac{d^2y}{dx^2} = -\dfrac{1}{16}\csc^3(2t)$ *(3,5 ptos)*

**6.2** [Examen 3 (A), Prob. 2] Dadas las ecuaciones paramétricas: $\begin{cases} x = \operatorname{sen}^4 t \\ y = \cos^4 t \end{cases}$

demostrar que: $\dfrac{d^2y}{dx^2} = \dfrac{1}{2}\csc^6 t \quad \text{Valor: 2 puntos}$

**6.3** [Examen 3 (III Parcial), Prob. 3] Sean las ecuaciones paramétricas:

$$x = \operatorname{tg}(2t) \qquad y = \sec^3(2t)$$

Demostrar que: $\dfrac{d^2y}{dx^2} = 6\sec^2(2t) - 3$ *(3 ptos)*

**6.4** [Examen 4, Prob. 1] Dadas las ecuaciones paramétricas:

$$x = \cos^3(t) \qquad y = \operatorname{sen}^3(t)$$

demuestre que: $\dfrac{d^2y}{dx^2} = \dfrac{\sec^4(t)\cdot\csc(t)}{3}$ *(4 puntos)*

**6.5** [Examen 6, Prob. 4] Dadas $y = \dfrac{t\sec(t)}{4}$ y $x = \dfrac{\sec(t)}{2}$, hallar $\dfrac{dy}{dx}$. *(3 ptos)*

**6.6** [Examen 7 (A), Prob. 1] Dadas las ecuaciones paramétricas:

$$x = \operatorname{sen}^3(2t) \qquad y = \tan^3(2t)$$

demuestre que: $\dfrac{d^2y}{dx^2} = \dfrac{5}{3}\sec^3(2t)\csc(2t)$ *(5 ptos)*

**6.7** [Examen 8 (B), Prob. 1] Dadas las ecuaciones paramétricas:

$$x = 2\operatorname{sen}^2(2t) \qquad y = \operatorname{sen}(2t)$$

demuestre que: $\dfrac{d^2y}{dx^2} = \sec^3(2t)$ *(5 ptos)*

---

## 7. Regla de L'Hôpital

**7.1** [Examen 1, Inciso IV] Utilice L'Hôpital para hallar el valor del siguiente límite.

$$\lim_{x \to 0} \frac{\operatorname{tg}x - \operatorname{sen}x}{\operatorname{tg}^3 x} \quad (3{,}5 \text{ ptos})$$

**7.2** [Examen 3 (A), Prob. 3] Aplicando la Regla de L'Hôpital, resolver el siguiente límite:

$$\lim_{x \to \pi} \frac{1 + \cos x}{(2\pi - 2x)^2} \quad \text{Valor: 2 puntos}$$

**7.3** [Examen 3 (III Parcial), Prob. 2] Resuelva el siguiente límite aplicando la Regla de L'Hôpital: *(4 ptos)*

$$\lim_{x \to 0} \frac{2 + \operatorname{tg}^2(x) - 2\cos(2x)}{3\cdot x\cdot\operatorname{sen}(x)}$$

**7.4** [Examen 4, Prob. 2] Evaluar el siguiente límite usando L'Hôpital: *(4 puntos)*

$$\lim_{x \to 0} \frac{1 - \cos^2(x)}{x\cdot\operatorname{sen}(2x)}$$

**7.5** [Examen 6, Prob. 3] Aplicando Regla de L'Hôpital, demuestre que: *(3 ptos)*

$$\lim_{x \to 1} \frac{2\operatorname{sen}(\pi x) + \pi(x^2 - 1)}{(1 - x)^2} = \pi$$

**7.6** [Examen 7 (A), Prob. 3] Aplique la regla de L'Hôpital para calcular: *(4 ptos)*

$$\lim_{x \to 0} \frac{1 - \cos^3 x}{x\cdot\operatorname{sen} 2x}$$

**7.7** [Examen 8 (B), Prob. 3] Aplique la regla de L'Hôpital para calcular: *(4 ptos)*

$$\lim_{x \to \pi/4} \frac{\operatorname{sen} x - \cos x}{1 - \tan x}$$

---

## 8. Derivabilidad y continuidad

**8.1** [Examen 3 (A), Prob. 5] Dada la función definida por:

$$f(x) = \begin{cases} \sqrt{8-x} & \text{si } x \leq 4 \\ x^2 - 14 & \text{si } x > 4 \end{cases}$$

analizar la derivabilidad de $f$ en el punto $x_0 = 4$ $\quad$ *Valor: 2 puntos*

**8.2** [Examen 5, Prob. 5] Hallar las constantes $a$ y $b$ para que la función sea diferenciable en el punto $x_0 = 2$: *(3 ptos)*

$$f(x) = \begin{cases} x^2 - 4, & \text{si } x < 2 \\ a\cdot x^2 + b, & \text{si } x \ge 2 \end{cases}$$

---

## 9. Estudio completo de curvas

**9.1** [Examen 1, Inciso V] Dada $f(x) = (x+2)^2(x-1)^2 + 1$

Halle:

1. Dominio y cortes con los ejes *(1 pto)*
2. Simetría *(0,5)*
3. Halle los intervalos de crecimiento y decrecimiento. Los máximos y mínimos si los tiene. *(1,75 ptos)*
4. Determine los intervalos donde es cóncava hacia abajo y donde es cóncava hacia arriba. Los puntos de inflexión si los tiene. *(1,75 ptos)*
5. Trace la gráfica y halle el rango *(2 ptos)*

**9.2** [Examen 3 (III Parcial), Prob. 4] Dada la función $x^2 y - x^3 = 4y$, determine:

**a)** Dominio de la función *(0,5 ptos)*
**b)** Cortes con los ejes *(0,5 ptos)*
**c)** Simetría *(0,5 ptos)*
**d)** Asíntotas *(1 pto)*
**e)** Intervalos donde crece o decrece *(1,5 ptos)*
**f)** Máximos y mínimos si los hay *(0,5 ptos)*
**g)** Concavidad y puntos de inflexión *(2 ptos)*
**h)** Gráfica de la función *(3 ptos)*
**i)** Rango *(0,5 ptos)*

**9.3** [Examen 4, Prob. 4] Dada la función definida por $f(x) = \dfrac{x}{x^2 - 4}$:

**a)** Hallar dominio, rango, corte con los ejes, asíntotas. *(2 ptos)*
**b)** Números críticos, intervalos de crecimiento y decrecimiento. *(2 ptos)*
**c)** Hallar intervalos de concavidad y puntos de inflexión, si existen. *(2 ptos)*
**d)** Trazar la gráfica. *(2 ptos)*

**9.4** [Examen 6, Prob. 5] Dada $f(x) = \dfrac{x - 2}{x^2 - 1}$, hallar los intervalos de crecimiento y decrecimiento. Localizar puntos máximos y mínimos relativos, si los hay. *(3 ptos)*

**9.5** [Examen 6, Prob. 6] Sea $f(x) = 2x^3 + 3x^2 - 12x + 5$, hallar si existen, puntos de inflexión. Hallar intervalos donde la gráfica de $f$ es cóncava hacia abajo y hacia arriba. *(3 ptos)*

**9.6** [Examen 7 (A), Prob. 4] Realizar el estudio completo de la curva $x^2 y + y - 3x^2 = 0$. Determine el rango. *(8 ptos)*

**9.7** [Examen 8 (B), Prob. 4] Realizar el estudio completo de la curva $x^2 y + 2y - x^2 - 1 = 0$. Determine el rango. *(8 ptos)*

---

## 10. Expresión adicional (borrador)

**10.1** [Examen 6, Prob. 7] Expresión adicional (aparece sin enunciado, junto a factorizaciones de borrador):

$$\left[\frac{(x^2 - 3x - 28)\cdot(x^2 - 36)}{(x^2 - 13x + 42)\cdot(x^2 - 16)}\right]$$

---

> Nota: se respeta la notación original (sen = seno, tg = tangente, tan = tangente).