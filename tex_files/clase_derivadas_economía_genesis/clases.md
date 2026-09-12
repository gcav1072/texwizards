# 🧮 Materia: Matemática Aplicada a la Economía

## Tema 1 · Variación e incremento de una función

### Clase 1 · Incrementos y tasa de cambio
*(Tanda 1 · foto 1)*

#### 1.1. Incremento de la variable independiente

- Se denota **Δx** ("delta" = incremento):
  - `Δx = x₂ − x₁`
  - `Δx = xf − x₀`

**Ejemplo A.** Si x₁ = 4 y x₂ = 3.90:

> Δx = 3.90 − 4 = **−0.1**

**Ejemplo B.** Si x₁ = 3 y x₂ = 3.05:

> Δx = 3.05 − 3 = **0.05**

**Ejemplo C (despejar x₂).** Suponga que Δx = 0.06 y x₁ = 5.
Como Δx = x₂ − x₁, entonces:

> x₂ = x₁ + Δx = 5 + 0.06 = **5.06**

#### 1.2. Incremento de una función

- `ΔF = Δy = y₂ − y₁`
- `ΔF(x) = f(x₂) − f(x₁)`
- Sabiendo que x₂ = x₁ + Δx:
  `ΔF(x) = f(x₁ + Δx) − f(x₁)`

**Ejemplo.** Hallar los incrementos de x y de y para x₁ = 2 y x₂ = 2.03 en la función F(x) = √(3x² + 1).

- **Incremento de x:**
  Δx = x₂ − x₁ = 2.03 − 2 = **0.03**
- **Incremento de y:**
  - y₂ = f(x₂) = **3.65**
  - y₁ = f(2) = √(3·2² + 1) = √(12 + 1) = √13 ≈ **3.60**
  - Δy = y₂ − y₁ = 3.65 − 3.60 = **0.05**

#### 1.3. Tasa de cambio (velocidad media)

> T = Δy / Δx

---

## Tema 2 · Modelos matemáticos en economía

### Clase 2 · Funciones económicas e interés compuesto (teoría)
*(Tanda 1 · foto 2)*

#### 2.1. Función ingreso

- `I(q) = P(q) · q`
  - q → unidades producidas
  - P → precio
- Forma simplificada: `I(q) = q · P`

#### 2.2. Función de costos

- `C(q) = Cv + Cf`
  - Cv → costo variable
  - Cf → costo fijo

#### 2.3. Función beneficio

- `B(q) = I(q) − C(q)`

#### 2.4. Equilibrio entre oferta y demanda

- Condición: `S(P) = D(P)` → **punto de equilibrio** (intersección de las curvas en el gráfico).

#### 2.5. Función de interés compuesto

- `P = P₀(1 + r)ⁿ`
  - P → capital
  - P₀ → capital inicial
  - r → interés
  - n → tiempo

---

### Clase 3 · Ejercicio: equilibrio de oferta y demanda
*(Tanda 1 · foto 3)*

**Enunciado.** Las funciones de oferta y demanda de un determinado artículo son:

- `S(P) = 4p + 200`
- `D(P) = −3p + 480`

¿Cuál es el precio de equilibrio y las cantidades correspondientes? Si el precio se incrementa en un 2% a partir del equilibrio, ¿cuál es el incremento de la oferta y de la demanda?

**Solución.**

1. **Condición de equilibrio:** S(P) = D(P)
   - 4P + 200 = −3P + 480
   - 4P + 3P = 480 − 200
   - 7P = 280 ⇒ **P = 40**
2. **Oferta en P = 40:** S(40) = 4(40) + 200 = **360**
3. **Demanda en P = 40:** D(40) = −3(40) + 480 = **360**
4. **Punto de equilibrio:** (40, 360)
5. **Incremento del precio en 2%:**
   - Si 40 → 100% y x ← 2% ⇒ x = 80/100 = 0.8
   - P₁ = 40 · P₂ = 40.8 · ΔP = 0.8
6. **Incremento de la oferta:**
   - S(40.8) = 4(40.8) + 200 = 363.2
   - ΔS = 363.2 − 360 = **3.2**
