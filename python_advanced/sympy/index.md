# SymPy
A [SymPy](https://sympy.org) egy ingyenes Python modul szimbolikus számítások elvégzésére.

Telepítése: _pip install sympy_
```python
import sympy
```

A SymPy a hagyományos numerikus megközelítés helyett az eredeti változókkal számolja végig az utasításokat, és a megfelelő egyszerűsített formát adja eredményül.
```python
import sympy

sympy.sqrt(8)
```
$2\sqrt2$

A szimbólumok segítségével definiálhatunk kifejezéseket. A változóba mentett kifejezések tovább bővíthetők újabb értékekkel vagy más kifejezésekkel is.
```python
from sympy import symbols

x, y = symbols('x y')
expr = x + 2 * y

print(expr)
print(expr + 1)
print(expr - x)
print(x * expr)
```
```
x + 2*y
x + 2*y + 1
2*y
x*(x + 2*y)
```

A kifejezések az `expand` függvény segítségével hozhatók a legegyszerűbb alakra.
```python
from sympy import symbols, expand

x, y = symbols('x y')
expr = x * (x + 2 * y)

expand(expr)
```
$x^2 + 2xy$
> Emlékeztető: a dupla csillag a hatványozás jele. 

Ezzel szemben a `factor` függvény a közös elemeket emeli ki. 
```python
from sympy import symbols, factor

x, y = symbols('x y')
expr = x ** 2 + 2 * x * y

factor(expr)
```
$x(x+2y)$

A `diff` a megadott kifejezés deriváltját, az `integrate` pedig az integrálját adja eredményül. A deriválás esetén opcionális annak megadása, hogy melyik szimbólum mentén végezzük a műveletet, az integrálás esetén viszont kötelező. Az integrálás esetén a szimbólum megadása mellett megadható még egy intervallum is. Ilyenkor az eredmény az eredeti függvény adott intervalluma alá eső terület (ami az integrálba történő megfelelő behelyettesítéssel áll elő).
```python
from sympy import *

x, y = symbols('x y')

display(diff(sin(x)))
display(diff(sin(x)*exp(x), x))
display(integrate(exp(x)*sin(x) + exp(x)*cos(x), x))
display(integrate(sin(x**2), (x, -oo, oo)))
```
$cos(x)$
$e^xsin(x) + e^xcos(x)$
$e^xsin(x)$
$\dfrac{\sqrt{2}\sqrt{\pi}}{2}$
> A `display` parancs hasonló a `print`-hez, de nem feltétlenül konvertál szöveggé, így jupyter-ben megmarad kifejezések formázása.
> A "oo" jelölés értelemszerűen a végtelent jelöli

Hasonlóan működik a határérték számítása is. 
$\lim_{x\to0} \dfrac{sin(x)}{x}$
$\lim_{x\to\infty} \dfrac{sin(x)}{x}$

A fenti határértékek meghatározása az alábbi kóddal történik:
```python
from sympy import *

x = symbols('x')

print(limit(sin(x)/x, x, 0))
print(limit(sin(x)/x, x, oo))
```
```
1
0
```
A `solve` két kifejezést vár paraméterként, és a kettő egyenlősége esetén próbálja megtalálni a szimbólumok lehetséges értékeit.
```python
from sympy import *

x = symbols('x')

print(solve(x**2-2, x))
```
```
[-sqrt(2), sqrt(2)]
```
