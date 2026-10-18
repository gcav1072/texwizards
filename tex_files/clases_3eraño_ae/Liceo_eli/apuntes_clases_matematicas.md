# 📝 Apuntes de Clase — Matemáticas (Aritmética)

**Colección de notas de clase organizadas por tema y fecha.**
Materia: Aritmética — Breve historia de los números, conjuntos numéricos, fracciones y operaciones.

---

## 1. Breve Historia de los Números
**Fecha: 22 de septiembre de 2026** — *Parte I: Aritmética*

### 1.1 Marcas de cuentas
- Se usan para resolver un ejercicio (ej.: contar con rayas: `|||| ||||` → 8).

### 1.2 Números babilonios
- **Número posicional:** método de representación numérica que está representado por un conjunto de caracteres, donde el valor de un carácter depende de su **posición**.

### 1.3 Números romanos
- Notación **sustractiva**: un numeral menor a la izquierda se resta del mayor.
  - Ejemplos: `II → IV` (no IIII), `VIII → IX` (no VIIII).

### 1.4 Números egipcios
- Sistema **aditivo** (los valores se suman, no dependen de la posición).

### 1.5 Números arábico-hindúes
- Números babilonios.
- Números arábigos (siglo XI).
- Legado moderno: el sistema arábico es el que usamos hoy.

### 1.6 Cuestionario — Historia de los números
1. ¿Qué importante hallazgo arqueológico está considerado como una de las evidencias más antiguas del uso de marcas numéricas?
2. ¿Qué característica distingue fundamentalmente al sistema numérico inventado por Babilonia?
3. ¿En qué legado moderno se observa aún la influencia del sistema sexagesimal?
4. ¿Cuál fue la principal limitación de la numeración romana para el cálculo aritmético?
5. ¿Cuál fue la causa histórica por la cual fue tan versátil la adaptación del sistema decimal?
6. ¿Qué crédito tuvo India durante el siglo VII en el desarrollo de la formación y los signos operativos?
7. ¿Cómo interpreta Brahmagupta la noción intuitiva de los números negativos?
8. ¿Qué importante centro cultural del imperio selyúcida sirvió de puente?

---

## 2. Conjuntos Numéricos — N y Z
**Fecha: 2 de octubre de 2026** — *Objetivo #1: Conjunto numérico que usamos hoy = Números naturales*

### 2.1 Conjunto de los Números Naturales (N)
$$N = \{0, 1, 2, 3, \dots\}$$

- **Números enteros, discretos, infinitos.**

### 2.2 Propiedades y Operaciones en N
**Suma:**
- Propiedad conmutativa: $a + b = b + a$
- Propiedad asociativa: $a + b + c = (a + b) + c$
- Elemento neutro: $a + 0 = a$

### 2.3 Conjunto de los Números Enteros (Z)
$$Z = \{\dots, -3, -2, -1, 0, 1, 2, 3, \dots\}$$

- Contiene a los naturales: $N \subset Z$
- Participaciones:
  - $Z^+ = N$
  - $Z^- = -N$
  - $Z^* = Z - \{0\}$

### 2.4 Propiedades y Operaciones en Z
- **Suma:** se repiten las propiedades de N, además:
  - $a + (-a) = a - a = 0$ (elemento inverso aditivo)
- **Producto:** $\forall a, b, c \in Z$
  - $a \cdot b = b \cdot a$ (conmutativa)
  - $a \cdot b \cdot c = (a \cdot b) \cdot c$ (asociativa)
  - $a \cdot 1 = a$ (elemento neutro)
  - $a \cdot 0 = 0$

> 💡 **Regla de signos del producto:** el producto es positivo cuando el número de factores negativos es **par**, y negativo cuando es **impar**. (- · - = + ; + · - = - ; etc.)

### 2.5 Números Racionales (Q)
$$Q = \left\{\frac{a}{b} \;\middle|\; a \in Z,\; b \in Z^*\right\}$$

- $a \rightarrow$ **numerador**, $b \rightarrow$ **denominador**
- Todos los números de Z son racionales.

### 2.6 Números decimales
| Tipo | Descripción |
|---|---|
| **Limitados** | Terminan (ej.: 0,5; 1,25) |
| **Ilimitados Periódicos** | Repiten un período (ej.: 0,333…) |
| **Ilimitados Periódicos Mixtos** | Combinan ambos |

---

## 3. Potenciación en Q
**Fecha: octubre 2026**

### 3.1 Definición
$$\left(\frac{a}{b}\right)^n = \frac{a^n}{b^n} = \underbrace{\frac{a}{b} \cdot \frac{a}{b} \cdots \frac{a}{b}}_{n \text{ veces}}, \quad n \in N \text{ y } n \ge 1$$

**Ejemplo:**
$$\left(\frac{2}{3}\right)^3 = \frac{2^3}{3^3} = \frac{8}{27}$$

### 3.2 Propiedades de la potenciación
| Propiedad | Expresión |
|---|---|
| Potencia cero | $\left(\frac{a}{b}\right)^0 = 1$ |
| Potencia uno | $\left(\frac{a}{b}\right)^1 = \frac{a}{b}$ |
| Producto de potencias (misma base) | $\left(\frac{a}{b}\right)^n \cdot \left(\frac{a}{b}\right)^m = \left(\frac{a}{b}\right)^{n+m}$ |
| Cociente de potencias (misma base) | $\frac{\left(\frac{a}{b}\right)^n}{\left(\frac{a}{b}\right)^m} = \left(\frac{a}{b}\right)^{n-m}$ |
| Potencia de una potencia | $\left[\left(\frac{a}{b}\right)^n\right]^m = \left(\frac{a}{b}\right)^{n \cdot m}$ |
| Potencia del inverso | $\left(\frac{a}{b}\right)^{-n} = \left(\frac{b}{a}\right)^n$ |

