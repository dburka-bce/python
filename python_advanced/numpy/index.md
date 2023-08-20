# NumPy
A [NumPy](http://www.numpy.org) (numeric python) egy alap Python csomag, matematikai és tudományos számítások elvégzésére.
``` python
import numpy as np
```
## Tömbök
Numpy tömböket listákból lehet létrehozni, és az elemeikre a listákkal megegyező módon lehet hivatkozni.
``` python
import numpy as np

a = np.array([1, 2, 3])
print(type(a))
print(a)
print(a[1])
```
```
<class 'numpy.ndarray'>
[1 2 3]
2
```
A listákkal ellentétben azonban a tömbök több dimenziósak is lehetnek. Ebből adódóan a szokásos `len` paranccsal nem igazán lehetne meghatározni a méretüket. Helyette a `shape` függvény tartozik az adattípushoz, melynek segítségével az egyes dimenziók méretét kapjuk vissza egy `tuple`-ben. Az elemek lekérdezése is eltér: bár egymásba ágyazott listák segítségével állítjuk elő a több dimenziós tömböt, annak az elemeire már nem a listáknál megszokott `lista[i][j]` szintakszissal hivatkozunk, hanem egy pár zárójel között vesszővel elválasztva soroljuk fel az indexeket.
``` python
import numpy as np

b = np.array([[1, 2, 3], [4, 5, 6]])
print(b)
print(b.shape)
print(b[1, 2])
```
```
[[1 2 3]
 [4 5 6]]
(2, 3)
6
```
Az eltérő indexelés oka, hogy a tömbök esetén létezik olyan megkötés, ami a listáknál nem. Mégpedig az, hogy az egyes dimenziók mentén az elemek méretének meg kell egyeznie. A fenti egyszerű, két dimenziós példában ez azt jelenti, hogy mindkét sorban 3 és minden oszlopban 2 elem kell, hogy legyen. Ellenkező esetben egy hosszú hibajelzést kapunk eredményül. (Az üzenet egyébként csak arra figyelmeztet, hogy ez a megközelítés már elavult, és ilyen esetben másképp kell eljárni.)
``` python
import numpy as np

b = np.array([[1, 2, 3], [4, 5]])
```
```
<ipython-input-41-ca69b995a7b8>:3: VisibleDeprecationWarning: Creating an ndarray from ragged nested sequences (which is a list-or-tuple of lists-or-tuples-or ndarrays with different lengths or shapes) is deprecated. If you meant to do this, you must specify 'dtype=object' when creating the ndarray.
  b = np.array([[1, 2, 3], [4, 5]])
```
Gyakran nem akarunk már feltöltött tömböket használni, de jobb nem egy üres tömbbel indítani a számításokat. A tömböt alapértelmezetten feltölthetjük egy adott értékkel (a nullával és eggyel való feltöltésnek külön függvénye is van), kitölthetjük egy n dimenziós egységvektornak megfelelő értékekkel, vagy akár 0 és 1 közé eső véletlen számokkal is. Az új tömb méretét legtöbb esetben egy `tuple` formájában kell megadni kivéve, ha egy dimenziós a tömb, vagy ha egység vektort/mátrixot akarunk építeni. Utóbbi esetben minden dimenzió méretének meg kell egyezni, ezért elég egy számot megadni.
 ``` python
import numpy as np

print("Csupa 7")
print(np.full((3, 3), 3))
print("Csupa 0")
print(np.zeros((3, 3)))
print("Csupa 1")
print(np.ones((3, 3)))
print("Egység mátrix")
print(np.eye(3))
print("Csupa véletlen")
print(np.random.random((3, 3)))
```
```
Csupa 7
[[3 3 3]
 [3 3 3]
 [3 3 3]]
Csupa 0
[[0. 0. 0.]
 [0. 0. 0.]
 [0. 0. 0.]]
Csupa 1
[[1. 1. 1.]
 [1. 1. 1.]
 [1. 1. 1.]]
Egység mátrix
[[1. 0. 0.]
 [0. 1. 0.]
 [0. 0. 1.]]
Csupa véletlen
[[0.74032554 0.9008071  0.98328793]
 [0.88390137 0.88951462 0.10827427]
 [0.87114709 0.42487741 0.04573846]]
```
## Indexelés és szeletelés (slicing)
Az előzőekben láthattuk, hogy többdimenziós tömbök esetén vesszővel elválasztott indexeket kell használni. Azonban a listáknál is lehetőség volt egyszerre több értéké lekérni. Amennyiben minden index helyére egyforma méretű egészekből álló szekvenciát írunk, akkor azok alapján a méretüknek megfelelő számú értéket kérdezhetünk le a tömbből. Az első lekérdezett érték a szekvenciák első indexeiből összeállított indexű eleme, a második a szekvenciák második eleméből áll elő, és így tovább.
``` python
import numpy as np

a = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])

print(a[[1, 2, 3], [0, 1, 2]])
print(a[1, 0])
print(a[2, 1])
print(a[3, 2])
```
```
[ 4  8 12]
4
8
12
```
A lekérdezéshez változók vagy függvények eredményeképp is előállíthatjuk a megfelelő szekvenciákat. Az alábbi példában az első szekvencia a `range` függvénnyel szinte megegyező funkcionalitású `np.arange` függvényt alkalmazza, tehát lényegében a [0, 1, 2, 3] indexekből álló lista az első index. A második pedig a `b` változóban tárolt vektor (egy dimenziós tömb).
``` python
import numpy as np

a = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])
b = np.array([0, 2, 0, 1])

print(a[np.arange(4), b])
```
```
[ 1  6  7 11]
```
De működnek a listák kapcsán megismert *slicing* megoldások is.
``` python
import numpy as np

a = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])

print(a)
print(a[:2, 1:3])
```
```
[[ 1  2  3  4]
 [ 5  6  7  8]
 [ 9 10 11 12]]
[[2 3]
 [6 7]]
```
# Boolean indexelés
Lehetséges egy Numpy tömböt egy méretében megegyező True/False értékekkel feltöltött tömbbel indexelni. A végeredmény egy 1 dimenziós tömb, amelynek elemei az indexelő tömbben True értékekkel megjelölt elemek.
``` python
import numpy as np

a = np.array([[1, 2], [3, 4], [5, 6]])
bool_idx = (a > 2)

print(bool_idx)
print(a[bool_idx])
```
```
[[False False]
 [ True  True]
 [ True  True]]
[3 4 5 6]
```
# Adattípusok
A NumPy tömbjei és a bennük található értékek a modul saját adattípusait használják a Python beépített típusai helyett. Ezek az adattípusok a `dtype` tulajdonság lekérdezésével tekinthetők meg vagy éppen kényszeríthetők ki a tömb létrehozásakor.
``` python
import numpy as np

x = np.array([1, 2])
y = np.array([1.0, 2.0])
z = np.array([1, 2], dtype=np.int64)

print(x.dtype)
print(y.dtype)
print(z.dtype)
```
```
int32
float64
int64
```
Az adattípusok végén a szám azt jelöli, hogy a memóriában hány bitet használ fel a rendszer egy érték tárolására. Az `int32` például 32 biten tárolja az értékeket. Ebből az első bit adja meg az előjelet, a többi pedig a kettes számrendszerben megadott értéket tárolja. $2^{31}=2 147 483 648$, tehát, mivel pozitív irányban a nullát is tárolni kell, az `int32` lehetséges értékei -2 147 483 648 és 2 147 483 647 között vannak.

Ezek nagyon nagy számok, de a Python korlátlan integer típusához képest elenyészőek. Az ilyen jellegű megkötések jelentősen javíthatják az nagy méretű vektorokkal végzett műveletek futási idejét, ezért ezek a Numpy alapértelmezett beállításai. De szükség esetén ezek a korlátozások feloldhatók.

# Matematikai műveletek
A tömbök közti alapműveletek a standard jelölésekkel, vagy a megfelelő NumPy függvénnyel végezhetők el.
``` python
import numpy as np

x = np.array([[1, 2], [3, 4]])
y = np.array([[5, 6], [7, 8]])

print("Összeadás")
print(x + y)
print(np.add(x, y))
print("\nKivonás")
print(x - y)
print(np.subtract(x, y))
print("\nSzorzat")
print(x * y)
print(np.multiply(x, y))
print("\nHányados")
print(x / y)
print(np.divide(x, y))
```
```
Összeadás
[[ 6  8]
 [10 12]]
[[ 6  8]
 [10 12]]

Kivonás
[[-4 -4]
 [-4 -4]]
[[-4 -4]
 [-4 -4]]

Szorzat
[[ 5 12]
 [21 32]]
[[ 5 12]
 [21 32]]

Hányados
[[0.2        0.33333333]
 [0.42857143 0.5       ]]
[[0.2        0.33333333]
 [0.42857143 0.5       ]]
```
A hányados meghatározása során vigyázni kell, hogy a nevezőben szereplő vektor elemei között ne legyen nulla. Ellenkező esetben az osztás eredménye végtelen (`np.inf`) lesz, és megjelenik egy figyelmeztetés az outputon.

Meghatározható még a négyzetgyök vagy akár két tömb skalárszorzata is.
``` python
import numpy as np

x = np.array([[1, 2], [3, 4]])
y = np.array([[5, 6], [7, 8]])

print("Gyökvonás")
print(np.sqrt(x))
print("\nSkalárszorzat")
print(x.dot(y))
print(np.dot(x, y))
```
```
Gyökvonás
[[1.         1.41421356]
 [1.73205081 2.        ]]

Skalárszorzat
[[19 22]
 [43 50]]
[[19 22]
 [43 50]]
```
Számos matematikai művelet és optimalizálási folyamat során is gyakran van szükség a tömbök transzponálására.
``` python
import numpy as np

x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

print("Eredeti")
print(x)
print("\nTranszponált")
print(x.T)
```
```
Eredeti
[[1 2 3]
 [4 5 6]
 [7 8 9]]

Transzponált
[[1 4 7]
 [2 5 8]
 [3 6 9]]
```
A tömbök többdimenziós jellege miatt az értékeik összeadása sem olyan triviális, mint egy lista elején. Összeadható az összes elem, de lehetőség van egy adott dimenzió mentén aggregálni az értékeket. Utóbbi esetben az eredmény egy az eredetinél eggyel kevesebb dimenzióval rendelkező tömb.
``` python
import numpy as np

x = np.array([[1, 2], [3, 4]])

print(np.sum(x))
print(np.sum(x, axis=0))
print(np.sum(x, axis=1))
```
```
10
[4 6]
[3 7]
```
# Broadcasting
Lehetőség van arra, hogy egy tömb megadott indexű elemeit egy másik tömb elemeivel felülírjuk vagy módosítsuk, akár abban az esetben is, ha a műveletben szereplő tömbök nem azonos méretűek.
``` python
import numpy as np

x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])
v = np.array([1, 0, 1])

y = np.empty_like(x)

for i in range(4):
    y[i, :] = x[i, :] + v
    
print(y)
```
Ebben az esetben az egyenlőség jobb oldalán álló 2 tömb ugyanolyan dimenziójú.
```
[[ 2  2  4]
 [ 5  5  7]
 [ 8  8 10]
 [11 11 13]]
```
A `np.empty_like(x)` létrehoz egy tömböt, ami pontosan olyan méretű, mint a paraméterként átadott tömb (ugyanez érhető el azzal, ha lekérdezzük a tömb `shape` tulajdonságát, és azt felhasználva generálunk egy új tömböt fix értékkel).

A fenti példában végigmegyünk az -- ekkor még üres -- `y` tömb sorain, és az `x` soraival töltjük fel, de úgy, hogy minden sorhoz hozzáadódik a `v` tömb értéke. Természetesen ez csak akkor működhet, ha minden műveletnél megfelelnek egymásnak a tömbök dimenziói.

```python
x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])  
x + np.array([1, 0, 1])  
```
 Ebben az esetben össze tudja adni, annak ellenére, hogy a két tömb dimenziója nem egyezik meg. Az x tömb 4x3-as, addig a másik 1x3-as.

Ez a művelet ekvivalens ezzel:
```python
x + np.array([[1, 0, 1], [1, 0, 1], [1, 0, 1], [1, 0, 1]])  
```
Viszont ez hibát fog dobni: 
```python
x + np.array([1, 0])
```

Abban az esetben, ha műveletekhez szükség lenne a dimenziók megváltoztatására: a `tile` és a `reshape` függvények lehetnek segítségünkre. Előbbi egy tömböt a megadott dimenziók mentén többször megismétel, így építve új tömböt. Utóbbi pedig egy tömböt átalakít a megadott dimenzióra úgy, hogy az értékeket megtartja, és eligazgatja az új helyekre. Természetesen a két tömb teljes elemszáma meg kell egyezzen.
``` python
import numpy as np

x = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]])
v = np.array([1, 0, 1])
    
print("Tile")
print(v)
print(np.tile(v, (4, 1)))
print("\nReshape")
print(x)
print(np.reshape(x+v, (2, 6)))
```
```
Tile
[1 0 1]
[[1 0 1]
 [1 0 1]
 [1 0 1]
 [1 0 1]]

Reshape
[[ 1  2  3]
 [ 4  5  6]
 [ 7  8  9]
 [10 11 12]]
[[ 2  2  4  5  5  7]
 [ 8  8 10 11 11 13]]
```

# Feladatok
1. Írj egy függvényt, amely első paraméterként átadott 2D tömbből kinyeri azokat az értékeket, amelyek a második 2D tömbben is megtalálhatóak!
2. Írj egy függvényt, amely visszaadja a paraméterként átadott lista maximumának indexét!
3. Írj egy függvényt, amely kiszámítja a paraméterként átadott n dimenziós Numpy tömbben található számok átlagát!
4. Írj egy függvényt, amely kiszámítja a paraméterként átadott percentilisét a szintén paraméterként átadott tömb értékeiből! ([https://hu.wikiqube.net/wiki/Percentile)!](https://hu.wikiqube.net/wiki/Percentile)!)

# Ajánlott irodalom
Mátrixaritmetika iránt érdeklődők számára. Nem képezi a tananyag részét, de a leckében alkalmazott példák megértéséhez hozzásegíthet.

[Puskás Csaba, Szabó Imre, Tallos Péter: LINEARIS ALGEBRA](https://mek.oszk.hu/00800/00860/00860.pdf) 
