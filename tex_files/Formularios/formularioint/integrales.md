# Tabla de Integrales

## Integrales

1. $\int \dd x = x + C$
2. $\int a \dd x = ax + C$
3. $\int x^n \dd x = \frac{x^{n+1}}{n+1} + C$
4. $\int u^n \dd u = \frac{u^{n+1}}{n+1} + C$ \\ \textit{\scriptsize Siendo $n \neq -1$}
5. $\int (u \pm v \pm w) \dd x = \int u\dd x \pm \int v\dd x \pm \int w\dd x$
6. $\int \frac{\dd u}{u} = \ln|u| + C$
7. $\int a^u \dd u = \frac{a^u}{\ln a} + C$
8. $\int e^u \dd u = e^u + C$
9. $\int \text{Sen } u \dd u = -\text{Cos } u + C$
10. $\int \text{Cos } u \dd u = \text{Sen } u + C$
11. $\int \text{Tan } u \dd u = \ln|\text{Sec } u| + C$
12. $\int \text{Cot } u \dd u = \ln|\text{Sen } u| + C$
13. $\int \text{Sec } u \dd u = \ln|\text{Sec } u + \text{Tan } u| + C$
14. $\int \text{Csc } u \dd u = \ln|\text{Csc } u - \text{Cot } u| + C$
15. $\int \text{Sec}^2 u \dd u = \text{Tan } u + C$
16. $\int \text{Csc}^2 u \dd u = -\text{Cot } u + C$
17. $\int \text{Sec } u \text{Tan } u \dd u = \text{Sec } u + C$
18. $\int \text{Csc } u \text{Cot } u \dd u = -\text{Csc } u + C$
19. $\int \frac{\dd u}{u^2 + a^2} = \frac{1}{a} \text{Arc Tan } \frac{u}{a} + C$
20. $\int \frac{\dd u}{u^2 - a^2} = \frac{1}{2a} \ln\left|\frac{u-a}{u+a}\right| + C$
21. $\int \frac{\dd u}{a^2 - u^2} = \frac{1}{2a} \ln\left|\frac{a+u}{a-u}\right| + C$
22. $\int \sqrt{u^2 \pm a^2} \dd u = \frac{u}{2}\sqrt{u^2 \pm a^2} \pm \frac{a^2}{2}\ln|u + \sqrt{u^2 \pm a^2}| + C$
23. $\int \sqrt{a^2 - u^2} \dd u = \frac{u}{2}\sqrt{a^2 - u^2} + \frac{a^2}{2}\text{Arc Sen } \frac{u}{a} + C$
24. $\int \frac{\dd u}{\sqrt{a^2 - u^2}} = \text{Arc Sen } \frac{u}{a} + C$
25. $\int \frac{\dd u}{\sqrt{u^2 \pm a^2}} = \ln|u + \sqrt{u^2 \pm a^2}| + C$
26. $\int \frac{\dd u}{u\sqrt{u^2 - a^2}} = \frac{1}{a} \text{Arc Sec } \frac{u}{a} + C$
27. $\int \text{Sec}^3 u \dd u = \frac{1}{2}\text{Sec } u \cdot \text{Tan } u + \frac{1}{2}\ln|\text{Sec } u + \text{Tan } u| + C$

## Integración por partes
"**U**n **D**ía **V**i **U**na **V**aca sin cola $- \int$ **V**estida **d**e **u**niforme

$\int u \dd v = uv - \int v \dd u$

### Prioridad de elección de $u$ (ILATE)

- **I**nversas trigonométricas: $\text{Arc Sen } u, \text{Arc Cos } u, \text{Arc Tan } u, \dots$
- **L**ogarítmicas: $\ln u, \log u, \dots$
- **A**lgebraicas: $x^n, \sqrt{x}, \frac{1}{x}, \dots$
- **T**rigonométricas: $\text{Sen } u, \text{Cos } u, \text{Tan } u, \dots$
- **E**xponenciales: $e^u, a^u, \dots$