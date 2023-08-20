# Math modul
Beépített modul matematikai számításokra. 
```python
import math
```

## Konstansok
```python
import math

print(math.e) # Euler szám értéke
print(math.pi) # PI értéke radiánban
print(math.inf) # Végtelen érték jelölése
print(math.nan) # Hiányzó adat jelölése
```
```
2.718281828459045
3.141592653589793
inf
nan
```

## Trigonometrikus függvények
Átváltás fokból radiánba és vissza.
```python
import math

print(math.radians(90))
print(math.degrees(3.14))
print(math.degrees(math.pi))
```
```
1.5707963267948966
179.9087476710785
180.0
```
A beépített trigonometrikus függvények radiánnal számolnak.
```python
import math

print(math.sin(1))
print(math.cos(1))
print(math.tan(1))
```
```
0.8414709848078965
0.5403023058681398
1.5574077246549023
```
Elérhetők még az egyes trigonometrikus függvények inverzei (latinul *arcus*) is.
```python
import math

print(math.acos(1))
print(math.degrees(math.asin(1)))
```
```
0.0
90.0
```

## Kombinatorikai függvények
Faktoriális
```python
import math

print(math.factorial(5))
```
```
120
```
Permutáció
$$\dfrac {n!}{(n-k)!}$$
```python
import math

print(math.perm(3, 2))
print(math.factorial(3)/math.factorial(3-2))
```
```
6
6.0
```
Kombináció
$${n \choose k} = \dfrac {n!}{k!(n-k)!}$$
```python
import math

print(math.comb(7, 5))
print(math.factorial(7)/(math.factorial(5)*math.factorial(7-5)))
```
```
21
21.0
```
## Egyéb funkciók
Összeg
```python
import math

print(math.fsum([1, 2, 3, 4]))
```
```
10.0
```

Abszolút érték
```python
import math

print(math.fabs(8))
print(math.fabs(-8))
```
```
8.0
8.0
```
ceil = plafon (egy számot a legközelebbi nála nagyobb egészre kerekít)
floor = padló (egy számot a legközelebb nála kisebb egészre kerekít)
```python
import math

print(math.ceil(7.6))
print(math.floor(-7.6))
```
```
8
-8
```

Euklideszi távolság kiszámítása. A bemenő paraméterek olyan számokból álló listák, melyek két egyforma dimenziójú vektort reprezentálnak.
```python
import math

print(math.dist([1, 0], [0, 0]))
```
```
1.0
```
Hatványozás és gyökvonás. Utóbbi csak a négyzetgyök esetén működik, másfajta gyökvonás esetén a negatív kitevőjű hatványozást kell alkalmazni.
Az Euler szám hatványát egyszerűsített módon is lehet számolni.
```python
import math

print(math.pow(2, 3))
print(math.sqrt(4))

print(math.exp(2))
print(math.pow(math.e, 2))
```
```
8.0
2.0
7.38905609893065
7.3890560989306495
```
A logaritmus függvények terén limitáltabbak a lehetőségek. Az alábbi természetes, kettes és tízes alapú logaritmus függvények érhetők el. Tetszőleges alapú logaritmus függvény használatához már komplexebb modul betöltésére van szükség.
```python
import math

print(math.log(math.e))
print(math.log2(4))
print(math.log10(1000))
```
```
1.0
2.0
3.0
```
Osztási maradék
```python
import math

print(math.fmod(3, 2))
print(3 % 2)
```
```
1.0
1
```
Legnagyobb közös osztó (lnko) = Greatest Common Divisor (gcd)
```python
import math

print(math.gcd(39, 99))
```
```
3
```
Végtelen érték ellenőrzése: `True`, ha a paraméterként átadott érték végtelen, egyébként `False`
```python
import math

print(math.isinf(5))
print(math.isinf(math.inf))
```
```
False
True
```
## Random
Véletlenszerű számok generálására használt modul. Egész szám pszeudo-véletlen generálása _randint(a, b)_ függvénnyel történik, ahol az _a_ az alsó korlát, a _b_ a felső. 
```python
import random

random.randint(0, 10)
```
Pszeudo-véletlen tört szám generálása, ahol az x output: 0<= x < 1
[Itt egy érdekes példa a témához](https://www.youtube.com/watch?v=1cUUfMeOijg)
```python
import random

random.random()
```
Amennyiben reprodukálni szeretnénk a random függvények által generált output-ot, a _seed(x)_ parancsot kell egy tetszőleges egész számmal meghívni.
```python
import random
random.seed(0)
random.random()
```

# Feladatok
1. Írj egy függvényt, amely paraméterként megkapja egy derékszögű háromszög 2 befogóját és egy listában visszaadja az átfogójának hosszát, valamint a maradék 2 szögének nagyságát! https://www.mathsisfun.com/sine-cosine-tangent.html
2. Írj egy függvényt, amelynek bejövő paramétere egy tetszőleges hosszúságú egész számokból álló lista. A függvény a kapott list növekvő sorba rendezi, majd generál egy 0 és 1 közötti véletlen számot, amelynek a százszorosa szerinti percentilis értékig adja vissza a tömböt. Példa: a paraméterként átadott lista: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], a generált véletlen szám: 0,33, akkor a visszaadott lista [1, 2, 3, 4] https://en.wikipedia.org/wiki/Percentile