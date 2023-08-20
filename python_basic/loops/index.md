# Ciklusok
A ciklusok olyan vezérlési szerkezetek, melyek lehetővé teszik, hogy a kód egyes részleteit az adott feltételeknek megfelelően egymás után többször futtassuk a kód duplikálása nélkül.

## `for` ciklus
A `for` ciklus (számlálós ciklus) egy adott [szekvencia típusú](/python_basic/sequence_types/) változó elemein halad végig, és minden elem esetén, azaz minden iteráció során futtatja a hatáskörébe tartozó kódrészletet.  A hatáskört az [elágazásokhoz](/python_basic/if_statement/)  hasonlóan a behúzás határozza meg.
```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_elem in lista:
    print(lista_elem)
print("\nEzek a gyümölcsök vannak a listámon")
```
```
alma
banán
cseresznye
dinnye

Ezek a gyümölcsök vannak a listámon
```
A `lista_elem` az úgynevezett "ciklusváltozó". Tetszőlegesen elnevezhetjük, de érdemes odafigyelni rá, nehogy egy már létező változó nevét adjuk meg. 

A futtatás során a következő történik:
 1. Létrejön a `lista`
 2. A `lista` első eleme (`lista[0]`) bekerül a `lista_elem` változóba
 3. Lefut a ciklus hatókörében, más néven ciklustörzsben található `print` metódus, ami kiírja `lista_elem` változó aktuális tartalmát, ami jelen példában az "alma"
 4. A ciklus a következő iterációba lép és most a `lista` második eleme (`lista[1]`) kerül be a `lista_elem` változóba, majd ezzel az új értékkel újra meghívódik a `print` metódus
 5. A 4. lépés megismétlődik a harmadik és a negyedik lista elemmel is
 6. A negyedik lista elem megjelenítése után újabb iteráció kezdődne, de elértük a lista végét, ezért nincs mivel felülírni a `lista_elem` változót, ezért kilépünk a ciklusból
 7. A ciklust követő sortól folytatjuk a kód futtatását, és kiírásra kerül a záró üzenet

A jelenlegi vagy a későbbi példák követését megkönnyítheti, ha lépésről lépésre látjuk az egyes változók tartalmának alakulását. A [pythontutor.com](live.html) eszköz segítségével a példákat ilyen formában is át lehet tekinteni. Ha valakinek még nincs rutinja a programkódok értelmezésében, akkor sokat segíthet a használata.

A [range](/python_basic/range/) metódus alkalmazásával számsorozatokon is végigmehetünk a `for` ciklus segítségével.
```python
print("Az első tíz négyzetszám:")
for i in range(1, 11):
    print(i ** 2)
```
```
Az első tíz négyzetszám:
1
4
9
16
25
36
49
64
81
100
```

Gyakran szükség van annak azonosítására, hogy a lista éppen hányadik eleménél tart a ciklus. Ezért érdemes lehet a lista elemei helyett annak indexein végigmenni, és a ciklus belsejében lekérdezni a lista megfelelő elemét.

```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_index in range(len(lista)):
    print(f"{lista_index + 1}. {lista[lista_index]}")
print("\nEzek a gyümölcsök vannak a listámon")
```
```
1. alma
2. banán
3. cseresznye
4. dinnye

Ezek a gyümölcsök vannak a listámon
```

Természetesen egynél több utasítás is szerepelhet a ciklustörzsben, és a `range` metódust is tetszőlegesen paraméterezhetjük. A következő példában a névsorban szereplő minden második hallgatót kihívunk felelni, és felszólítjuk a sorszámával megegyező számú feladat megoldására. A neveket kisbetűsen tároljuk, ezért a ciklustörzsben a megfelelő megjelenítésről is gondoskodnunk kell.

```python
lista = ["andris","betti","csilla","dani"]
for lista_index in range(0, len(lista), 2):
    print(f"{lista[lista_index].title()}, gyere ki a táblához felelni!")
    print(f"Kérlek old meg a(z) {lista_index + 1}. feladatot!\n")    
print("Mára nincs több felelő ...")
```
```
Andris, gyere ki a táblához felelni!
Kérlek old meg a(z) 1. feladatot!

Csilla, gyere ki a táblához felelni!
Kérlek old meg a(z) 3. feladatot!

Mára nincs több felelő ...
```

