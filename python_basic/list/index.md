# List
A lista a legáltalánosabb módosítható szekvencia típus. Az elemei megváltoztathatók, felcserélhetők, bővíthetők vagy akár törölhetők is. Egy lista lehet például egy névjegyzék, egy számsorozat, de akár további listák gyűjteménye is.

## Listák létrehozása 
Lista létrehozható egyszerű értékadással, az elemek szögletes zárójelben, vesszővel elválasztva történő felsorolásával.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista)
```
```
['alma', 'banán', 'cseresznye', 'dinnye']
```
Üres listát kétféleképp is létre lehet hozni:
``` python
l1 = []
l2 = list()
print(type(l1))
print(type(l2))
```
```
<class 'list'> 
<class 'list'>
```

A lista tetszőleges típusú elemekből állhat, és a típusok vegyíthetők is.
``` python
lista = ["alma",13, False, 3.14]
```
Ennek megfelelően a listák egymásba is ágyazhatóak. Egy 3x3-as mátrix -- mint egy BKK jegy -- a következőképpen ábrázolható:
``` python
jegy = [[1,2,3],[4,5,6],[7,8,9]]
print(jegy)
```
```
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```
## Immutábilis műveletek
Az immutábilis műveletek szempontjából nincs lényeges különbség a szekvencia típusok között, ezért az alábbi fejezetek minden más típus esetén is ugyanígy működnek (beleértve ebbe a [karakterláncokat](/python_basic/variables_text/) is).

### Lista elemek lekérdezése
A lista egyes elemeit a sorrendben betöltött indexük (sorszámuk) segítségével tudjuk lekérdezni. A legtöbb programnyelvhez hasonlóan a listák Pythonban is nullától indexelnek. Tehát egy lista első elemét az alábbi módon lehet lekérdezni.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista[0])
```
```
alma
```
A `lista[0]` kódrészlet ebben a kontextusban úgy viselkedik, mint egy változó, ami a lista első elemét tartalmazza. Tehát elvégezhetők vele mindazon műveletek, amik az adott típusú változó esetén elérhetők. Az eredmény például nagybetűssé tehető a `lista[0].upper()` utasítással.

A lekérdezés során megadható tartomány is, de vigyázni kell arra, hogy a Python a tartományokat jobbról nyitottnak tekinti, ezért az utolsó elem nem fog belekerülni az eredménybe.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista[1:3])
```
```
['banán', 'cseresznye']
```
A lekérdezett tartomány bármelyik végét üresen hagyhatjuk. Ebben az esetben a megfelelő oldal végéig kérdezzük le az elemeket.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista[:3])
```
```
['alma', 'banán', 'cseresznye']
```
Amennyiben a tartomány mindkét végét elhagyjuk és egyszerűen csak egy kettőspontot adunk meg, akkor a lista összes elemét kérdezzük le. Fontos megjegyezni, hogy a lekérdezett tartományokban szereplő értékék a memóriában valójában az eredeti értékek másolatai. Ez azt jelenti, hogy ha a kettősponttal kérdezzük le a lista elemeit, és az eredményt egy változóba írjuk, akkor egy a lista másolatát kapjuk. Ezt szemlélteti az alábbi példa, melyben az eredeti lista egyik elemét megváltoztatva a korábban készített másolat tartalma nem változik.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista2 = lista[:]
lista[0] = "körte"

print(lista)
print(lista2)
```
```
['körte', 'banán', 'cseresznye', 'dinnye']
['alma', 'banán', 'cseresznye', 'dinnye']
```

A tömbök indexálására általánosan igaz, hogy ha negatív számot adunk meg, tömb végétől számolja az elemeket. A -1 az utolsó elemre hivatkozik, a -2 az utolsó előttire, és így tovább.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista[-1])
```
```
dinnye
```


