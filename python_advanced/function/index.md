# Függvények
A *függvények* nevesített kódrészletek, melyeknek egy konkrét feladata van. Ha ezt a feladatot többször kell megoldani a futtatás során, akkor a kódrészlet megismétlése helyett elég *meghívni* a megfelelő függvényt. A függvények segítségével nem csak a kód írása könnyebb, de javul az olvashatósága, valamint egyszerűbb a tesztelése és a javítása is.

A függvényeknek információt adhatunk át bemeneti **paraméterek** formájában, és a kimenetként kapott **visszatérési értéket** felhasználhatjuk a kód további részeiben. A terminológia okkal hasonlít a matematikában használt függvényekéhez. Vegyük az alábbi példát: 

$f(x) = x^2 + 3x$

Az $f$ függvény bementi paramétere az $x$ változó értéke, a visszatérési értéke -- amit tipikusan az $y$ tengelyen ábrázolunk -- pedig az egyenlőség jobb oldalán található egyenlet eredménye adott $x$ érték esetén. Persze a matematikai függvények lehetnek többdimenziósak, azaz rendelkezhetnek több bemeneti paraméterrel, viszont ebben az esetben is csak egy értéket adnak eredményül, pont, ahogy a programokban szereplő függvények:
$$f(x, y) = \dfrac{x^2 + 3y}{y^3-2x}$$

A programozás területén a különbség annyi, hogy egyenletek helyett komplex működési logika szerepelhet az egyes függvényekben, beleértve több másik függvény meghívását is.

## Függvény definiálása
Egy függvény létrehozásához meg kell adni a nevét, majd a megszokott módon, behúzással kell meghatározni a hatókörébe tartozó kódrészleteket.
```python
def udvozles():
    print("Üdvözöllek!")
    
udvozles()
```
```
Üdvözöllek!
```
A kódrészlet első két sora a **függvény definíció** (meghatározás). Ez a rész határozza meg, hogy pontosan mit csinál a függvény. Az első sorban a `def` szó után szereplő megnevezés a függvény neve, ezzel lehet rá hivatkozni. A negyedik sorban történik a **függvény hívása**, melynek hatására lefut a meghívott függvényhez tartozó kódrészlet.

A Python egy [interpreteres nyelv](/python_basic/general/), tehát sorról sorra történik a kód futtatása. Ezért a függvény definícióknak mindig az adott függvény hívása előtt kell szerepelniük. Ellenkező esetben a rendszer számára még ismeretlen függvényt próbálunk meghívni, ami hibához vezet.

> A Python a memóriában tartja a korábban létrehozott változókat és függvényeket még akkor is, ha az eredeti programkódot már töröltük. Ezért, ha a fenti helyes példát futtatjuk, és csak utána próbáljuk ki az alábbit, akkor az nem fog hibát dobni, hiszen korábban a memóriában már létrejött az `udvozles()` függvény. Viszont a függvény definíciót a meghívást követő két sor felül fogja írni. Az alábbi példa tesztelése előtt ezért érdemes újraindítani a Pythont. (Jupyterben elég a kernelt újraindítani.)

```python
udvozles()

def udvozles():
    print("Üdvözöllek!")
```
```
NameError                                 Traceback (most recent call last)
<ipython-input-1-750d3e18889e> in <module>
----> 1  udvozles()
 2 
 3 def udvozles():
 4     print("Üdvözöllek!")

NameError: name 'udvozles' is not defined
```

## Paraméterek és argumentumok
A függvényeknek átadhatunk információt egy vagy több paraméteren keresztül. Az információ átadás helye a függvény neve után található zárójel, melyet a Python nyelv esetében akkor is mindig ki kell írni a függvények után, ha nem történik adat átadás.
```python
def udvozles(felhasznalo_nev):
    print(f"Üdvözöllek {felhasznalo_nev.title()}!")
    
udvozles("eszter")
```
```
Üdvözöllek Eszter!
```
A példában a függvénynek egy név adható meg, mely alapján az egy megfelelően formázott üdvözlő üzenetet jelenít meg. A hivatalos terminológia szerint a `felhasznalo_nev` a függvény egy **paramétere**, mely egy a kapott információt tároló változó. A függvény híváskor átadott "eszter" literál a függvény egy **argumentuma**.