7. **Incremento de la demanda:**
   - D(40.8) = −3(40.8) + 480 = 357.6
   - ΔD = 357.6 − 360 = **−2.4**
8. **Tasas de cambio:**
   - Oferta: Ts = ΔS/ΔP = 3.2/0.8 = **4**
   - Demanda: TD = ΔD/ΔP = −2.4/0.8 = **−3**

---

### Clase 4 · Ejercicio: equilibrio del productor (chocolate Savoy)
*(Tanda 1 · foto 4)*

**Enunciado.** Suponga que el chocolate Savoy vende cajas de bombones a 2000 bs c/u. Si q es el número de cajas producidas en miles semanalmente, los costos vienen dados por:

- `C(q) = 100q² + 1300q + 1000`

Determine el punto de equilibrio del productor. Si q se incrementa un 5% a partir del equilibrio, determine el incremento del costo y el incremento del ingreso.

**Solución.**

1. **Ingreso:** I(q) = q · P = 2000q
2. **Condición de equilibrio:** I(q) = C(q)
   - 2000q = 100q² + 1300q + 1000
   - 100q² − 700q + 1000 = 0  (a = 100, b = −700, c = 1000)
   - q = [700 ± √(700² − 4·100·1000)] / (2·100) ⇒ **q₁ = 5**, **q₂ = 2**
3. **Verificación:**
   - I(5) = 2000·5 = 10000 · C(5) = 100·5² + 1300·5 + 1000 = 10000 ✔
   - I(2) = 2000·2 = 4000 · C(2) = 100·2² + 1300·2 + 1000 = 4000 ✔
4. **Se toma q₁ = 5. Incremento de q en 5%:**
   - Si 5 → 100% y x ← 5% ⇒ x = 25/100 = 0.25 ⇒ q₂ = 5.25
5. **Incremento del ingreso:**
   - I₁ = 10000 · I₂ = 2000·(5.25) = 10500
   - ΔI = 10500 − 10000 = **500**
6. **Incremento del costo:**
   - C₁ = 10000
   - C₂ = 100·(5.25)² + 1300·(5.25) + 1000 = 10256.25 *(según el cuaderno)*
   - ΔC = 10256.25 − 10000 = 256.25 *(según el cuaderno)*
   - ⚠️ *Ver fe de erratas n.º 2: el valor correcto es C₂ = 10581.25 ⇒ ΔC = 581.25.*

---

### Clase 5 · Ejercicio: interés compuesto y logaritmos
*(Tanda 1 · foto 5)*

**Enunciado.** Suponga que 100$ son invertidos a un interés compuesto de 6% anual. ¿Cuánto tardará en incrementar la inversión a 150$?

**Datos.** P₀ = 100$ · PF = 150$ · r = 6% = 0.06 · n = ?

**Solución.**

1. PF = P₀(1 + r)ⁿ
2. 100(1 + 0.06)ⁿ = 150
3. (1.06)ⁿ = 150/100 = 1.5
4. **Aplicamos logaritmos:**
   - log(1.06)ⁿ = log(1.5)
   - n · log(1.06) = log(1.5)
   - n = log(1.5) / log(1.06) ≈ 0.176 / 0.025 ≈ 6.93 ≈ **7**

> **Respuesta:** la inversión tardará aproximadamente **7 años** en llegar a 150$.

---

## Tema 3 · La derivada: definición e interpretación

### Clase 6 · De la tasa media a la tasa instantánea (16/06/26)
*(Tanda 2 · foto 1)*

#### 6.1. Tasa media o tasa promedio (recapitulación)

- `T = Δy/Δx = (y₂ − y₁)/(x₂ − x₁) = [f(x₂) − f(x₁)]/(x₂ − x₁)`

#### 6.2. Gráficamente: de la secante a la tangente

- La **recta secante** pasa por los puntos P y Q de la curva.
- Cuando Δx → 0 (es decir, x₂ → x₁), la recta secante se convierte en la **recta tangente**.

#### 6.3. La tasa instantánea: razón de cambio (definición de derivada)

- "Luego ocurre que:"

> lim Δx→0 Δy/Δx = lim Δx→0 (y₂ − y₁)/Δx = lim Δx→0 [f(x₂) − f(x₁)]/Δx = lim Δx→0 [f(x + Δx) − f(x)]/Δx