Az `index` függvény segítségével pedig megtudható egy elem pozíciója a listában.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista.index("banán"))
```
```
1
```
A visszakapott számérték csak az elem első előfordulásának helyét adja meg. Tehát, ha több "banán" is szerepelne még a listában, akkor is 1 lenne az eredmény. Amennyiben viszont egyszer sem szerepel az elem a listában, hibaüzenetet kapunk.
```python
lista = ["alma","banán","cseresznye","dinnye"]
print(lista.index("körte"))
```
```
ValueError                                Traceback (most recent call last)
<ipython-input-1-be05b5c32494> in <module>
 1 lista = ["alma","banán","cseresznye","dinnye"]
----> 2  print(lista.index("körte"))

ValueError: 'körte' is not in list
```

### Lista elemeinek száma

A lista elemeinek száma a `len()` függvénnyel olvasható ki.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
print(len(lista))
```
```
4
```

### Listák összefűzése

A `+` operátor listákra alkalmazva összefűzésként értelmezendő.

``` python
lista = ["alma","banán"] + ["cseresznye","dinnye"]
print(lista)
```
```
['alma', 'banán', 'cseresznye', 'dinnye']
```
Az összefűzés során lényegében egy új, harmadik lista jön létre. Ezért működik ez a művelet immutábilis típusok esetén is.

### Keresés a listában
Az `in` kulcsszó segítségével leellenőrizhető, hogy egy lista tartalmazza-e a megadott értékét. A kulcsszó eredménye egy [logikai típusú érték](/python_basic/variables_bool/), így felhasználható például egy [elágazásban](/python_basic/if_statement/).

``` python
lista = ["alma","banán","cseresznye","dinnye"]
if "banán" in lista:
    print("Van banán")
else:
    print("Nincs banán")
```
```
Van banán
```
### Lista tartalom ellenőrzése
Az elágazás feltételébe egyszerűen a listát írva, arra tudunk ellenőrizni, hogy van-e elem a listában.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
if lista:
    print("Van elem a listában")
else:
    print("A lista üres")
```
```
Van elem a listában
```

## Mutábilis műveletek
Az ebben a részben leírt műveletek nem végezhetők el immutábilis típusok esetén, mert az elemek értékének vagy halmazának megváltozását eredményezik.

### Lista elemeinek módosítása
A lista egy módosítható szekvencia típus, ezért az egyes elemein értéke megváltoztatható. A lekérdezéshez hasonlóan hivatkozhatunk az egyes elemekre, és értéket adhatunk nekik. 
```python
lista = ["alma","banán","cseresznye","dinnye"]
lista[2] = "körte"
print(lista)
```
```
['alma', 'banán', 'körte', 'dinnye']
```
Egyszerre több elemnek is lehet értéket adni, de ilyenkor az új érték is szekvencia típusú kell, hogy legyen.
```python
lista = ["alma","banán","cseresznye","dinnye"]
lista[1:3] = ["körte", "narancs"]
print(lista)
```
```
['alma', 'körte', 'narancs', 'dinnye']
```

### Új elem beszúrása
Nem csak az elemek értékét, hanem azok halmazát is lehet módosítani. Az `append()` függvény a lista végére szúr be új elemet.
``` python
lista = ["alma","banán"]
lista.append("cseresznye")
lista.append("dinnye")
print(lista)
```
```
['alma', 'banán', 'cseresznye', 'dinnye']
```

Az `insert()` függvény segítségével pedig az adott pozícióba szúrható be egy elem.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista.insert(1, "*BANÁN*")
print(lista)
```
```
['alma', '*BANÁN*', 'cseresznye', 'dinnye']
```

### Elem törlése
A `del` kulcsszó a megadott indexen szereplő elemet távolítja el a listából.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
del lista[1]
print(lista)
```
```
['alma', 'cseresznye', 'dinnye']
```

A `pop()` metódus eltávolítja a megadott indexet -- vagy az utolsó elemet, ha az index nincs megadva.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista.pop()
print(lista)
```
```
['alma', 'banán', 'cseresznye']
```
A `pop` metódus nem csak szintaktikájában különbözik a `del`-től. Utóbbi a memóriából is törli az eltávolított értékét, a `pop` használata esetén azonban még eltárolható a törölt elem.