> A gyakorlatban a két kifejezést szinte szinonimaként használják és cserélgetik a fejlesztők. Nyugodtan lehet használni bármelyiket. Csak azért hangsúlyoztuk ki a különbséget, hogy segítsünk megérteni a függvények működését. Ebben az anyagban a könnyebb értelmezés érdekében még követjük a precíz megnevezéseket, de a továbbiakban ne okozzon meglepetést, ha az anyagban szabadabban használjuk ezeket a megnevezéseket.

Egy függvénynek tetszőleges számú paramétere lehet. Ezeket egyszerűen vesszővel kell elválasztani, és a függvény híváskor az argumentumok esetén is hasonlóan kell eljárni.
```python
def udvozles(kereszt_nev, vezetek_nev):
    print(f"Üdvözöllek {vezetek_nev.title()} {kereszt_nev.title()}!")
    
udvozles("eszter", "winch")
```
```
Üdvözöllek Winch Eszter!
```
A fenti példában a híváskor megadott értékek a sorrendjük alapján kerülnek az egyes paraméter változókba. Az így megfeleltetett értékeket hívják **pozícionális argumentumoknak**.  A sorrend követése helyett azonban használhatunk úgynevezett **kulcsszavas argumentumokat** is. 

```python
def udvozles(kereszt_nev, vezetek_nev):
    print(f"Üdvözöllek {vezetek_nev.title()} {kereszt_nev.title()}!")
    
udvozles(vezetek_nev="winch", kereszt_nev="eszter")
```
```
Üdvözöllek Winch Eszter!
```
A kettő argumentum típust keverni is lehet, de a pozícionális argumentumok helye fix, ezért a kulcsszavasak csak utánuk következhetnek. Ellenkező esetben hibaüzenetet kapunk. 
```python
def udvozles(kereszt_nev, vezetek_nev):
    print(f"Üdvözöllek {vezetek_nev.title()} {kereszt_nev.title()}!")
    
udvozles(vezetek_nev="winch", "eszter")
```
```
 File "<ipython-input-7-71d4c7fb934f>", line 4
 udvozles(vezetek_nev="winch", "eszter")
 ^
SyntaxError: positional argument follows keyword argument
```
### Alapértelmezett érték
A korábbi tanulmányok során feltűnhetett, hogy vannak függvények, amelyek bizonyos funkciójú paramétereit nem mindig kell megadni. Van lehetőség arra, hogy **alapértelmezett értékkel** lássuk el a függvényünk egyes -- vagy akár összes -- paramétereit. Ezeket szokás **opcionális paraméternek** is nevezni. Ilyenkor az alapértelmezett értékkel rendelkező paraméterek argumentumai egyszerűen elhagyhatók a függvény hívás során, és a paraméterváltozó a megadott alapértéket kapja majd. Ha viszont meg van adva a megfelelő argumentum, akkor a híváskor a paraméter változó értéke a megadott értékkel felülíródik.
```python
def udvozles(kereszt_nev, vezetek_nev="anonymus"):
    print(f"Üdvözöllek {vezetek_nev.title()} {kereszt_nev.title()}!")
    
udvozles("eszter")
udvozles("eszter", "winch")
```
```
Üdvözöllek Anonymus Eszter!
Üdvözöllek Winch Eszter!
```
Az alapértelmezett paraméterek csak a normál paraméterek után helyezkedhetnek el. Ellenkező esetben ugyanis az argumentumok pozícionális megadása esetén a Python nem tudná eldönteni, hogy éppen kihagyásra került egy argumentum vagy nem.