- Este límite recibe los nombres de: **razón de cambio**, **tasa instantánea** y **velocidad instantánea**.
- **Condición:** f(x) tiene que ser **continua**.
- **Geométricamente:** la derivada de f es la **pendiente de la recta tangente** en un punto específico x₀.

#### 6.4. Notación de la derivada de la función

- Formas del límite: `lim Δx→0 Δy/Δx` · `lim Δx→0 [f(x+Δx) − f(x)]/Δx`
- Notaciones equivalentes: **f′(x)** · **y′** · **dy/dx** · **(d/dx)y**

---

### Clase 7 · Derivadas por definición y tabla de derivadas (16/06/26, cont.)
*(Tanda 2 · fotos 2–3)*

**Enunciado.** Hallar la derivada de las siguientes funciones:

- `f(x) = 3x² − 2x + 1`
- `g(x) = 1/(x+2)`

#### 7.1. Derivada de f(x) = 3x² − 2x + 1 (tomando Δx = h)

1. f′(x) = lim Δx→0 [f(x+Δx) − f(x)]/Δx
2. = lim h→0 [3(x+h)² − 2(x+h) + 1 − (3x² − 2x + 1)] / h
3. = lim h→0 [3(x² + 2xh + h²) − 2x − 2h + 1 − 3x² + 2x − 1] / h
4. = lim h→0 [3x² + 6xh + 3h² − 2x − 2h + 1 − 3x² + 2x − 1] / h  *(se cancelan 3x², 2x y 1)*
5. = lim h→0 [6xh + 3h² − 2h] / h = lim h→0 [h(6x + 3h − 2)] / h = lim h→0 (6x + 3h − 2)
6. = 6x + 3·0 − 2 = **6x − 2**

#### 7.2. Derivada de g(x) = 1/(x+2)

1. g′(x) = lim h→0 [g(x+h) − g(x)] / h = lim h→0 [1/(x+h+2) − 1/(x+2)] / h
2. = lim h→0 [(x+2) − (x+h+2)] / [(x+h+2)(x+2)] / h = lim h→0 [−h] / [(x+h+2)(x+2)] / h
3. = lim h→0 [−h] / [h(x+h+2)(x+2)] = lim h→0 [−1] / [(x+h+2)(x+2)]
4. = [−1] / [(x+0+2)(x+2)] = **−1/(x+2)²**

#### 7.3. La tabla de derivadas (primeras reglas)

| Función | Derivada |
| :--- | :--- |
| f = u + v + w | f′ = u′ + v′ + w′ |
| f = k (constante) | f′ = 0 |
| f(x) = ax | f′(x) = a |
| f(x) = xⁿ | f′(x) = n·xⁿ⁻¹ |

- **Ejemplo recuadrado (verificación con la tabla):** f(x) = 3x² − 2x + 1 ⇒ f′(x) = 2·3x − 2 = **6x − 2** ✔ (coincide con 7.1)

> *Nota:* en la parte superior de la página figura el rótulo "derivada del costo, beneficio, beneficio marginal", contenido que se desarrolla en la Clase 8.

---

### Clase 8 · Definición, interpretación y derivadas marginales en economía (18/06/26)
*(Tanda 2 · foto 4)*

- **Nota de apertura:** "Optimización: obtener algo producido menos" *(sic; idea: lograr el mejor resultado con el menor uso de recursos)*.
- **Definición.** Por definición, la derivada de una función f(x) **continua** en un intervalo cerrado I viene dada por:

> lim Δx→0 Δy/Δx = lim h→0 [f(x+h) − f(x)] / h,  sabiendo que h = Δx

- **Interpretación:** se interpreta como el **ritmo de cambio** de la función con respecto a la variable independiente.
- **Geométricamente:** la derivada es **m_T = pendiente de la recta tangente** en un punto x₀ de la gráfica ("recta tg en x₀").

#### 8.1. En economía: las derivadas marginales

| Magnitud | Función | Derivada | Nombre |
| :--- | :--- | :--- | :--- |
| Ingreso | I(q) | I′(q) = dI/dq | **Ingreso marginal** |
| Costo | C(q) | C′(q) = dC/dq | **Costo marginal** |
| Beneficio | B(q) | B′(q) = dB/dq = d/dq (I − C) | **Beneficio marginal** |