``` python
lista = ["alma","banán","cseresznye","dinnye"]
torolt_elem = lista.pop(1)
print(f"A törölt elem a(z) \"{torolt_elem}\"")
```
```
A törölt elem a "banán"
```

A `remove` metódus segítségével pedig érték alapján törölhetők az elemek. Csak az érték legelső előfordulása törlődik a listából.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista.remove("cseresznye")
print(lista)
```
```
['alma', 'banán', 'dinnye']
```

A `del` függvénnyel a teljes lista is törölhető a memóriából:
``` python
lista = ["alma","banán","cseresznye","dinnye"]
del lista
print(lista)
```
```
NameError                                 Traceback (most recent call last)
<ipython-input-2-5d9055aab6ba> in <module>
 1 lista = ["alma","banán","cseresznye","dinnye"]
 2 del lista
----> 3  print(lista)

NameError: name 'lista' is not defined
```

A `clear()` függvény viszont csak kiüríti a listát.
``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista.clear()
print(lista)
```
```
[]
```

### Listák sorbarendezése
A `sort()` metódus segítségével az adott változótípus természetes sorrendjébe rendezhetjük a listánk értékeit. Ez a természetes sorrend például szövegek esetén az ABC sorrend.
``` python
cars = ['Ford', 'Mitsubishi', 'BMW', 'VW']
cars.sort()
print(cars)
```
```
['BMW', 'Ford', 'Mitsubishi', 'VW']
```

A `reverse` logikai paraméter alkalmazásával a sorrend megfordítható.
``` python
cars = ['Ford', 'Mitsubishi', 'BMW', 'VW']
cars.sort(reverse=True)
print(cars)
```
```
['VW', 'Mitsubishi', 'Ford', 'BMW']
```

Abban az esetben, ha nincs alapértelmezett sorrendje az elemeinknek -- például, ha különböző adattípusú elemeket vegyítettünk a listában, akkor a `key` paraméter segítségével megadható egy függvény, ami az aktuális elemhez egy sorba rendezhető értéket rendel, és ekkor a `sort` ennek az értéknek megfelelően rendez.

A függvényekről azonban később lesz szó, csak a teljesség kedvéért került ide ez a kódrészlet!

Az alábbi példában a szöveg hossza szerint szeretnénk sorba rendezni, ABC sorrend helyett. Ehhez első lépésben létrehozunk egy függvényt `MyFunc` néven, ami visszaadja a paraméterként kapott érték hosszát. A lista `sort()`metódusa a lista minden elemére végrehajtja a `MyFunc` függvényt, és a függvény által visszaadott érték alapján rendezi sorba az elemeket.

``` python
# A function that returns the length of the value:
def  myFunc(e):
	return  len(e)

cars = ['Ford', 'Mitsubishi', 'BMW', 'VW']

cars.sort(reverse=True, key=myFunc)
print(cars)
```
```
['Mitsubishi', 'Ford', 'BMW', 'VW']
```

# Feladatok
Adott az alábbi lista:

``` python
lista = ["alma","banán","cseresznye","dinnye"]
``` 

1.  Írasd ki a lista elemeinek számát!
2.  Írasd ki utolsó elemét!
3.  Írasd ki első három elemét!
4.  Szúrd be a lista végére az "egres"-t!
5.  Szúrd be a lista elejére az "ananászt"-t!
6.  Töröld a listából a "banán"-t! Először keresd meg a "banán" pozícióját a listában, majd hajtsd végre a törlést!
7.  Írasd ki a lista elemeit fordított sorrendben!
8.  Mi történik, ha a lista egy még nem létező indexű elemének próbálunk értéket adni?
``` python
lista = ["alma","banán","cseresznye","dinnye"]
lista[100] = "avokádó"
```