Amennyiben több opcionális paraméter tartozik egy függvényhez, akkor pozícionális argumentum megadás esetén érthetően csak sorban kaphatnak értéket, de kulcsszavas megadás esetén kihagyhatók argumentumok a sorból.

### Korlátlan számú paraméter
Előfordulhat, hogy nem tudjuk előre, hány bemeneti paraméterre lesz szükségünk, és lehetőséget akarunk adni arra, hogy a felhasználó tetszőleges számú paramétert adjon meg. Tipikus példa erre a `min` és a `max` függvény. Mindkettő esetén, vesszővel elválasztva bármennyi értéket megadhatunk, és eredményként a legkisebb / legnagyobb értéket kapjuk vissza. 
```python
print(min(2, 5, 1))
```
```
1
```

A saját függvényünkben is meg tudjuk valósítani ezt a funkcionalitást egy speciális paraméter segítségével. Ez a fajta paraméter keverhető hagyományos paraméterekkel, de mindig csak egy lehet belőle, és az utolsó kell, hogy legyen a sorban. Létezik a pozícionális és kulcsszavas változata is. A paramétert tipikusan `args` (argumentumok röviden) néven szokás létrehozni, de a neve tetszőleges.

A **pozícionális** változat esetén egy `*` jelet kell a paraméter neve elé tenni. A paraméter változó egy [tuple](/content/python_basic/tuple) lesz. Ez egy szekvenciális adattípus, ami lényegében a lista immutábilis változata, tehát csak kiolvasni lehet belőle adatokat, módosításra nincs lehetőség.

```python
def avg(*args):
    sum = 0
    for a in args:
        sum += a
    avg = sum / len(args)
    print(avg)

avg(2, 5, 1)
```
```
2.6666666666666665
```
A példában az átlag (average) függvényt valósítottuk meg. A `*args` jelöléssel létrehozott paraméterre egyszerűen `args` néven tudunk hivatkozni, és a listáknál megszokott módon érhetjük el az értékeit. Egy ciklus segítségével összeadjuk a számokat (függetlenül attól, hány lett megadva), végül pedig a darabszámukkal osztjuk az eredményt, és ezt jelenítjük meg.

A példa átláthatósága érdekében nem írtunk bele ellenőrzéseket, de könnyen látható, hogy helytelen adatok megadása esetén hamar hibába fogunk ütközni. A függvények egyik előnye, hogy ha a belsejükben kezeljük a potenciális hibákat, akkor a többszöri felhasználásuk során nem kell minden alkalommal ezzel bajlódni.

A függvénynek beadott paraméterek az értéknek megfelelő adattípust veszik fel szemben például az [input](/content/python_basic/input) függvénnyel, ami mindig szöveges értéket kap. Ezért a szokásos, karakterláncok során használt `isnumeric` metódus nem fog működni, hiszen az `integer` típusnak nincs ilyen metódusa. Helyette az `isinstance(object, type)` függvényt kell használnunk.
```python
a = 5
is_number = isinstance(a, (int, float))
print(is_number)
```
```
True
```
A függvény első paramétere az ellenőrzött változó / érték, a második pedig a típus, amivel az egyezőséget vizsgáljuk. Vizsgálhatunk egyszerre több típussal való egyezést is, ha a típusokat egy tuple-ként adjuk át (a tuple deklarálás ugyanúgy működik, mint a lista esetén, csak szögletes zárójel helyett hagyományosat kell használni). Ebben az esetben akkor kapunk igaz eredményt, ha a felsorolt típusok közül bármelyikkel egyezik a megadott érték.

Ezt felhasználva írhatunk egy jól biztosított átlag függvényt:

```python
def avg( *args ):
    sum = 0
    count = 0
    for a in args:
        if not(isinstance(a, (int, float))):
            continue
        sum += a
        count += 1
    if count == 0:
        print("Nem szerepelt szám a megadott értékek között!")
    else:
        avg = sum / count
        print(avg)

avg(2, 5, 1)
avg(2, "tíz", 5, [], 1)
avg()
```
```
2.6666666666666665
2.6666666666666665
Nem szerepelt szám a megadott értékek között!
```