---

### Clase 9 · Ejemplo con tabla y reglas de derivación (18/06/26, cont.)
*(Tanda 2 · foto 5)*

**Enunciado.** Usando la tabla y regla de derivación, hallar la derivada de la siguiente función:

- `f(x) = 3x² − 5x + 1`

#### 9.1. Por definición

1. f′(x) = lim Δx→0 [f(x+Δx) − f(x)] / Δx
2. = lim h→0 [3(x+h)² − 5(x+h) + 1 − (3x² − 5x + 1)] / h
3. = lim h→0 [3(x² + 2xh + h²) − 5x − 5h + 1 − 3x² + 5x − 1] / h
4. = lim h→0 [3x² + 6xh + 3h² − 5x − 5h + 1 − 3x² + 5x − 1] / h  *(tachaduras: 3x², 5x y 1)*
5. = lim h→0 [6xh + 3h² − 5h] / h = lim h→0 [h(6x + 3h − 5)] / h
6. = lim h→0 (6x + 3h − 5) = 6x + 3·0 − 5 = **6x − 5**

#### 9.2. Otra forma (con la tabla)

- Reglas: `f = u − v + k ⇒ f′ = u′ − v′ + k′` · `f = a·xⁿ ⇒ f′ = n·a·xⁿ⁻¹`
- f′(x) = 2·3x − 5 + 0 = **6x − 5** ✔ (coincide con 9.1)

---

## Tema 4 · Reglas de derivación y técnicas avanzadas

### Clase 10 · Exponentes fraccionarios y regla del cociente
*(Tanda 3 · foto 1)*

#### 10.1. Derivada de g(x) = ∛(x²) − 4√(x³)

1. Reescrita con exponentes: g(x) = x^(2/3) − 4x^(3/2)
2. g′(x) = (2/3)·x^(2/3 − 1) − (3/2)·4x^(3/2 − 1)
3. g′(x) = (2/3)·x^(−1/3) − 6x^(1/2)
4. **Recuadro:** g′(x) = 2/(3∛x) − 6√x

#### 10.2. Regla del cociente: h(x) = (4x² + 1)/(3x + 2)

- Forma: `f = u/v ⇒ f′ = (v·u′ − u·v′)/v²`
- u = 4x² + 1 ⇒ u′ = 8x · v = 3x + 2 ⇒ v′ = 3
- h′(x) = [(3x+2)(8x) − (4x²+1)(3)] / (3x+2)²
- h′(x) = [24x² + 16x − 12x² − 3] / (3x+2)²
- **Recuadro:** h′(x) = (12x² + 16x − 3)/(3x+2)²

---

### Clase 11 · Regla del producto y regla de la cadena (potencia 1/2)
*(Tanda 3 · foto 2)*

#### 11.1. Regla del producto: F(t) = (2t³ + t²)(5t + 1)

- Forma: `f = u·v ⇒ f′ = u·v′ + v·u′`
- u = 2t³ + t² ⇒ u′ = 6t² + 2t · v = 5t + 1 ⇒ v′ = 5
- f′(t) = (2t³ + t²)·5 + (5t + 1)(6t² + 2t)
- f′(t) = 10t³ + 5t² + 30t³ + 6t² + 10t² + 2t
- **Recuadro:** f′(t) = 40t³ + 21t² + 2t

#### 11.2. Regla de la cadena con potencia 1/2: F(x) = √(3x² + 5x − 1)

- Forma: `f = u^(1/2) ⇒ f′ = (1/2)·u^(−1/2)·u′`
- F(x) = (3x² + 5x − 1)^(1/2)
- f′(x) = (1/2)·(3x² + 5x − 1)^(−1/2)·(6x + 5)
- f′(x) = (6x + 5) / [2·(3x² + 5x − 1)^(1/2)]
- **Recuadro:** f′(x) = (6x + 5) / [2√(3x² + 5x − 1)]

---

### Clase 12 · Cadena con exponente negativo, exponencial y logaritmo
*(Tanda 3 · foto 3)*