---

## 4. Operaciones en Q — Suma y Resta
**Fecha: 6 de octubre de 2026** — *Objetivo #1: Suma y Resta de fracciones*

### 4.1 Fracciones con igual denominador
$$\frac{a}{b} + \frac{c}{b} = \frac{a + c}{b}$$

**Ejemplo:**
$$\frac{3}{5} + \frac{1}{5} = \frac{4}{5}$$

### 4.2 Propiedades que se cumplen en Q
1. **Conmutativa**
2. **Asociativa**
3. **Elemento neutro:** $\frac{a}{b} + 0 = \frac{a}{b}$
4. **Elemento inverso (opuesto):** $\frac{a}{b} + \left(-\frac{a}{b}\right) = 0$

### 4.3 Ejemplo de suma y simplificación
$$\frac{2}{5} - \left(\frac{3}{4} + \frac{1}{4}\right) = \frac{2}{5} - \left(\frac{1}{3} + \frac{1}{2}\right)$$

- **m.c.m.** = $\{5, 3, 2\}$ → **30**

### 4.4 Ejemplo combinado (propio de clase)
$$= \frac{12 - (10 + 15) - \left[(30 \div 3) + 1(30 \div 2)\right]}{30} = \frac{12 - 25}{30} = \frac{-13}{30}$$

---

## 5. Producto y División de Fracciones

### 5.1 Producto
$$\frac{a}{b} \cdot \frac{c}{d} = \frac{a \cdot c}{b \cdot d}$$

**Ejemplo (multiplicar y simplificar):**
$$\frac{3}{5} \cdot \left(-\frac{1}{9}\right) = \frac{-3}{45} \div 3 = \frac{-1}{15} \quad \text{(o también } \frac{-3}{45} = -\frac{1}{15}\text{)}$$

### 5.2 División
$$\frac{a}{b} \div \frac{c}{d} = \frac{a \cdot d}{b \cdot c} = \frac{a \cdot d}{b \cdot c}$$

### 5.3 Ejemplo (resolver y simplificar)
$$\frac{4}{5} \div \frac{2}{15} = \frac{60}{10} = 6$$

---

## 6. Fracciones Generatrices
**Fecha: 9 de octubre de 2026**

> **Definición:** fracción generatriz de un decimal limitado: se coloca el número completo sin la coma en el **numerador** y la unidad seguida de tantos ceros como cifras decimales tenga en el **denominador**.

**Ejemplos:**
$$0,145 = \frac{145}{1000} = \frac{29}{200} \qquad 4,75 = \frac{475}{100} = \frac{83}{20}$$

### 6.1 Números decimales ilimitados periódicos puros
- Se coloca en el numerador: el número **sin la coma**, menos la parte entera.
- En el denominador: tantos **9** como cifras tenga el período.

**Ejemplos:**
$$1,3\overline{5} = \frac{135 - 13}{99} = \frac{122}{99} \qquad 13,\overline{9} = \frac{139 - 13}{9} = \frac{126}{9} \qquad 31,0\overline{36} = \frac{31036 - 310}{990} = \frac{30726}{990} \div 9 = \frac{4}{11}$$

### 6.2 Números decimales ilimitados periódicos mixtos
- Resta entre la cifra o cifras **hasta el último número que se forma hasta dicha parte periódica** y la parte no periódica, sobre tantos 9 como cifras periódicas y tantos 0 como cifras no periódicas.

*(Ver ejemplos de simplificación arriba: $31,0\overline{36} = \frac{31036-310}{990}$.)*

---

## 7. Fracción Irreducible
- Cuando numerador y denominador **no tienen divisores comunes**.

**Ejemplos:**
- a) $\frac{4}{5}$ → irreducible
- b) $\frac{1}{8} \rightarrow$ reducible: $\frac{1}{8}$ se simplifica a... *(verificar)*; reducida $= \frac{3}{4} = 0,75$ *(ejemplo de clase)*

### 7.1 Determina la fracción irreducible de cada fracción dada
- a) $\frac{33}{27} \div 3 = \frac{11}{9}$
- b) $\frac{22}{72} \div 2 = \frac{11}{36}$
- c) $\frac{42}{54} \div 3 = \frac{14}{18} \div 2 = \frac{7}{9}$

### 7.2 Verifica las expresiones decimales según las fracciones dadas
- a) $\frac{4}{3} = 1,\overline{3}$
- b) $\frac{5}{6} = 0,8\overline{3}$
- c) $\frac{1}{10} = 0,1$

---

## 8. Cuadro resumen — Jerarquía de conjuntos

```
N = {0, 1, 2, 3, ...}          ⊂  Z = {..., -2, -1, 0, 1, 2, ...}  ⊂  Q = {a/b : a∈Z, b∈Z*}
Naturales                        Enteros                                Racionales
(discretos, infinitos)           (+ neutro 0, inversos -a)              (incluye decimales)
```

---

> 📌 **Nota:** algunos pasos de los ejemplos manuscritos son difíciles de leer; se han transcrito fielmente los que son legibles. Recomendación: verificar las operaciones de simplificación con la calculadora.