A **kulcsszavas** változat alkalmazásához egyszerűen dupla csillagot (`**`) kell tenni a paraméter neve elé. Egy ilyen paraméter alkalmazása esetén a híváskor bármilyen nevesített argumentum megadható, és a függvényben kell kezelni annak a felhasználását. Ebben az esetben tuple helyett, egy úgynevezett szótár (dictionary) objektumot kapunk, aminek az elemeire nem a sorszámukkal, hanem a nevükkel lehet hivatkozni.

```python
def meret( **args ):
    if "szelesseg" in args and "hosszusag" in args and "magassag" in args:
        V = args["szelesseg"] * args["hosszusag"] * args["magassag"]
        print(f"A térfogat: {V}")
    elif "szelesseg" in args and "hosszusag" in args:
        A = args["szelesseg"] * args["hosszusag"]
        print(f"A felület: {A}")
    else:
        print("Nem megfelelő argumentumok!")
        
    
meret(szelesseg=10, hosszusag=20, magassag=30)
meret(szelesseg=10, hosszusag=20)
meret(szelesseg=10, magassag=30)
```
```
A térfogat: 6000
A felület: 200
Nem megfelelő argumentumok!
```
Ezt a lehetőséget csak speciális esetekben érdemes használni, és legtöbbször helyettesíthető a funkcionalitása opcionális paraméterekkel. Csak a teljesség kedvéért mutatjuk meg, nem fogjuk számonkérni.


## Visszatérési érték
A paraméterek segítségével információt tudunk átadni a függvényünknek, de a legtöbb esetben valamit vissza is szeretnénk kapni. A függvény lefutását követen a `return` utasítás után írt értéket adja vissza a függvény. A korábbi átlag példát módosítva:
```python
def avg(*args):
    sum = 0
    for a in args:
        sum += a
    avg = sum / len(args)
    return avg

atlag = avg(2, 5, 1)
print(atlag)
```
```
2.6666666666666665
```
A visszaadott érték lementhető egy változóba, vagy közvetlenül is felhasználható. Függvény írása során a legtöbb programnyelv semmilyen módon nem köti meg a függvény funkcionalitását, de alapvetően érdemes odafigyelni arra, hogy egy függvény csak egy funkciót valósítson meg. A számítások elvégzése és a megjelenítés két külön funkció, ezért az, hogy ebben a példában visszaadjuk az értéket, és csak aztán írjuk ki, sokkal jobban megfelel ennek az elvnek.

A `return` utasítás nem csak a függvény végére írható, bár általában oda szokás tenni. Ugyanis nem a csak a visszatérési értéket határozza meg, de a függvény további futását is megállítja. Az utána következő lépések már nem hajtódnak végre.

```python
def parity(x):
    if x % 2 == 0:
        return "páros"
    else:
        return "páratlan"
    print("Ez már nem fut le")

a = 5
print(f"A megadott szám {parity(a)}")
```
```
A megadott szám páratlan
```
A példában függetlenül attól, hogy az elágazás melyik ágába megyünk bele, a függvény futása megáll, ezért soha nem íródik ki az utána következő `print` utasítás tartalma. Ebből adódóan, ha a `return`-t például egy ciklus törzsében hívjuk meg, akkor hasonló funkcionalitással bír, mint a `break` parancs.

A `return` segítségével bármilyen típusú adat visszaadható, például egy lista vagy egy tuple is. 

```python
def paros_szamok(x):
    szamok = []
    for i in range(1, x + 1):
        if i % 2 == 0:
            szamok.append(i)
    return szamok

a = 20
print(paros_szamok(a))
```
```
[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```
A különböző `return` ágakban különböző típusú értékek is visszaadhatók, de ilyenkor bonyolult lehet a kimenetek kezelése, ezért ezt érdemes elkerülni. Ha pedig valamelyik ágon nem adunk `return` utasítást, vagy esetleg egy visszatérési érték nélküli függvény kimenetét próbáljuk kiolvasni, akkor az eredmény a `None`, azaz "semmi" érték lesz. Ez egy valid érték a Pythonban, amire rá tuduk ellenőrizni az `is` utasítással.