#### 12.1. Z(x) = 1/√(5x + 3)

- Z(x) = 1/(5x+3)^(1/2) = (5x+3)^(−1/2)
- Z′(x) = (−1/2)·(5x+3)^(−3/2)·5
- Z′(x) = −5 / [2·(5x+3)^(3/2)]
- **Recuadro:** Z′(x) = −5 / [2·(√(5x+3))³]  *(el recuadro del cuaderno dice "Z(x)", pero corresponde a Z′(x))*

#### 12.2. Exponencial: y = e^(3x² + 1)

- y′ = dy/dx = e^(3x²+1)·(6x)
- **Recuadro:** y′ = 6x·e^(3x²+1)

#### 12.3. Logaritmo: P(x) = ln(2x² + x)

- P′(x) = (4x + 1)/(2x² + x)

---

### Clase 13 · Propiedades de logaritmos aplicadas a la derivada
*(Tanda 3 · foto 4)*

**Función:** h(x) = ln √[(x² + 3)/(2x − 1)]

1. h(x) = ln [ (x²+3)/(2x−1) ]^(1/2)
2. **Por propiedad de log:** h(x) = (1/2)·ln[ (x²+3)/(2x−1) ]
3. h(x) = (1/2)·[ ln(x²+3) − ln(2x−1) ]
4. h′(x) = (1/2)·[ 2x/(x²+3) − 2/(2x−1) ]
5. h′(x) = (1/2)·[ (4x² − 2x − 2x² − 6) / ((x²+3)(2x−1)) ]
6. **Recuadro:** h′(x) = (1/2)·(2x² − 2x − 6)/((x²+3)(2x−1))
   - *Simplificación posible:* h′(x) = (x² − x − 3)/((x²+3)(2x−1))

---

### Clase 14 · Serie de ejercicios de reglas de derivación (08/09/26)
*(Tanda 3 · foto 5)*

**Consigna.** Usar la regla de derivación para calcular la derivada de las siguientes funciones.

**a)** f(x) = ln[(x² − 2x + 1)/(3x − 1)]

- f(x) = ln(x² − 2x + 1) − ln(3x − 1)
- f′(x) = (2x − 2)/(x² − 2x + 1) − 3/(3x − 1)

**b)** g(x) = √(3x² − x + 1)

- g(x) = (3x² − x + 1)^(1/2)
- g′(x) = (1/2)·(3x² − x + 1)^(−1/2)·(6x − 1)
- g′(x) = (6x − 1) / [2√(3x² − x + 1)]

**c)** h(x) = 2x^p + x^(p−1)

- h′(x) = 2p·x^(p−1) + (p−1)·x^(p−2)

**d)** M(x) = e^(−x²) + ln(2xⁿ − 3)

- M′(x) = e^(−x²)·(−2x) + [n·2x^(n−1)]/(2xⁿ − 3)
- M′(x) = −2x·e^(−x²) + [2n·x^(n−1)]/(2xⁿ − 3)

---

### Clase 15 · Método de derivación logarítmica (y = u^v)
*(Tanda 4 · fotos 1–2)*

**Idea del método** ("método de derivación logarítmica"): cuando la función tiene la forma y = u(x)^v(x), se aplica **ln en ambos lados de la expresión**, se bajan exponentes con las propiedades del log y luego se deriva implícitamente.

#### 15.1. Ejercicio e: y = (5x + eˣ)^(2x+1)

1. **Aplicando log en ambos lados:** ln y = ln (5x + eˣ)^(2x+1)
2. Propiedad `log aⁿ = n·log a`:  ln y = (2x+1)·ln(5x + eˣ)
3. Derivando (regla del producto, con d/dx[ln y] = y′/y):
   y′/y = (2x+1)·(5 + eˣ)/(5x + eˣ) + ln(5x + eˣ)·2
4. Despejando y′ = y·[…]:
   **y′ = (5x + eˣ)^(2x+1) · [ (2x+1)·(5 + eˣ)/(5x + eˣ) + 2·ln(5x + eˣ) ]**

#### 15.2. Ejercicio f: J(x) = [(3x² − 1)/(2x + 1)]^(x+2)

