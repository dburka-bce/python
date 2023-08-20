# Változók

A változók a programok adattárolásra alkalmas egységei. Tekinthetünk rájuk egyfajta tároló dobozként, melybe bármikor beletehetjük az adatainkat, és szükség esetén vissza is tudjuk nyerni azokat eredeti formájukban.  Az adatok valójában a számítógép memóriájában vannak, és a változók csak a megfelelő memóriacímre mutatnak.

## Python változók

Más programozási nyelvektől eltérően a Python nem rendelkezik paranccsal a változók deklarálására. A változó akkor jön létre, amikor első alkalommal rendelünk hozzá értéket.
``` python
x = 1
x = "Corvinus"
print(x)
```
```
Corvinus
```
A karakterláncokat aposztróffal vagy dupla idézőjelekkel határolva deklarálhatjuk. A kettő között nincs különbség. 
``` python
x = "Corvinus"
y = 'Corvinus'
```

Értékadás során felhasználhatjuk más változók értékét, sőt még magát az aktuális változót is.
``` python
x = 1
y = 2
x = x + y + 1
print(x)
```
```
4
```
A változó önmagával való összefűzése rövidítve is írható a += operátor segítségével:
``` python
uzenet = "Hello "
uzenet += "World!"
print(uzenet)
```
```
Hello World!
```

## Változónevek

A változónak lehet rövid neve (például x és y) vagy leíróbb neve (életkor, autónév, teljes_tömeg). A Python változókra vonatkozó szabályok:

- A változó nevének betűvel vagy az _ karakterrel kell kezdődnie
- A változó neve nem kezdődhet számmal
- A változó neve csak alfanumerikus karaktereket és aláhúzást tartalmazhat ([A-z], [0-9] és [_])
- A változónevek **kis- és nagybetűkre érzékenyek** (az `életkor`, az `Életkor` és az `eletkor` három különféle változó)
- A Python 3 lehetővé teszi számos *unicode* szimbólum használatát a változónevekben.
- A változónév nem lehet a programnyelv számára fenntartott kifejezés (pl.: létező metódus vagy osztály neve)

  
``` python
π = 3.14159
jalapeño = "Hot pepper"
```

Az egyik leggyakoribb hiba, amit a fejlesztők elkövetnek, az egyes változónevek elgépelése. Ha emiatt futtatáskor egy nem létező változóra hivatkozunk, akkor megakad a program futása és értesítést kapunk a kimeneten.
``` python
message = "Hello World!"
print(mesage)
```
``` 
NameError                                 Traceback (most recent call last)
<ipython-input-2-3d312a569420> in <module>
 1 message = "Hello World!"
----> 2  print(mesage)

NameError: name 'mesage' is not defined
```
A kimenetből jól látható, hogy a probléma a <code>mesage</code> változó hiánya, és a program a 2. kódsor futtatása során akadt meg.
A <code>&lt;ipython-input-2-3d312a569420&gt;in&lt;module&gt;</code> szövegrész a <a href="https://mybinder.org/v2/gh/ipython/ipython-in-depth/master?filepath=binder/Index.ipynb">Jupyter</a> online eszközének egyedi azonosítója. Nincs jelentősége a hibaüzenet szempontjából.

Ilyen esetben könnyű javítani a hibát, de ha az elgépelés miatt véletlenül egy másik, létező változó nevét adjuk meg, akkor igen hosszú ideig is eltarthat, mire megtaláljuk a hiba forrását egy hosszabb kódrészletben. Ezért érdemes mindig körültekintően kezelni a változóneveket.

## Változóelnevezési konvenciók

Az elnevezési konvenciók szintaktikailag nem kötelező érvényűek, de érdemes betartani őket.

- A globális változóknak mind kisbetűsnek kell lenniük (egyenlőre csak globális változókkal dolgozunk)
- A globális változó nevében szereplő szavakat aláhúzással kell elválasztani

Általános érvényű szabályok:

- Kerüld a túl általános vagy túl összetett szavak használatát. Meg kell találni az egyensúlyt.
- Rossz: adat_szerkezet, my_list, info_map, dictionary_for_the_purpose_of_storing_data_representing_word_definitions
- A CamelCase nevek használatakor nagybetűket kell használni egy rövidítésben (pl. HTTPServer)

# A Python beépített adattípusai

A változók különféle típusú adatokat tárolhatnak, a különféle típusokkal pedig különféle műveletek végezhetők.
A Python alapértelmezés szerint a következő beépített adattípusokkal rendelkezik ezekben a kategóriákban:

| | |
|-|-|
[Karakterlánc (szöveg)](/python_basic/variables_text/)|str
[Numerikus típusok](/python_basic/variables_numeric/)|int, float, complex
[Logikai típus](/python_basic/variables_bool/)|bool
[Szekvencia típusok](/python_basic/sequence_types/)|[list](/python_basic/list/), [tuple](/python_basic/tuple/), [range](/python_basic/range)
Szótár|dict
Halmaz|set,frozenset
Bináris típusok|bytes, bytearray, memoryview

A változók típusát nem kell megadni, sőt még meg is változtathatjuk - a deklarációt követően is -a típust. A `type` függvény segítségével lekérhető egy adott változó aktuális adattípusa.

``` python
x = 1
print(type(x))
print(x)

x = "Corvinus"
print(type(x))
print(x)
```
```
<class 'int'>
1
<class 'str'>
Corvinus
```
