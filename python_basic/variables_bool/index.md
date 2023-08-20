# Logikai típus
A logikai adattípusú vagy más néven `bool` változó csak `True` (igaz) vagy `False` (hamis) értékeket vehet fel. (A Python csak a nagybetűvel kezdődő szintaxist fogadja el.)

## Aritmetikai operátorok
A logikai típusú értékek általában valamilyen aritmetikai művelet -- vagy ezeket alkalmazó függvények visszatérési értéke -- kapcsán keletkeznek. Az aritmetikai operátorok írásmódját az alábbi táblázat tartalmazza:

jelentés|jelölés
-|-
Egyenlő|`a == b`
Nem egyenlő|`a != b`
Kevesebb, mint|`a < b`
Kevesebb vagy egyenlő|`a <= b`
Nagyobb, mint|`a > b`
Nagyobb vagy egyenlő|`a >= b`

Ahol `a` és `b` két azonos típusú változó. Fontos megjegyezni, hogy nem csak a számok, de például a szövegek (ABC sorrend) vagy a dátumok között is értelmezhetők ezek a műveletek. 

Az egyenlőség ellenőrzése során azért van szükség a dupla (`==`) írásjelre, mert az egyenlőségjelnek más funkcionalitása van a kódban. A szimpla egyenlőség az értékadás jele, míg a dupla az összehasonlítás. Ezért, ha például egy [elágazásban](/content/python_basic/if_statement) lefelejtjük a dupla jelölést, akkor az `a = b` eredménye az lesz, hogy `a`-t felülírjuk `b` értékével, és az elágazás `a` új értékét próbálja majd kiértékelni. Ha `b` nem egy logikai típus volt, akkor ez hibához vezet majd.

A fenti operátorokat a legtöbb programnyelven ugyanilyen formában kell használni. Kivétel ez alól néhány esetben a "Nem egyenlő" jelölés, mely helyett egyes nyelvek a `<>` karaktereket használják (pl.: VBA).

## Logikai operátorok
A logikai operátorok egy vagy több logikai adatot értékelnek ki, és egy logikai értéket adnak eredményül. 

operátor|jelentés|példa
-|-|-
`and`|Igaz, ha mindkét állítás igaz|`x < 5 and x < 10`
`or`|Igaz, ha legalább az egyik állítás igaz|`x > 50 or x < 10`
`not`|Az eredmény megfordítása: hamis eredményt ad, ha az eredmény igaz és fordítva|`not(x > 50 and x < 10)`

A feltételek értékelésénél a Python erőforrás takarékos megközelítést használ: ha a **VAGY** kapcsolatban álló feltétel részek közül az egyik teljesül, biztosak lehetünk abban, hogy a teljes feltétel teljesül, így a kiértékelést nem kell folytatni.

Hasonlóképpen: ha az egymással **ÉS** kapcsolatban lévő feltétel részek közül akár egy nem teljesül, biztosak lehetünk abban, hogy a teljes kifejezés értéke hamis.

Ha a Python már biztos lehet a végeredményben, nem folytatja a feltétel részek kiértékelését. Ennek akkor van jelentősége, amikor a feltételben függvény hívások is szerepelnek. Ha nem szükséges akkor ezek nem kerülnek hívásra.
```python
a, b = 10, 15

x = a > b
y = a > 0 and a < 100 # 0 < a < 100
z = x or y

print(x)
print(y)
print(z)
```
```
False
True
True
```
# Ellenőrző kérdések, feladatok:
1. Kérj be két értéket a felhasználótól, majd ellenőrizd, hogy egyenlőek-e!
2. Kérj be három karakterláncot a felhasználótól, majd írd ki a kimenetre, hogy mind azonos-e, vagy bármelyik kettő azonos-e. A vizsgálatot összetett logikai kifejezésekkel végezd.
3. Mi lesz az alábbi kifejezések értéke?
not(True and True)
True or False
not(False and True)
False and False
4. Kérj be a felhasználótól egy évszámot, majd írd ki, hosgy szökőév-e vagy sem. Ellenőrizd, hogy a megadott érték valóban szám legyen, és négy karakter hosszú. A kiértékelést összetett logikai kifejezéssel végezd.
5. Valósítsd meg a „kizáró vagy” műveletet az alábbi példán keresztül: kérd be két lépcsőházi alternatív villanykapcsoló állását (csak két érték fogadható el, szabadon választhatsz, hogy 0/1, igen/nem, stb, bármely más értékre kérd be újra az értéket), majd írd ki, hogy ég-e a villany! Próbáld meg minél tömörebben megfogalmazni a kifejezést!