1. **Aplicando log:** ln y = ln [ (3x²−1)/(2x+1) ]^(x+2)
2. Propiedades: `log aⁿ = n·log a` · `log(A/B) = log A − log B`
3. ln y = (x+2)·ln[ (3x²−1)/(2x+1) ] = (x+2)·[ ln(3x²−1) − ln(2x+1) ]
4. Derivando (producto, con u = x+2 y v = ln(3x²−1) − ln(2x+1)):
   y′/y = (x+2)·[ 6x/(3x²−1) − 2/(2x+1) ] + [ ln(3x²−1) − ln(2x+1) ]
5. **y′ = [(3x²−1)/(2x+1)]^(x+2) · [ (x+2)·(6x/(3x²−1) − 2/(2x+1)) + ln(3x²−1) − ln(2x+1) ]**
   - *Nota:* la última línea del cuaderno aparece con tachaduras y se lee con dificultad; se conserva el factor (x+2) que figura en el paso del y′/y (ver fe de erratas n.º 8).

#### 15.3. Ejercicios propuestos (enunciados; sin desarrollo en el cuaderno)

"Calcule la derivada de las siguientes funciones:"

- **a)** f(p) = [e^(−p²) + ln(p²)] / (p² + 1)
- **b)** Q(s) = ⁵√(25^s − e^(3s))
- **c)** h(z) = ln( √(z² + e^(−z)) )³
- **d)** W(x) = (3x²·e^(2x)) / (x − 1)

---

### Clase 16 · Derivación implícita (10/09/26)
*(Tanda 4 · foto 3)*

**Consigna.** Resolver usando la regla la derivada de las siguientes funciones (derivación implícita).

#### 16.1. Ejercicio a: a·x³ + 4x²y − x·y³ = 0

1. 3a·x² + 8xy + 4x²·y′ − (y³ + x·3y²·y′) = 0
2. 3a·x² + 8xy + 4x²·y′ − y³ − 3x·y²·y′ = 0
3. y′·(4x² − 3x·y²) = −3a·x² − 8xy + y³
4. **y′ = (y³ − 3a·x² − 8xy) / (4x² − 3x·y²)**

#### 16.2. Ejercicio b: 3x² + 6y³ − ln y = 0

1. 6x + 18y²·y′ = y′/y
2. y·(6x + 18y²·y′) = y′
3. 6xy + 18y³·y′ = y′
4. 18y³·y′ − y′ = −6xy
5. y′·(18y³ − 1) = −6xy
6. **y′ = −6xy / (18y³ − 1)**

#### 16.3. Ejercicio c: y² − 3e^(−x) + ln y = ln(3x + 1)

1. 2y·y′ − 3e^(−x)·(−1) + y′/y = 3/(3x+1)
2. y′·(2y + 1/y) = 3/(3x+1) − 3e^(−x)
3. **y′ = [ 3/(3x+1) − 3e^(−x) ] / (2y + 1/y)**

#### 16.4. Ejercicio d: √(y² − 1) + 3xy + √(3x − 2) = 0

1. Reescrita: (y²−1)^(1/2) + 3xy + (3x−2)^(1/2) = 0
2. (1/2)(y²−1)^(−1/2)·2y·y′ + 3y + 3x·y′ + (1/2)(3x−2)^(−1/2)·3 = 0
3. **y′·[ y·(y²−1)^(−1/2) + 3x ] = −3y − (1/2)·(3x−2)^(−1/2)·3**

---

### Clase 17 · Derivadas sucesivas y demostración
*(Tanda 4 · foto 4)*

#### 17.1. Notación de las derivadas sucesivas

| Orden | Notaciones |
| :--- | :--- |
| Primera derivada | y′ · f′(x) · dy/dx |
| Segunda derivada | y″ · f″(x) · d²y/dx² |
| Tercera derivada | y‴ · f‴(x) · d³y/dx³ |
| n-ésima derivada | dⁿy/dxⁿ |

#### 17.2. Resumen de la unidad (nota al margen del cuaderno)

1. Derivada por definición
2. Regla de derivación
3. Derivación implícita
4. Derivada sucesiva
5. Resolución de problemas (economía)

