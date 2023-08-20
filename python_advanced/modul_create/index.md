# Modul létrehozása
Pythonban az alábbi módokon lehetséges modulokat írni:

-   **Python nyelven**
-   **C nyelven** megírni, majd futásidőben betölteni (pl: regex modul)
-   **Beépített** modulok, amelyeket az interpreter értelmez (pl: itertools)

Mindhárom esetben az import paranccsal importáljuk a modulokat.

Ha saját modult szeretnénk írni nincs másra szükségünk, mint egy .py kiterjesztésű file-ra, amely érvényes Python kódot tartalmaz.

**Elnevezési konvenciók**
- A csomagneveknek kisbetűsnek kell lenniük
- Ha több szóra van szükség, az aláhúzásnak elválasztania kell őket
- Általában inkább egy szóból álló nevet illik adni

```python
# module.py
a = "Not great, not terrible"
b = [1, 2, 3]

def c(p):
    print('A kapott paraméter: {:}'.format(p))

class d:
    pass
```
Ennek a modulnak a használata egy másik fájlban:
```python
import module
module.a, module.b
module.c('hello')
module.d
```
```
('Not great, not terrible', [1, 2, 3])
A kapott paraméter: hello
module.d
```
### A modul elemei
```python
dir(module)
```
```
['__builtins__',
 '__cached__',
 '__doc__',
 '__file__',
 '__loader__',
 '__name__',
 '__package__',
 '__spec__',
 'a',
 'b',
 'c',
 'd']
```
A `__name__` változó tartalmazza az aktuális modul nevét, de az adott modult közvetlenül a fájljából indítva (azaz nem modulként betöltve futtatjuk), akkor az értéke `__main__` lesz.

```python
# fact.py tartalma
# Futtatható standaloneként és modulként is.
def fact(n):
    return 1 if n == 1 else n * fact(n-1)

if (__name__ == '__main__'):
    import sys
    if len(sys.argv) > 1  and isinstance(sys.argv[1], (int)):
        print(fact(int(sys.argv[1])))
```
```python
from fact import fact
fact(6)
```

## Importálás útvonala
Az interpreter a betöltendő modulokat az alábbi sorrendben keresi:
-   az aktuális könyvtárban
-   A PYTHONPATH környezeti változóban megadott könyvtárakban (import os;os.getenv('PYTHONPATH'))
-   A Python telepítésekor beállított könyvtárak (import sys;sys.path)

Tehát saját modul használata esetén, érdemes ugyanabban a könyvtárban tárolni a moduljainkat, mint ahol a kódunk van.

## Modulok használata

Tegyük fel, hogy van két modulunk `egyik_modul.py` és `masik_modul.py` néven, az alábbi kódokkal:

egyik_modul.py:

``` python
def  udvozles(szoveg):
	print ("Hello %s" % szoveg)

udvozles("én vagyok az egyik modul")
```

masik_modul.py:
``` python
import egyik_modul

egyik_modul.udvozles("szép napot")
```
```
Hello, én vagyok az egyik modul
Hello, szép napot
```

- Az `masik_modul.py`-t futtatva megjelenik az "Helló, én vagyok a másik modul" üdvözlő szöveg. A `masik_modul.py`-ben használni szeretnénk az `egyik_modul.py`-ben definiált `udvozles()` függvényt.
- Az `egyik_modul.py`-t futtatva megjelenik mind a két üdvözlő szöveg, hiszen a `masik_modul.py`-ben lévő programkód is lefut.
- Érdemes megfigyelni, hogy az importált modulban lévő függvényeket és változókat csak úgy lehet elérni, ha a függvény- vagy változónév elé ponttal elválasztva odaírjuk a modul nevét.

Ha nem akarjuk minden alkalommal kiírni a teljes modulnevet, az `as` kulcsszó segítségével adhatunk rövidítést:

``` python
import egyik_modul as em

em.udvozles("Szép napot")
```

A gyakorlatban modulokban szereplő függvényekhez és osztályokhoz illik készíteni teszteseteket, azaz olyan programrészletet, amin keresztül ellenőrizhető, hogy a függvények és osztályok a kívánt módon működnek-e. A fenti egyszerű példában is kipróbáljuk, hogy működik-e az `udvozles()` függvény. Miközben a modult fejlesztjük, a modul futtatásakor azt szeretnénk, ha lefutnának ezek az ellenőrző kódok. Ha viszont a modult külső modulként importálja egy másik modul, az ellenőrző kódok lefutása zavaró. Az alábbi egyszerű trükkel dönthető el egy modulban, hogy az adott modullal indult-e a fordító:

 
``` python
def  udvozles(szoveg):
	print ("Hello, %s" % szoveg)

if  __name__ == "__main__":
	udvozles("én vagyok a másik modul")
```

## Feladatok

> Jupyter notebookból .py állományt menteni a `File/Download as/Python (.py)` menüpontban lehet. A megjelenő szabványos dialógusablakban azt a mappát érdemes választani, ahonnan majd a modult ki akarjuk próbálni. Itt majd létrehozunk egy új `ipynb` állományt, amelyben az `import sajatmodul` utasítás működni fog (ahol "sajatmodul" a mentett `.py` file neve).

1. Készíts egy modult `maximum.py` néven elmentve, mely tartalmaz egy `maximum` nevű függvényt. A függvénynek legyen három kötelező argumentuma: `maximum(a,b,c)` A függvény visszatérési értéke legyen az argumentumban megadott számok közül a legnagyobb!
2. `maximum.py`-ben Készíts teszteseteket, megyek igazolják, hogy a függvény megfelelően működik. A tesztesetek csak akkor fussanak le, ha a `maximum.py` került futtatása.
3. Készíts egy másik modult is, melyben hivatkozol a `maximum.py` modulra, és meghívod a benne lévő függvényt.
4. Írj egy modult, amely egy `Datumkezelo` osztályt tartalmaz. Az osztály konstruktorának 1 string paramétere van. A dátumot yyyy-mm-dd formátumban kell megadni. Legyen egy `megjelenit` függvénye, amely kiírja a példányhoz tartozó dátumot és legyen egy `hozzaad_nap` függvénye, amely paraméterként kapott napok számát hozzáadja a példányváltozóhoz. Példányosítsd az osztályt, add át neki a mai napot a kívánt formátumban, irasd ki példányváltozó tartalmát, adj hozzá 5 napot és ismételten irasd ki a példányváltozó tartalmát! Extra feladatként valósíts meg [hibakezelést](/python_advanced/error_handling): A konstruktor kezelje, ha nem megfelelő formátumban érkezik a dátum: ilyenkor dobjon hibát. Továbbá minden függvényben alkalmazz hibakezelést! 
5. Ez az extra feladat a Python [objetum-orientált képességeit](/python_advanced/oop/) használja ki. Készíts egy `Person` osztályt, amely a konstruktorában átadott `name` változót betölti egy példányváltozóba. Származtass belőle egy `Student` osztályt, amelynek legyen egy `add_grade` függvénye, amely a paraméterként kapott jegyet hozzáadja egy példányváltozó listához. Készíts egy `mean` függvényt, amely a beírt jegyekből átlagot számol. Kezeld le azt az esetet, amikor a `mean` függvényt a jegyek beírása előtt hívjuk meg!