```python
def parity(x):
    if x % 2 == 0:
        return "páros"    

a = 5
p = parity(a)
if p is None:
    print("Nem érkezett válasz")
else:
    print(f"A megadott szám {p}")
```
```
Nem érkezett válasz
```
Az előző példában jó lenne egyszerre megmutatni a két ág működését, de akkor kétszer kellene megírni a feltételt is. Szerencsére pont az ilyen esetekben érdemes függvényeket használni:

```python
def parity(x):
    if x % 2 == 0:
        return "páros"    

def display_result(p):
    if p is None:
        print("Nem érkezett válasz")
    else:
        print(f"A megadott szám {p}")
    
display_result(parity(5))
display_result(parity(6))
```
```
Nem érkezett válasz
A megadott szám páros
```


## Változók kezelése
A függvények használata során könnyű belekeveredni a felhasznált változók, átadott argumentumok és paraméterek tömegébe. Ezért érdemes tudni, hogyan viselkednek a változók a függvényekkel. (Ez a leírás felületes és csak az alapvető megértést segíti, ha valakit mélyebben is érdekel a változók működése és a memóriakezelés, akkor a neten [számos anyagot](https://www.geeksforgeeks.org/pass-by-reference-vs-value-in-python/) talál, melyek alaposan kifejtik ezeket.)
```python
def test():
    a = 5

test()
print(a)
```
```
NameError                                 Traceback (most recent call last)
~\AppData\Local\Temp/ipykernel_15336/2993042665.py in <module>
 3 
 4 test()
----> 5  print(a)

NameError: name 'a' is not defined
```
A Python függvényeken belül létrehozott változók csak a függvényen belül léteznek, és az értékük is csak ott érhető el. Még függvényt is lehet létrehozni függvényen belül, ilyenkor a belső függvény csak az eredeti függvényen belül lesz használható. (Bár erre a funkcióra elég ritkán van szükség a gyakorlatban.)

Fordított esetben viszont, ha a függvényen kívül hozunk létre egy változót, akkor azt a függvényen belül is elérjük, és használni tudjuk az értékét.

```python
a = 5

def test():
    print(a)

test()
```
```
5
```
Viszont, ha a függvényen belül megpróbáljuk felülírni egy külső változó értékét, akkor egyszerűen csak egy új változó jön létre, ami független a külsőtől. Ezt szemlélteti az alábbi példa:
```python
a = 5

def test():
    a = 6
    print(a)

test()
print(a)
```
```
6
5
```
Hasonló a helyzet az argumentumként átadott változókkal is. Alapvetően, ha változó értékét felülírjuk a függvényben, akkor új változó jön létre, ami nem befolyásolja az eredeti változót. De, ha csak lekérdezzük vagy módosítjuk az értékét, akkor nem jön létre új változó, ezért az eredeti változó értéke is megváltozik. Olyan egyszerű adattípusnál, mint egy szám nincs igazán értelmezve a módosítás, de egy listával már jól érzékeltethető a dolog:

```python
a = ["A", "B", "C"]
b = ["A", "B", "C"]

def modify1(x):
    x = ["D", "E", "F"]
    
def modify2(x):
    x[1] = "E"
    x.append("D")

modify1(a)
modify2(b)

print(a)
print(b)
```
```
['A', 'B', 'C']
['A', 'E', 'C', 'D']
```

 Csak, hogy ne legyen egyszerű a dolog, léteznek még úgynevezett globális változók, melyeket `global` előtag megadásával lehet deklarálni. Ezeket a program bármelyik részén el lehet érni, még akkor is, ha több fájlra bontjuk szét az alkalmazást. A normál használatukat rossz gyakorlatnak tartják, mert különösen több felhasználós vagy többszálú alkalmazások esetén könnyen összeakadhatnak a rajtuk végzett változtatások. Viszont kiválóan alkalmasak konstans értékek tárolására. Mi nem fogunk globális változókat használni a programjainkban.

Python nyelven nem lehet kikényszeríteni, hogy egy változó értéke konstans maradjon és ne lehessen változtatni, de a konstans változók elfogadott jelölése, hogy a nevük csupa nagybetűből áll. Az ilyen változóról egy másik fejlesztő is tudni fogja, hogy annak nem szabad módosítani az értékét.


## Rekurzív függvények
Egy komplex kódban számos függvény szerepelhet, melyek gyakran egymásra hivatkoznak. Könnyen lehet, egy egyszerűnek tűnő utasítás valójában tucatnyi függvényhívás láncolatát indítja el. Ezeket a hívásokat gyakran nehéz lehet követni, főleg egy kevésbé tapasztalt programozó számára. A [pythontutor.com](https://pythontutor.com/) oldal egy hasznos eszközzel segítheti a komplexebb kódrészletek megértését. Az oldal lépésről lépésre, vizuális segítséggel kiegészítve engedi futtatni a Python kódokat, így könnyen követhetővé válnak az egyes lépések.

Az összetett függvényhívások egy speciális este a **rekurzív függvény**. Egy rekurzív függvény lényege, hogy valahol a függvény kódjában saját magát hívja meg. Ez értelemszerűen könnyen vezethet a végtelenségig tartó függvényhíváshoz, ezért az ilyen függvények megvalósítása során körültekintően kell eljárni.

Az egyik tipikus példa a rekurzió alkalmazására a faktoriális értékének kiszámítása:

```python
def factor(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factor(n - 1)

print(factor(5))
```
```
120
```
Persze ez az érték egy ciklussal is meghatározható, de jól szemlélteti a lehetőségeket. A pythontutor-ban kipróbálva ezt a kódot látható, hogy sorra hívódik meg a `factor` függvény egyre kisebb értékekkel egészen addig, míg fixen egy nem lesz a bemenete. Ekkor a hívás 1-et ad eredményül, amit visszakap a 2 bemenetű hívás utolsó sora, és a 2-vel szorozva, szintén 2-t ad, egészen addig míg vissza nem jutunk az első hívásig, ami pedig végül az 5 x 24 eredményét adja vissza.

Az összetett rekurzív függvények átlátása és felépítése még gyakorlott programozóknak is kihívást jelenthet, de vannak olyan problémák, amiket határozottan ezzel a megoldással érdemes megközelíteni (pl.: termék összetevők feltérképezése, HTML dokumentum tagek bejárása).

# Feladatok
1. Készíts függvényt, ami megállapítja hogy hány nagybetű van egy karakterláncban! (`isupper` függvény használható)
2. Készíts függvényt, amely egy megadott karakterláncot megfordít!
3. Készíts függvényt, amely egy adott bemenetről megállapítja, hogy [palindróma](https://hu.wikiquote.org/wiki/Magyar_nyelv%C5%B1_palindromok_list%C3%A1ja)-e vagy sem!
4. Készíts függvényt, amely egy adott bemenetről megállapítja, hogy (magyar nyelvű) [Pangramma](https://hu.wikipedia.org/wiki/Pangramma)-e vagy sem! (Ehhez neked kell felsorolni a magyar betűket a kódban!)
5. Készíts függvényt amely tetszőleges számú bemenetből kiszámolja a megadott számok [harmonikus közepét](https://hu.wikipedia.org/wiki/Harmonikus_k%C3%B6z%C3%A9p)! (Kezeld a potenciális hibás bemeneteket is!)
6. Készíts függvényt amely meghatározza két szám legnagyobb közös osztóját az euklideszi algoritmus segítségével!
