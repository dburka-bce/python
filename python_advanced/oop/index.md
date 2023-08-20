# OOP alapok
Az *Objektum Orientált Programozás* (OOP) a szoftver fejlesztés egyik leghatékonyabb megközelítése. A legtöbb modern programozási nyelv ezen az elven épül fel, többek között azért, mert átláthatóbbá teszi a kód struktúráját, és ezzel nagyban megkönnyíti a fejlesztők közötti kommunikációt és csapatmunkát.

Az OOP alapját az objektumok és az őket leíró osztályok alkotják. Egy **osztály** egy adott típusú objektum általános viselkedését írja le, míg az objektumnak magának lehetnek ezen felül saját egyedi tulajdonságai. Az osztály intuitíve egyformának ítélt objektumokat foglal egységbe. Számos valós analógiát lehet találni erre a felépítésre. Vegyük például az állatok osztályozását (a név egyezőség nem véletlen). Tekintsünk el a pontos terminológiától, és mondjuk azt, hogy a *Macska*, mint fogalom egy osztály, és a bele tartozó állatoknak (objektumoknak) számos olyan tulajdonsága van, ami mindegyikükre igaz. Például mind emlősök, négylábúak, ragadozók és igazi rohadékok tudnak lenni... Egy háziállatként tartott macskának általában van neve is, így ez is egy közös tulajdonság, ám egy konkrét macska neve már viszonylag egyedi, például: Cirmi.

Az objektumok az őket leíró osztály minden tulajdonságával rendelkeznek, de ezen tulajdonságok konkrét értékei már az adott objektumhoz tartoznak. Egy adott osztálynak megfelelő objektum létrehozását **példányosításnak**, a létrehozott objektumot pedig az osztály egy **példányának** nevezzük. 

Az objektum orientált programozás lényege, hogy a kód a különböző objektumok interakcióiból épül fel. Az osztályok által leírt objektumoknak vannak különböző adattípusú változók által meghatározott tulajdonságai, saját függvényei és lehetséges eseményei, melyek bekövetkezése alkalmával futnak le az egyes kódrészletek. Az objektumok kiválthatják más objektumok eseményeit, vagy meghívhatják a függvényeiket, így folytatva a program futását.

## Láthatóság, névtér
A programunk logikailag egymáshoz tartozó részét egy **namespace** (névtér alá) célszerű elhelyezni. A **scope** (magyarul láthatóság) a változók és függvények láthatóságára utal. A függvényen vagy osztályon kívül definiált változóknak és függvényeknek globális a láthatóságuk. A **global** kulcsszóval tudjuk elérni a globális változókat függvényen belülről. A **nonlocal** kulcsszóval el tudjuk érni a nem globális és nem lokális változókat.
```python
def scope_test():
    def do_local():
        spam = "local spam"

    def do_nonlocal():
        nonlocal spam
        spam = "nonlocal spam"

    def do_global():
        global spam
        spam = "global spam"

    spam = "test spam"
    do_local()
    print("After local assignment:", spam)
    do_nonlocal()
    print("After nonlocal assignment:", spam)
    do_global()
    print("After global assignment:", spam)

scope_test()
print("In global scope:", spam)
```
```
After local assignment: test spam
After nonlocal assignment: nonlocal spam
After global assignment: nonlocal spam
In global scope: global spam
```
## Osztályok
Az osztályok fogják össze a funkcionálisan egybe tartozó változókat és függvényeket. Általánosságban az osztályok példányosíthatók és más osztályok származtathatók belőlük. Az osztályhoz tartozó függvények első paramétere különleges, ugyanis ezen keresztül érhetők el a példányosított osztály változói és függvényei. Egységesen a `self` megnevezést szokás használni ehhez a paraméterhez, de ezzel kapcsolatban nincs megkötés a nyelvben.

```python
# a MyClass osztály definíciója
class MyClass:
    my_var = 12345

    def __init__(self):
        print('__init__ function called')
        self.my_var = 54321
        
    def my_func(self):
        return 'test'
        
# a MyClass osztály példányosítása
# az x változó a MyClass egy példányára mutat
x = MyClass()

# osztályváltozó elérése
print(x.my_var)

# osztályfüggvény elérése
x.my_func()
```
```
__init__ function called
54321
'test'
```

### Osztály példa
Az alábbi példában a `Macska` osztályt definiáltuk a `class` utasítás segítségével. Az utasítás hatóköre a feltételeknél és ciklusoknál megszokott módon működik.
```python
class Macska:
    def __init__(self):
        self.név = "Cic"
        self.szín = "Fekete"
        self.életek = 9
        
    def nem_talpra_esett(self):
        self.életek -= 1
        
cica = Macska()
cica.név = "Cirmi"
cica.szín = "Tarka"
cica.nem_talpra_esett()

print(cica)
print(cica.név)
print(cica.szín)
print(cica.életek)
```
```
<__main__.Macska object at 0x000002452CE88AF0>
Cirmi
Tarka
8
```
A példában sok az újdonság. A `Macska` osztály leírásában két függvény található.  Az első `__init__` nevű függvény speciális. Ez az osztály **konstruktora**. Az ezen belül írt kód minden osztály példányosítás során lefut. Tipikusan a kezdő értékek beállítására szokás használni.

Ebben a példában az osztálynak három tulajdonsága van: Név, Szín és az Életek száma. Az osztály minden függvényének van egy speciális első paramétere, ami mindig az osztály aktuális példányát jelöli. A ponttal való összefűzéssel tudunk az osztály példány egyes elemeire (tulajdonság, függvény, esemény) hivatkozni. A példában definiáljuk a három tulajdonságot és kezdő értéket adunk nekik. (Pythonban nem lehet kezdőérték nélküli tulajdonságot létrehozni.) A `self.név` ugyanúgy működik, mint egy hagyományos változó. Értéket lehet neki adni, használni lehet, de a lényeg, hogy az osztály hivatkozás birtokában bármikor könnyen elérhető.

