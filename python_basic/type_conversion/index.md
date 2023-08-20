
# Típuskonverzió
Nem véletlen, hogy az adatainkat különböző típusú változókban tároljuk. Az egyes adattípusokkal végezhető műveletek halmaza jelentősen eltérhet. Nyilván nem ugyanúgy használunk fel egy szövegrészletet, mint egy számot. Gyakran felmerül azonban, hogy nem olyan formában áll rendelkezésünkre az adat, mint ahogy használni szeretnénk. Például lehet, hogy egész számként akarjuk kezelni egy osztás eredményét (ami automatikusan `float` lesz), vagy egy szöveges fájlból beolvasott számértékét szeretnénk egy összeadásban felhasználni.

Az `int()`, `float()` és `complex()` metódusokkal el lehet végezni a [numerikus típusokra](/python_basic/variables_numeric/) történő konverziót. Ezekkel a metódusokkal bármilyen adattípusról áttérhetünk a függvény nevével megegyező típusra.

``` python
s = "3.14"
f = float(s) # szöveg konvertálása lebegőpontos számmá
i = int(f) # lebegőpontos szám konvertálása egész számmá

print(type(s), s)
print(type(f), f)
print(type(i), i)
```
```
<class 'str'> 3.14
<class 'float'> 3.14
<class 'int'> 3
```
A típuskonverzió természetesen nem minden esetben lehetséges. Ilyenkor hibaüzenetet kapunk.
``` python
s = "3.14"
i = int(s)
```
```
ValueError                                Traceback (most recent call last)
<ipython-input-4-a3e5d7384f95> in <module>
 1 s = "3.14"
----> 2  i = int(s)

ValueError: invalid literal for int() with base 10: '3.14'
```

Az `str()` függvény szöveggé alakítja a többi adattípust. Minden adattípusnak van valamilyen szöveges reprezentációja, ezért ebben az esetben kevésbé kell figyelni a bemenetre.
```python
i1 = 5
i2 = 10
s1 = str(i1)
s2 = str(i2)

print(i1 + i2)
print(s1 + s2)
```
```
15
510
```
Az előző példában azonban, ha az egyik `int` típusú mezőt próbálnánk összeadni az egyik `str` típusúval, akkor azonnal hibát kapnánk. A `+` jellel történő szöveg összefűzés helyett valamelyik [szöveg formázási függvényt](/python_basic/variables_text/) alkalmazva elkerülhető ez a hiba. Ezek a függvények ugyanis automatikusan alkalmazzák az `str()` függvényt a bemeneti paramétereiken.
