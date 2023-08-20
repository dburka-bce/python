# Szöveges fájl olvasása
A legtöbb programozási nyelvhez hasonlóan a Python is lehetővé teszi fájlok létrehozását, olvasását és írását. A fájl tartalmazhat normál szöveget (text fájl), vagy a számítógép számára értelmezhető byte sorozatot (bináris fájl). 

Ebben a pontban csak szöveges fájlok olvasásával foglalkozunk. Ennek során három tevékenységet végzünk:
* Megnyitjuk a fájlt
* Kiolvassuk a számunkra szükséges információt
* Lezárjuk a fájlt

## Szöveges fájl megnyitása
A szöveges fájl megnyitása az [**open()**](https://www.programiz.com/python-programming/methods/built-in/open) függvény segítségével történik, amelynek egyetlen kötelező paramétere a fájl neve. A függvény egy fájl objektumot ad vissza, amelyet egy változóban tárolhatunk, pl. a "nevsor.txt" nevű fájl megnyitása következő módon történik:
``` python
f = open("nevsor.txt")
```
Amennyiben a fájl nem az aktuális mappában van, akkor a névvel együtt az elérési utat is meg kell adni, mint ahogyan azt a következő példa is mutatja (a \ jelet speciális funkciója miatt ilyenkor duplán kell írni vagy a karaktersorozat elé egy r betűt kell tenni):

``` python
f = open("c:\\users\\user1\\proba.txt")
```
Az [**open()**](https://www.programiz.com/python-programming/methods/built-in/open) függvény számos opcionális paraméterrel rendelkezik. Ezek közül a legfontosabb a _fájl megnyitás módja_ (mode), amely alapértelmezésben olvasás ("r"), de lehet szó írásról ("w") és hozzáfűzésről ("a") is. Ezek mellett léteznek [**egyéb fájl megnyitási módok**](python-file-and-file-modes.htm) is, de most csak az olvasásra való megnyitással foglalkozunk. Az előző utasítást írhattuk volna a következő formában is:
``` python
f = open("c:\\users\\user1\\nevsor.txt", "r")
```
Az opcionális paraméterek közül fontos lehet a karakterkódolás megadása, amelyet az _encoding_ paraméter segítségével lehet megadni. Erre akkor lehet szükség, ha a nem a Python alapértelmezett kódolását használjuk. Ez a legtöbbször [UTF-8](https://hu.wikipedia.org/wiki/UTF-8), de a következő példa szerint megnyithatunk [ASCII](https://hu.wikipedia.org/wiki/ASCII) kódolású fájlt is:
``` python
f = open("c:\\users\\user1\nevsor.txt", mode="r", encoding = "ascii")
```

## Szöveges fájl tartalmának olvasása

Egy szöveges fájl tartalmát csak _szekvenciálisan_ érhetjük el. A fájl megnyitása után az aktuális pozíciót jelző fájlmutató a fájl elejére mutat, innen többféle módon is haladhatunk:
* Olvashatjuk a fájl teljes tartalmát egy lépésben is a fájl típusú objektum [**read()**](ref_file_read.asp), illetve a [**readlines()**](ref_file_readlines.asp) metódusok meghívásával. Előbbi az egész tartalmat egyetlen karaktersorozatba teszi, utóbbi pedig egy listába, amely a sorokat (mint karaktersorokat) tartalmazza.
* Olvashatunk egyszerre 1 vagy több sort a [**readline(n)**](file_readline.htm) metódus segítségével, ahol n az olvasandó sorok száma.  A metódus minden sor végére (az utolsót kivéve) egy  EOL (end of line) karaktert (sorvég jel) helyez el, amely alapesetben az új sor (\n) karakter. Ha elértük a fájl végét, akkor a metódus üres karaktersorozatot ("") ad vissza.
* Olvashatunk egyszerre 1 vagy több karaktert a [**read(n)**](ref_file_read.asp) metódus segítségével, ahol n az olvasandó karakterek száma

Fontos megjegyezni, hogy minden olvasás után a fájlmutató a következő olvasandó egységre (pl. sorra) lép. Ez egészen addig tart, amíg el nem érjük a fájl végét. 

A fájlmutatót egyébként a [**seek()**](file_seek.htm) metódussal pozícionálhatjuk. Pl. a fájl objektum seek(0) metódushívásra a fájlmutató a fájl elejére áll:
```python
f.seek(0)
```
 Hasznos még a [**tell()**](file_tell.htm) metódus ismerete is, amely az a fájlmutató aktuális pozícióját adja vissza. 
```python
print(f.tell())
```
A [**seek()**](file_seek.htm) és a [**tell()**](file_tell.htm) metódusok használatakor vigyázni kell, mert byte egységekkel dolgoznak, amely [**nem mindig egyezik meg**](http://people.ubuntu.com/~kelemeng/.ufp3/files.html) a [**read()**](ref_file_read.asp) által (szövegfájl esetén) olvasott karakterekkel. Pl. ha az 5. byte-ra ugrunk, az nem feltétlenül az 5. karaktert jelenti.
## Szöveges fájl lezárása
A szöveges fájlok feldolgozása általában ciklus segítségével történik. A munka végén a fájlt javasolt a [**close()**](file_close.htm) metódus meghívásával lezárni ([**lehetőség van automatikus lezárásra is**](https://cmdlinetips.com/2016/01/opening-a-file-in-python-using-with-statement/)), pl:
```python
f.close()
```
## Példa
Nézzünk egy példát a fentiekre, amelyben megnyitjuk a nevsor.txt fájlt, tartalmát soronként kiiratjuk, majd a fájlt lezárjuk.
```python
f = open("c:\\users\\user1\nevsor.txt", "r")
sorok = f.readlines()
for s in sorok:
   print(s)
f.close()
```
Megjegyzés: 
A fájl műveletek sok esetben futási hibát okozhatnak, pl. ha nem létező fájlra hivatkozunk. Ezért a gyakorlatban a fájlok kezelését sokszor un. [**kivételkezelés**](https://sajozsattila.home.blog/2020/02/26/kivetelkezeles-pythonban/) segítségével oldják meg, ez nem képezi részét ezen kurzus tananyagának. A [**kivételkezelés**](https://sajozsattila.home.blog/2020/02/26/kivetelkezeles-pythonban/) lehetővé teszi a hasonló hibák kezelését anélkül, hogy a program "elszállna".

## Tagolt fájl feldolgozása
A szöveges állományok gyakran táblázatos formában tárolnak adatokat, és ilyen esetekben valamilyen tagoló karakter(sorozat) segítségével választják el az egyes oszlopok adatait. A tagoló lehet akár egy szóköz, egy tabulátor, de a leginkább elterjedt a `csv` (Comma Seperated Values) fájlformátumban használt vessző. Utóbbi eltérően működik magyar nyelven, ugyanis nálunk az angollal ellentétben a számok tizedes vesszőt tartalmaznak pont helyett. Így nyilván nem lehetne nem egész értékeket tárolni, hiszen beolvasáskor nehéz lenne meghatározni mi elválasztó vessző, ezért a magyar `csv` állományok pontosvesszőt használnak tagolásra.

Pythonban (és a legtöbb nyelvben) a tagolt tartalmak beolvasását a `split` függvény segíti elő. Ez egy a karakterláncokhoz tartozó függvény, mely a paraméterként megadott (alapértelmezett szóköz) karakter mentén szétdarabolja az aktuális karakterláncot, és eredményül egy darabokból álló listát ad vissza.

```python
f = open("c:\\users\\user1\nevsor.txt", "r")
sorok = f.readlines()
for s in sorok:
   sor = s.split(" ")
   print(sor[0])
f.close()
```
A fenti példa `nevsor.txt`-ben szereplő nevek közül az első sorban szereplő vezetéknevét jeleníti meg.

## Feladatok
A feladatok megoldásához a nevsort.txt fájl legyen az aktuális mappában.

1. Készítsünk programot, amely listázza a fájl első két sorát! A nevek csupa nagybetűvel jelenjenek meg!
2. Készítsünk programot, amely megszámolja és kiírja a fájlban található karakterek számát!
3. Készítsünk programot, amely megmondja, hogy "Tóth Ottó" szerepel-e a névsorban! (Igen vagy Nem)
4. Készítsünk programot, amely a fájlban lévő neveket névsor szerint sorba rendezve jeleníti meg!
5. Készítsünk programot, amely a fájlban lévő neveket vesszővel elválasztva listázza!
6. Készítsünk programot, amely a fájlban lévő nevek közül csak a vezetékneveket jeleníti meg, azok közül is csak minden másodikat! (Feltételezzük, hogy egy sorban csak egy név található, és ebből a vezetéknév az első szó)