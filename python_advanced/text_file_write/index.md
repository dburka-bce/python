# Szöveges fájl írása
Egy szöveges állomány írása valamivel összetettebb feladat, mint annak olvasása. Ennek oka, hogy az operációs rendszernek zárolnia kell a fájlt az írás idejére annak érdekében, hogy abban ne tudjon egyszerre két folyamat is módosításokat végezni. Enélkül könnyen előfordulhatna, hogy elvesznek a módosítások.

## Fájl megnyitási módok
Pythonban ugyanazzal a paranccsal nyitjuk meg a fájlokat írás és olvasás esetén is, csak az éppen aktuális teendőnek megfelelő módot kell kiválasztani. A létrejövő fájl alapértelmezetten az eredeti kódunk mellé fog kerülni. 
```python
f = open("teszt.txt", "w")
f.write("Lorem ipsum dolor sit amet, consectetur adipiscing elit ...")
f.close()
```
Az `open` függvény második paramétere adja meg a megnyitás módját.  A lehetséges módok az alábbi táblázatban láthatók. A paraméter opcionális, az alapértéke `"r"`.

|Mód|Funkció|
|:-:|:-|
r|Olvasási mód
w|Írás mód. Automatikusan (rákérdezés nélkül) felülírja a fájlt, ha már létezett. Ha nem létezik a fájl, akkor létrehozza.
a|Hozzáfűzés mód. Az írás mód egy változata. Egy létező fájl végéről indulva fűzi hozzá az újonnan írandó sorokat. Ha nem létezik a fájl, akkor létrehozza.
x| Csak létrehozza a fájlt. Hibát dob amennyiben már létezik a fájl.

Az `"x"` kivételével mindegyik módnak van egy `"+"` jellel bővített változata, mely valamilyen módosítási / olvasási funkcióval bővíti a lehetőségeket. Nekünk bőven elég az alap módok használata, de a teljesség kedvéért itt egy összehasonlító táblázat a különbségekről.

||r|r+|w|w+|a|a+|x|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
Olvasás|X|X||X||X|
Írás||X|X|X|X|X|
Létrehozás|||X|X|X|X|X
Pozíció a fájl elején|X|X|X|X||
Pozíció a fájl végén|||||X|X|

## `with` utasítás
Fájlba írás esetén különösen fontos, hogy mindenképp bezáródjon a fájl, hiszen ha lezárva marad, akkor jó eséllyel az operációs rendszer újraindításáig nem fogunk tudni hozzáférni. Könnyen előfordulhat azonban, hogy a fájlba írás algoritmusában valami hiba történik (pl.: elmarad egy típuskonverzió). De, mivel a Python egy interpreteres nyelv, és a futtatása sorról sorra történik, ez azt fogja eredményezni, hogy nem jutunk el a `close` függvény hívásáig, és a fájl nyitva marad.

A `with` utasítás arra szolgál, hogy ideiglenes "erőforrásokat" kezeljünk. Ezeknek az erőforrásoknak csak az utasítás hatósugarában szabad létezniük, és utána meg kell szűnniük. Erre tökéletes példa a fájl megnyitása.

```python
with open("teszt.txt", "w") as f:
    f.write("Lorem ipsum dolor sit amet, consectetur adipiscing elit ...")
```
Az `f` változón keresztül érhetjük el a betöltött állományt, de a változó tartalma törlődik a `with` blokk elhagyása után. Feltűnhet a példában, hogy nincs `close` függvény hívás. A `with` ugyanis a változó ürítésén túl erről is gondoskodik. Így nem kell kiírni a bezárás utasítást, és a `with` hatókörén belül történő hiba esetén is bezárásra kerül az állomány. A továbbiakban ezért ezt a megközelítést fogjuk alkalmazni.

## Fájlba írás
Az előző példákban az olvasás `read` függvényének megfelelő `write` függvénnyel írattunk ki egy standard "[Lorem ipsum](https://www.lipsum.com/)" szöveget. Ennek a különböző változatai nagyon hasonlítanak az olvasás kapcsán megszokott lehetőségekhez, bár valamivel limitáltabbak.
```python
lista = ["Első sor\n", "Második sor\n", "Harmadik sor\n"]

with open("teszt.txt", "w") as f:
    f.write("Hello\n")        
    f.writelines(lista)
```
```
Hello
Első sor
Második sor
Harmadik sor

```
A `write` függvény a megadott szöveget írja ki, míg a `writelines` a [szekvencia típusként](/python_basic/sequence_types/) felsorolt szövegeket fűzi össze, majd ezeket írja ki.  (A kód alatti példa most nem az output, hanem a fájl tartalma.) Jól látható, hogy a lista előzetes összefűzését előre elvégezve, a `writelines` opció felesleges. Utóbbi hátránya még, hogy ha egységesen kezeljük a sorok végén a sortörést (pl.: egy ciklus által generált sorok esetén), akkor a fájl végére egy üres sor kerül az extra sortörés miatt.

Ebben segíthet nekünk a `join` függvény. Ez egy a [karakterláncokhoz](/python_basic/variables_text/) kapcsolódó függvény, mely a paraméterként átadott lista elemeit fűzi össze úgy, hogy a kiinduló karakterláncot használja elválasztónak, és végül az összefűzött szöveget adja vissza. Az előző példát ezzel megvalósítva:
```python
lista = ["Első sor", "Második sor", "Harmadik sor"]

with open("teszt.txt", "w") as f:
    f.write("Hello\n")        
    f.write("\n".join(lista))
```
```
Hello
Első sor
Második sor
Harmadik sor
```
Ha pedig szeretnénk minimalizálni a fájl nyitva tartásának az idejét, akkor egyetlen szöveges változóba előre felgyűjthetjük a kimenetet, és így elég lesz az íráskor egyetlen utasítást végrehajtani. (Valós problémák esetén előfordulhat, hogy ezzel a megoldással feleslegesen sok memóriát emésztünk fel!)
```python
lista = ["Első sor", "Második sor", "Harmadik sor"]
kimenet = "Hello\n" + "\n".join(lista)

with open("teszt.txt", "w") as f:
    f.write(kimenet)
```

## Feladatok
1. Hozz létre egy listát, amiben a hét napjai szerepelnek. Írd ki ezeket egy "napok.csv" fájlba úgy, hogy a napok pontosvesszővel legyenek elválasztva az első sorban, a másodikban pedig a napok hossza szerepeljen (szintén pontosvesszővel elválasztva).
2. Írj egy függvényt, aminek az első bemenő paramétere egy fájlnév, a második egy szövegekből álló lista. (A bemeneteket nem kell ellenőrizni, felteheted, hogy rendben vannak.) A függvény írja a lista elemeit soronként a megadott fájlba.
3. Az előző feladatban szereplő függvényt módosítsd úgy, hogy az első sorba pontosvesszővel elválasztva kerüljenek a szövegek. A második sorban ugyanez a tartalom legyen eltolva úgy, hogy a szöveg lista első eleme a sor végére kerüljön. Ezt folytasd egészen addig, míg újra előáll az eredeti sor, de azt már ne írd a fájlba.