## `while` ciklus
A `while` ciklus nem egy szekvencián halad végig, hanem egy adott feltétel teljesüléséig ismétlődik. A szintaxisa nagyon hasonlít az egyszerű elágazáshoz. Ha a [logikai változó](/content/python_basic/if_statement) értéke az érték `True` akkor egyszer lefut a ciklustörzs, majd újra ellenőrzés és futtatás egészen addig, míg egyszer `False` lesz az érték.
```python
szamlalo = 0
while szamlalo < 5:
    print(szamlalo)
    szamlalo = szamlalo + 1
print("Kész")
```
```
0
1
2
3
4
Kész
```

A futtatás során a következő történik:
1. Létrehozunk egy `int` típusú változót `szamlalo` néven 0 értékkel.
2. Megvizsgáljuk a `szamlalo < 5` állítás értékét.
3. Mivel az állítás igaz (`True`) belépünk a ciklustörzsbe, és végrehajtjuk az utasításokat.
4. Kiírjuk a `szamlalo` aktuális értékét, ami ezen a ponton még 0.
5. Megnöveljük eggyel a `szamlalo` értékét.
6. Megismételjük a 2-5. pontokat még 4-szer, addig, amíg a `szamlalo` értéke eléri az 5-öt. Ekkor a `szamlalo < 5` állítás értéke már hamis (`False`), ezért hatodik alkalommal már nem lépünk be a ciklustörzsbe.
7. A ciklus utáni sorral folytatjuk a futtatást, és megjelenítjük a "Kész" üzenetet.

Hamar látható, hogy némi probléma merülhet fel abban az esetben, ha a ciklus feltételben szereplő értéket helytelenül vagy egyáltalán nem módosítjuk. Ebben az esetben egy végtelen ciklusba kerülünk. A `for` ciklus esetén is előfordulhat hasonló, ha a ciklustörzsben kezdjük el módosítani a listát, amin éppen végigmegyünk.

Szerencsére a legtöbb futtatókörnyezet képes jelezni az ilyen hibákat, és nem hagyja, hogy a programunk feleslegesen óriási erőforrásokat pazaroljon el. Ennek ellenére ajánlott odafigyelni ennek a problémának az elkerülésére.

A `while` ciklus egy úgynevezett elöltesztelős ciklus, azaz a ciklustörzs futtatása előtt ellenőrzi a feltételt, így lehet, hogy a tartalma egyszer sem fut le. Más nyelvekkel ellentétben a Pythonban nincs egy ennek megfelelő hátultesztelős szintaxis, de ettől még megvalósítható ez a funkció.
```python
feltetel = True # Alapértelmezetten igaz logikai változó
while feltetel:
    print("Ciklustörzs") # Ennek a helyére jön a ciklustörzs   
    feltetel = 0 > 5
```
```
Ciklustörzs
```
A példa utolsó sorában most egy mindig hamis állítás kerül a `feltetel`, hogy a struktúra átlátható legyen, de értelemszerűen, egy a ciklustörzsben állított változó alapján érdemes meghatározni az értékét. Látható azonban, hogy egy fixen hamis állítás esetén is lefutott a ciklustörzs legalább egyszer.

## `break`, `continue`
A ciklusok általában nem csak egy szöveg kiíratására szolgálnak, ennél sokkal komplexebb feladataik vannak. Gyakori, hogy nem akarunk minden iterációban műveleteket végrehajtani, vagy esetleg csak azok egy részére van szükségünk. Ilyenkor a ciklustörzsbe írt elágazásokkal kezelhetjük a különböző eseteket.
```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_elem in lista:
    if len(lista_elem) > 5:
        print(lista_elem)
```
```
cseresznye
dinnye
```
A fenti példában az 5 karakternél hosszabb szavakat írtuk ki a listából. Látható, hogy már egy ilyen rövid kódban is kétszeres behúzást kellett alkalmaznunk. Ha a `print` helyére egy több száz soros kódrészlet kerülne, akkor annak minden sorát feleslegesen kellene behúzni. Ez elkerülhető abban az esetben ha megfordítjuk a feltételt, és azt mondjuk a programnak, hogy a rövidebb szavak esetén ne csináljon semmit.
```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_elem in lista:
    if len(lista_elem) <= 5:
        continue
    print(lista_elem)
```
```
cseresznye
dinnye
```
A `continue` parancs ciklustörzsekben használható. A parancs kiadásakor azonnal megkezdjük a következő iterációt és ignoráljuk a ciklustörzs hátralevő részét. A példában ezzel azt értük el, hogy a `print` helyére tervezett több száz sor eggyel kevésbé lesz behúzva.

