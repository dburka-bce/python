# Osztályok
Az *Objektum Orientált Programozás* (OOP) a szoftver fejlesztés egyik leghatékonyabb megközelítése. A legtöbb modern programozási nyelv ezen az elven épül fel, többek között azért, mert átláthatóbbá teszi a kód struktúráját, és ezzel nagyban megkönnyíti a fejlesztők közötti kommunikációt és csapatmunkát.

Az OOP alapját az objektumok és az őket leíró osztályok alkotják. Egy osztály egy adott típusú objektum általános viselkedését írja le, míg az objektumnak magának lehetnek ezen felül saját egyedi tulajdonságai. Az osztály intuitíve egyformának ítélt objektumokat foglal egységbe. Számos valós analógiát lehet találni erre a felépítésre. Vegyük például az állatok osztályozását (a név egyezőség nem véletlen). Tekintsünk el a pontos terminológiától, és mondjuk azt, hogy a *Macska*, mint fogalom egy osztály, és a bele tartozó állatoknak (objektumoknak) számos olyan tulajdonsága van, ami mindegyikükre igaz. Például mind emlősök, négylábúak, ragadozók és igazi rohadékok tudnak lenni... Egy háziállatként tartott macskának általában van neve is, így ez is egy közös tulajdonság, ám egy konkrét macska neve már viszonylag egyedi, például: Cirmi.

Az objektumok az őket leíró osztály minden tulajdonságával rendelkeznek, de ezen tulajdonságok konkrét értékei már az adott objektumhoz tartoznak. Egy adott osztálynak megfelelő objektum létrehozását **példányosításnak**, a létrehozott objektumot pedig az osztály egy **példányának** nevezzük. 

Az objektum orientált programozás lényege, hogy a kód a különböző objektumok interakcióiból épül fel. Az osztályok által leírt objektumoknak vannak különböző adattípusú változók által meghatározott tulajdonságai, saját függvényei és lehetséges eseményei, melyek bekövetkezése alkalmával futnak le az egyes kódrészletek. Az objektumok kiválthatják más objektumok eseményeit, vagy meghívhatják a függvényeiket, így folytatva a program futását.

## Példa
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
A példában sok az újdonság. A `Macska` osztály leírásában két függvény található. (Ezeknek a definíciójára már láttunk példát, de részletesebben majd később foglalkozunk velük.) Az első `__init__` nevű függvény speciális. Ez az osztály **konstruktora**. Az ezen belül írt kód minden osztály példányosítás során lefut. Tipikusan a kezdő értékek beállítására szokás használni.

Ebben a példában az osztálynak három tulajdonsága van: Név, Szín és az Életek száma. Az osztály minden függvényének van egy speciális első paramétere, ami mindig az osztály aktuális példányát jelöli. A paraméterváltozót általában `self`-nek szokás nevezni, de bármilyen név adható neki. A ponttal való összefűzéssel tudunk az osztály példány egyes elemeire (tulajdonság, függvény, esemény) hivatkozni. A példában definiáljuk a három tulajdonságot és kezdő értéket adunk nekik. (Pythonban nem lehet kezdőérték nélküli tulajdonságot létrehozni.) A `self.név` ugyanúgy működik, mint egy hagyományos változó. Értéket lehet neki adni, használni lehet, de a lényeg, hogy az osztály hivatkozás birtokában bármikor könnyen elérhető.

A második függvény egy az osztályhoz tartozó függvény, ami csak az osztály példányai számára érhető el. Ilyen például a karakterlánc adattípus (osztály) számára elérhető `isnumeric()` függvény is. Ebben az esetben a `nem_talpra_esett()` függvény meghívásával azt jelezzük, hogy a konkrét `Macska` példányunkat baleset érte, ezért eggyel lecsökkent a megmaradt életeinek száma.

Az osztály definíció alatt van egy példa az osztály használatáról. A `Macska()` utasítással létrehozunk egy példányt a `Macska` osztályból, és a `cica` változóval hivatkozunk rá a továbbiakban. A `cica`-ban található példány neve ezen a ponton az alapértelmezett "Cic", "Fekete" a színe, és újszülöttként 9 élete van.

A `cic.Név = "Cirmi"` sorral nevet adunk az aktuális cicánknak, de egy újabb példány létrehozásakor az új cicának továbbra is "Cic" marad az első neve. A `cica.nem_talpra_esett()` függvényt meghívva lefut annak tartalma, ezért a cicánk életeinek száma lecsökken.  Az egyes értékeket kiíratva látszódnak a változások.

Az osztályok segítségével egységben kezelhetjük az egybe tartozó adatokat, és a velük végzett műveleteket is a releváns adattípusokra korlátozhatjuk. Az itt bemutatott példa csak ízelítő, és töredékét nem mutatja meg az objektum orientált programozás lehetőségeinek. De remélhetőleg segít jobban megérteni a Python kódok felépítését.