A második függvény egy az osztályhoz tartozó függvény, ami csak az osztály példányai számára érhető el. Ilyen például a karakterlánc adattípus (osztály) számára elérhető `isnumeric()` függvény is. Ebben az esetben a `nem_talpra_esett()` függvény meghívásával azt jelezzük, hogy a konkrét `Macska` példányunkat baleset érte, ezért eggyel lecsökkent a megmaradt életeinek száma.

Az osztály definíció alatt van egy példa az osztály használatáról. A `Macska()` utasítással létrehozunk egy példányt a `Macska` osztályból, és a `cica` változóval hivatkozunk rá a továbbiakban. A `cica`-ban található példány neve ezen a ponton az alapértelmezett "Cic", "Fekete" a színe, és újszülöttként 9 élete van.

A `cic.Név = "Cirmi"` sorral nevet adunk az aktuális cicánknak, de egy újabb példány létrehozásakor az új cicának továbbra is "Cic" marad az első neve. A `cica.nem_talpra_esett()` függvényt meghívva lefut annak tartalma, ezért a cicánk életeinek száma lecsökken.  Az egyes értékeket kiíratva látszódnak a változások.

Az osztályok segítségével egységben kezelhetjük az egybe tartozó adatokat, és a velük végzett műveleteket is a releváns adattípusokra korlátozhatjuk. Az itt bemutatott példa csak ízelítő, és töredékét nem mutatja meg az objektum orientált programozás lehetőségeinek. De remélhetőleg segít jobban megérteni a Python kódok felépítését.

### Osztály és példány változók
Az osztályváltozók az osztályhoz köthető, a példányváltozók pedig a példányokból érhetők el.
```python
class Kutya:
    fajta = 'kutya' # osztályváltozó

    def __init__(self, nev):
        self.nev = nev    # példányváltozó

d = Kutya('Buksi')
e = Kutya('Blöki')

d.fajta, d.nev

# a fajta ugyanaz marad, a név változik
e.fajta, e.nev
```
```
('kutya', 'Buksi')
('kutya', 'Blöki')
```

Tegyük fel, hogy ki akarjuk egészíteni a Kutya osztályt egy tanul_trukk függvénnyel, amely a paraméterként átadott trükköt hozzáadja az adott kutya megtanult trükkjei közé!

**Rossz megoldás:**
```python
class Kutya:
    fajta = 'kutya' # osztályváltozó
    trukkok = []

    def __init__(self, nev):
        self.nev = nev    # példányváltozó

    def tanul_trukk(self, trukk):
        self.trukkok.append(trukk)

d = Kutya('Fido')
e = Kutya('Mancika')
d.tanul_trukk('ül')
d.tanul_trukk('forog')

d.trukkok
e.trukkok
```
```
['ül', 'forog']
['ül', 'forog']
```

**Jó megoldás:**
```python
# A trukkok listát a Kutya osztály konstruktorában hozzuk létre példányváltozóként
class Kutya:
    fajta = 'kutya' # osztályváltozó

    def __init__(self, nev):
        self.nev = nev    # példányváltozó
        self.trukkok = []

    def tanul_trukk(self, trukk):
        self.trukkok.append(trukk)

:

d = Kutya('Fido')
e = Kutya('Mancika')
d.tanul_trukk('ül')
d.tanul_trukk('forog')

d.trukkok
e.trukkok
```
```
['ül', 'forog']
[]
```
### Öröklődés
Az osztályokból más osztályok származtathatóak, amelyek öröklik az ősosztály változóit és függvényeit.
```python
# Ősosztály
class Jarmu:
    def __init__(self, szin):
        self.szin = szin

    def megjelenit(self):
        print('A jármű színe: {:}'.format(self.szin))

# Az Auto osztályt a Jarmu osztályból származtatjuk
class Auto(Jarmu):
    def __init__(self, szin, kerekek_szama):
        # Az ősosztály konstruktorának meghívása
        Jarmu.__init__(self, szin)
        #super().__init__(szin)
        
        self.kerekek_szama = kerekek_szama

    # a megjelenit függvényt felülírjuk
    def megjelenit(self):
        print('A jármű színe: {:}\nKerekeinek száma: {:}'.format(self.szin, self.kerekek_szama))

j = Jarmu('piros')
j.megjelenit()

a = Auto('kek', 4)
a.megjelenit()
```
```
A jármű színe: piros
A jármű színe: kek
Kerekeinek száma: 4
```

## Feladatok
1. Hozz létre egy osztályt, ami egy Hallgató nevét és Neptun kódját tárolja. Hozz létre egy listát a kódban, és adj hozzá három hallgató példányt.
2. Készíts egy a Jarmu osztályból származtatott Repulo osztályt, paraméterként adj hozzá egy Boolean típusú változót, amely azt tárolja, hogy a repülőgép futóműve behúzható-e!
3. Készíts egy programot, ami egy rendszer felhasználóit kezeli. Hozz létre egy User osztályt, amiben tárolhatod külön a vezeték és utóneveket. Az osztálynak legyen egy függvénye, amit meghívva megjelenik a felhasználó teljes neve.
4. Származtass egy osztályt az előző User osztályból EnglishUser néven. Az EnglishUser-ben írd felül a név megjelenítő függvényt úgy, hogy az angol sorrendnek megfelelően írja ki a nevet.