A ciklusokat gyakran használják listákban való keresésre (erről majd részletesebben is lesz szó). Ha kereséssel kapcsolatos feladatot kell megoldani, akkor találat esetén nincs értelme tovább iterálni. Például, ha az **első** 5 karakteres szöveget akarom kiíratni:
```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_elem in lista:
    if len(lista_elem) == 5:
        print(f"Megvan az 5 hosszú: {lista_elem}")
        break
    else:
        print("Ez nem az")
```
```
Ez nem az
Megvan az 5 hosszú: banán
```
A `break` kulcsszó alkalmazásával *kiugorhatunk* az aktuális ciklusból, és a ciklus utáni kódsorral folytathatjuk a futtatást. Az előző példából a `break`-et elhagyva feleslegesen átnézzük következő két elemet is, és még kétszer megjelenítjük az "Ez nem az" üzenetet. Milliós listák esetén ez rengeteg erőforrás pazarlást jelentene. 

A `continue`-val kapcsolatos példa alapján itt is javíthatunk a kódon:
```python
lista = ["alma","banán","cseresznye","dinnye"]
for lista_elem in lista:
    if len(lista_elem) != 5:
        print("Ez nem az")
        continue
    print(f"Megvan az 5 hosszú: {lista_elem}")
    break
```
```
Ez nem az
Megvan az 5 hosszú: banán
```
## Folyamatos adatbekérés
[Adatbekérés](/content/python_basic/input) során zavaró lehet, ha egy hibás bemenet esetén azonnal megáll a program, pedig ilyenkor a felhasználó nem kapott megoldást a problémájára. Egy `while` ciklus segítségével viszont addig ismételhetjük számára a kérdést, amíg nem sikerül elfogadható bemenetet megadnia.

```python
while True:
    x = input("Mondj egy számot és megmondom a négyzetét: ")
    if x.isnumeric():
        x = int(x)
        print(x ** 2)
        break
    else:
        print("Nem megfelelő bemenet!\nCsak numerikus érték adható meg.\n")
```
```
Mondj egy számot és megmondom a négyzetét: [tíz]
Nem megfelelő bemenet!
Csak numerikus érték adható meg.

Mondj egy számot és megmondom a négyzetét: [kilenc]
Nem megfelelő bemenet!
Csak numerikus érték adható meg.

Mondj egy számot és megmondom a négyzetét: [10]
100
```

# Ellenőrző kérdések, feladatok

1. Módosítsd az előző ("Folyamatos adatbekérés") példát úgy, hogy bemenetként a "quit" szót írva kilépjen a program!
2. Készítsünk függvénytáblát, amely 1-től 10-ig megjeleníti a számokat, négyzetüket és köbüket! A megjelenítés 3 oszlopos legyen.
3. Kérjük be egy tanuló jegyeit addig, amíg 0-t nem üt, majd számítsuk ki és jelenítsük meg a jegyek átlagát! Ha mindjárt az elején 0-t üt, akkor jelenjen meg egy üzenet: "Nincs rögzített osztályzat"
4. Készítsünk programot, amely addig kér be egy egész számot, amíg az 1 és 90 közé nem esik (a határokat is beleértve)
    - ha a szám nem megfelelő, akkor kérjük be újra
    - számoljuk és jelenítsük meg a próbálkozások számát is
    - ha 5-nél többször helytelen számot ad meg, akkor írjuk ki, hogy "Nincs több próbálkozási lehetőség!"
    - ha 1-5 lehetőség alatt jó számot ad meg, akkor írjuk ki: "Sikeres adatbevitel!"
5. Kérj be a felhasználótól egy karakterláncot, majd írd ki megfordítva ciklus segítségével! (Ne használd a *slice* indexelést a kettőspontokkal!)
6. Kérj be számokat a felhasználótól mindaddig, amíg nem a 42-t adja meg. 5 próbálkozásra van lehetősége, ha nem sikerül, írd ki, hogy sajnos nem sikerült. Ha eltalálja, írd ki, hogy „Gratulálok”.
7. Kérj be két számot a felhasználótól. Kérdezd meg tőle a szorzatukat. 3 próbálkozásra van lehetőség, ezután írd ki az eredményt. Ha eltalálja, írd ki, hogy „jó megoldás”, majd a program lépjen ki. Feltételezzük, hogy a felhasználó egész számokat ad meg.
8. Kérj be a felhasználótól egy n számot, majd írd ki a Fibonacci számsor első n elemét.
9. Kérj be a felhasználótól egy számot. Ciklus segítségével számítsd ki a faktoriálisát, majd írd ki a kimenetre!
10. Készítsünk programot, amely megadja az $a_n = (1+1/n)^n$ sorozat első 100 elemét!
