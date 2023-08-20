# Feltételes elágazás

A programozás során gyakran felmerül, hogy meg kell vizsgálni bizonyos feltételeket és ezen feltételek függvényében kell az utasításokat végrehajtani. A programnyelvek számára ezeket a feltételeket eldöntendő állítások formájában kell megfogalmazni. Ezen állítások eredménye a [logikai adattípus (bool)](/python_basic/variables_bool/), melynek értéke Igaz (`True`) vagy Hamis (`False`) lehet.

## if
A feltételek függvényében történő elágaztatás a programkódok egyik alapvető vezérlési szerkezete. Az elágazásokat szinte minden programnyelv az `if` kulcsszó után írt állítás segítségével valósítja meg. Az ezt követő kódrészlet csak akkor fut le, ha az állítás igaz volt. A nyelvek között eltérés elsősorban a szintaktikában és az elágazás hatókörének -- vagyis az érintett kódsorok számának -- a meghatározásában van. A legtöbb nyelv (pl.: C, C#, JavaScript, Java) kapcsos zárójelekkel jelöli a hatókört, a Python azonban a behúzásra támaszkodik (szóköz vagy tab a sor elején, bár a legtöbb keretrendszer automatikusan 4 szóközt tesz be, még a tab lenyomásra is, figyelni kell rá, hogy a kettőt nem szabad keverni).  Ez kétségkívül tömörebb kódhoz vezet, de figyelni kell a kód szerkezetére. 
``` python
a = 7
b = 13
if b > a:
    print("b nagyobb, mint a")
```
```
b nagyobb, mint a
```

Rövid írásmód: ha csak egy végrehajtandó utasítás van, akkor ugyanabba a sorba tehetjük, mint az `if` utasítást.
``` python
a, b = 7, 13  #itt is lehet rövidíteni
if b > a: print("b nagyobb, mint a")
```
```
b nagyobb, mint a
```

Az `if` utáni részre egy olyan kódrészlet kell kerüljön, aminek az eredménye egy logikai változó. Egy reláció, több, [logikai operátorokkal](/python_basic/variables_bool/) összekapcsolt állítás, de akár egy komplex kódrészletet tartalmazó függvény hívása is kerülhet erre a részre. A lényeg, hogy az eredmény igaz vagy hamis legyen. A műveleti sorrend befolyásolására zárójeleket használhatunk.

## else
Abban az esetben, ha a hamis ágon is szeretnénk kódot futtatni, az `else` utasítást kell használni. A hatókör meghatározása ebben az esetben is behúzással történik.
``` python
a, b = 17, 13
if b > a:
    print("b nagyobb, mint a")
else:
    print("b kisebb vagy egyenlő, mint a")
```
```
b kisebb vagy egyenlő, mint a
```

## elif
A nem bináris jellegű feltételeket a megfelelő ág(ak)ba írt újabb elágazás(ok) segítségével kezelhetjük.
``` python
a, b = 13, 13
if b > a:
    print("b nagyobb, mint a")
else:
    if b == a:
        print("b egyenlő a")
    else:
        print("b kisebb, mint a")
```
```
b egyenlő a
```

Könnyen belátható, hogy bonyolultabb feltételrendszer esetén hamar nagyra nőnének a behúzások. Ezen tud részben segíteni az `elif` szintaxis használata. A fenti példa egyszerűbben írt változata:
``` python
a, b = 13, 13
if b > a:
    print("b nagyobb, mint a")
elif b == a:
    print("b egyenlő a")
else:
    print("b kisebb, mint a")
```
```
b egyenlő a
```

## pass
A programkódot nem úgy írjuk, mint egy regényt, hanem folyamatosan építjük. Ezért a fejlesztés során gyakran előfordul, hogy az elágazásnak nem egyszerre akarjuk kitölteni minden ágát (pl.: ha menet közben akarunk tesztelni), de már építkezéskor tudjuk, hogy műveleteket szeretnénk majd végrehajtani az ágon, így a vezérlési szerkezetet megvalósítjuk. Azonban a nyelvnek elvárása, hogy legalább egy utasítás legyen az adott blokkban.  Ilyenkor ideiglenesen a `pass` kulcsszóval kerülhető el a programhiba.

``` python
a, b = 17, 13
if b > a:
    pass
else:
    print("b kisebb vagy egyenlő, mint a")
```
```
b kisebb vagy egyenlő, mint a
```

## Bemenet ellenőrzése
Az alábbi példában a bemenet értéke megfelelően van konvertálva, így meg tudjuk jeleníteni annak négyzetét.
```python
x = input("Mondj egy számot és megmondom a négyzetét: ")
x = int(x)
print(x ** 2)
```
```
Mondj egy számot és megmondom a négyzetét: [10]
100
```
Arra viszont egyáltalán nem készültünk a kódban, hogy a felhasználó esetleg hibásan tölti ki a beviteli mezőt. 
```
Mondj egy számot és megmondom a négyzetét: [tíz]

---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
<ipython-input-10-46287843a758> in <module>
 1 x = input("Mondj egy számot és megmondom a négyzetét: ")
----> 2  x = int(x)
 3 print(x ** 2)

ValueError: invalid literal for int() with base 10: 'tíz'
```
Az `isnumeric` függvény képes eldönteni egy szöveges változóról, hogy numerikus értéket tartalmaz-e. Egy logikai értéket ad vissza, így egy egyszerű elágazással orvosolhatjuk a problémát.

```python
x = input("Mondj egy számot és megmondom a négyzetét: ")
if x.isnumeric():
    x = int(x)
    print(x ** 2)
else:
    print("Nem megfelelő bemenet!\nCsak numerikus érték adható meg.")
```
```
Mondj egy számot és megmondom a négyzetét: [tíz]
Nem megfelelő bemenet!
Csak numerikus érték adható meg.
```
# Ellenőrző kérdések, feladatok:
1. Készítsünk programot, amely bekér egy nullától különböző egész számot, és kiírja az előjelét (Pozitív vagy Negatív)
2. Készítsünk programot, amely bekér két különböző valós számot, és kiírja közülük a nagyobbat!
3. Készítsünk programot, amely bekér 3 egész számot, és kiírja közülük a legnagyobbat! A számok nem feltétlenül különbözőek.
4. Kérd be a felhasználótól a nevét és az életkorát. Ha az életkora 20 alatti, üdvözöld a keresztnevén tegeződve, ha 20 feletti, a teljes nevét magázódva!
5. Kérd be a felhasználótól egy kör sugarát és írd ki a területét. Ha a megadott érték nem szám, írd ki, hogy helytelen értéket adott meg!
6. Kérj be a felhasználótól egy számot. Ha számmá konvertálható a megadott input, írd ki, hogy nulla, páros-e vagy páratlan! Ha nem, írd ki hogy helytelen értéket adott meg!
7. Kérj be a felhasználótól egy hőmérsékletet leíró számértéket, majd hogy az Celsius vagy Fahrenheit (C/F) skálán van-e megadva. Írd ki az ellentétes skála szerinti értéket. Nem megfelelő inputra (nem számérték, vagy nem C vagy F) írd ki, hogy nem megfelelő a bemenet!
8. Kérj be a felhasználótól egy karakterláncot, majd ellenőrizd, hogy csupa kisbetűvel van-e írva. Írd ki a vizsgálat eredményét a kimenetre