#### 17.3. Demostración: dada y = A·eˣ + B·e^(x/2), demostrar que 2y″ − 3y′ + y = 0

- **Derivadas:**
  - y = A·eˣ + B·e^(x/2)
  - y′ = A·eˣ + (1/2)·B·e^(x/2)
  - y″ = A·eˣ + (1/4)·B·e^(x/2)
- **"Ahora:" sustituyendo en 2y″ − 3y′ + y:**
  - 2·(A·eˣ + (1/4)·B·e^(x/2)) − 3·(A·eˣ + (1/2)·B·e^(x/2)) + A·eˣ + B·e^(x/2) = 0
  - 2A·eˣ + (1/2)·B·e^(x/2) − 3A·eˣ − (3/2)·B·e^(x/2) + A·eˣ + B·e^(x/2) = 0
  - A·eˣ·(2 − 3 + 1) + B·e^(x/2)·(1/2 − 3/2 + 1) = 0
  - A·eˣ·(0) + B·e^(x/2)·(0) = 0 ✔ **QED**

---

## 🔍 Fe de erratas y observaciones

1. **Clase 1 (Tanda 1):** el coeficiente del ejemplo se lee ambiguo en el cuaderno; por coherencia con y₁ = √13 ≈ 3.60 y y₂ ≈ 3.65, la función es F(x) = √(3x² + 1).
2. **Clase 4 (Tanda 1):** C(5.25) = 100·27.5625 + 1300·5.25 + 1000 = 2756.25 + 6825 + 1000 = **10581.25** ⇒ ΔC = **581.25**. En el cuaderno figura 10256.25 (error probable: usar 1300·5 = 6500 en vez de 1300·5.25 = 6825).
3. **Clase 5 (Tanda 1):** n = log(1.5)/log(1.06) ≈ 6.96 (el cuaderno anota 6.93; con 0.176/0.025 daría 7.04). El redondeo final n ≈ 7 es correcto.
4. **Tanda 2:** sin observaciones; todos los procedimientos por definición coinciden con la tabla de derivadas. ✔
5. **Clase 12 (Tanda 3):** el recuadro naranja está rotulado "Z(x) = −5/[2(√(5x+3))³]", pero corresponde a **Z′(x)** (es la derivada, no la función).
6. **Clase 13 (Tanda 3):** el resultado del recuadro puede simplificarse sacando factor 2: h′(x) = (x² − x − 3)/((x²+3)(2x−1)). No es error, solo una forma más reducida.
7. **Tanda 3:** resto de resultados verificados y correctos (cociente, producto, cadena, exponencial y logaritmo). ✔
8. **Clase 15, ejercicio f (Tanda 4):** la línea final del cuaderno tiene denominadores tachados y se lee ambigua; la expresión correcta conserva el factor **(x+2)** multiplicando el primer corchete, tal como aparece en el paso y′/y.
9. **Clase 16 (Tanda 4):** letra difícil en algunos trazos; la transcripción se ajustó para que cada procedimiento sea internamente coherente: en **a)** el primer término se lee como a·x³ (constante a; si en tu cuaderno fuera 10x³, sustituye 3a·x² por 30x²); en **b)** la ecuación se reconstruyó como 3x² + 6y³ − ln y = 0 a partir de los pasos (6x + 18y²y′ = y′/y, etc.).
10. **Tanda 4:** derivación logarítmica (e), implícitas c) y d) y la demostración de sucesivas verificadas y correctas. ✔

---

## 🏁 Cierre del documento

- **Tandas procesadas:** 4 de 4 (19 fotos en total).
- **Clases registradas:** 17.
- **Temas cubiertos:**
  1. Variación e incremento de una función.
  2. Modelos matemáticos en economía (ingreso, costo, beneficio, equilibrio, interés compuesto).
  3. La derivada: definición, interpretación geométrica y derivadas marginales.
  4. Reglas de derivación y técnicas avanzadas (cociente, producto, cadena, exponencial, logaritmo, derivación logarítmica, implícita y sucesivas).
- **Pendientes declarados en el cuaderno sin resolver:** ejercicios a–d de la Clase 15.3 (podrían resolverse en una próxima sesión).

> *Fin del registro. ¡Buen estudio!* 🎓