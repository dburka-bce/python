# Range
A `range` adattípus egész számok rendezett gyűjteménye. Leggyakrabban a [ciklus iterációk](/content/python_basic/loops) kapcsán szokás használni

## Range létrehozása
A `range`-eknek nincs a listához és a `tuple`-höz hasonló szintakszisa. A létrehozásához a `range()` függvényt kell használni.  A függvénynek három paramétere van, és az alábbi struktúrát követi:
``` python
range(start, stop, step)
```
paraméter|leírás
-|-
start|Opcionális. Egész szám, amely meghatározza a kezdő pozíciót. Alapértelmezett értéke 0.
stop|Kötelező. Egész szám, amely meghatározza a számsorozat utolsó elemét. Ez az elem már nem kerül bele!!! Másképpen: felülről nyílt az intervallum. 
step|Opcionális. Egész szám, amely meghatározza a növekményt. Alapértelmezett értéke 1.

A `range()` függvény a kezdőértéktől indulva a megadott lépésközzel növekvő számsorozatot ad vissza, és egy megadott számmal ér véget. 

``` python
x = range(3, 23, 4)
print(x)
print(list(x))
```
```
range(3, 20, 4)
[3, 7, 11, 15, 19]
```
  
Érdemes megfigyelni, hogy a `range()` argumentumaként megadott intervallum felülről nyitott, a példában a 23-as már nem kerül kiírásra. A `print` metódus hatására csak a `range` eredeti struktúrája jelenik meg. Ha kíváncsiak vagyunk a tartalmára, akkor a kiírás előtt át kell konvertálnunk listává.  Az egyes elemek azonban a hagyományos módon kérdezhetők le.
``` python
x = range(3, 23, 4)
print(x[2])
```
```
11
```

Amennyiben csak egyszerű számsorozatra van szükségünk, az opcionális paraméterek elhagyhatók.
``` python
x = range(8)
print(list(x))
```
```
[0, 1, 2, 3, 4, 5, 6, 7]
```
## Range műveletek
Más szekvencia típusokkal ellentétben a `range` szerkezete rendkívül kötött, hiszen egymástól adott "távolságra" eső elemei vannak, amik minden esetben érték sorrendben kell legyenek. Ezért értelemszerűen nem értelmezhető rá a `sort` metódus, és az esetek döntő többségében `+` jellel történő összefűzés eredménye sem felelne meg a `range` definíciójának, így ez a művelet sem érhető el.