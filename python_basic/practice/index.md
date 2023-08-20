# 1. feladat
A szallitasok.txt UTF-8 kódolású szövegfájl egymással kereskedő (fiktív) országok kereskedelmi kapcsolatainak adatait tartalmazza. Minden egyes szállításnak egy sor felel meg. A sorok szóközzel elválasztva tartalmazzák az eladó ország nevét, a vevő ország nevét, a szállítás kezdetének és befejezésének napját, a szállított áru megnevezését, valamint a szállítás idejét napokban. Az országok és az áruk neve minden esetben egyetlen szóból áll.

Mintaképpen a fájl első három sora a következő:

```
Kanatima Duncsek 2012.04.04 2012.04.18 farönk 14
Bundország Lakózia 2012.04.05 2012.05.03 kukorica 28
Kanatima Mereszász 2012.04.05 2012.04.16 szarvasmarha 11
```

Például az első sorban az eladó ország neve Kanatima, a vevő ország Duncsek, a szállítás kezdete 2012.04.04, befejezése 2012.04.18 és a szállított áru a farönk, a szállítás ideje 14 nap.

Feladatok

1. Listázzuk azon szállítások adatait, ahol Kanatima az eladó!
2. Jelenítsük meg a leghosszabb ideig tartó szállítás adatait! (Ha több ilyen is van, akkor elég a sorrend szerint legelsőt megadni)
3. Egy szállítás ideje gyors, ha 10 napnál rövidebb idő alatt lezajlik. Ha a szállítási idő 10 és 20 nap közé esik (a határokat is beleértve), akkor a szállítás ideje megfelelő. Egyéb esetben a szállítási idő lassú. Listázzuk minden szállítás esetén csak az eladó és a vevő nevét, valamint a szállítási idő minősítését (gyors, megfelelő vagy lassú)!
4. Számítsuk ki és jelenítsük meg, hogy 2012. 6. hónapjában hány szállítás érkezett meg Bundországba!
5. Jelenítsük meg az első olyan szállítás adatait, ahol a szállítás kezdete és vége külön évre esett!

# 2. feladat
Egy egyetem hallgatóinak tanulmányi eredményeit a következő adatszerkezet tartalmazza:

```
[
[hallgató neve, neptun kódja,  [tantárgy neve, kredit érték, jegy], [tantárgy neve, kredit érték, jegy] ...],
...

[hallgató neve, neptun kódja, [tantárgy neve, kredit érték, jegy], [tantárgy neve, kredit érték, jegy]...]
] 
```

Mintaadatok: 
```
adatok = [
['Kiss Béla','ABCDEF' ,  ['Matematika', 3, 'jeles'], ['Fizika', 4, 'jó']],
['Nagy Ivett', 'AIAIAI', ['Programozás', 20, 'közepes'], ['Informatika alapjai', 7, 'jeles'], ['Adatbáziskezelés', 3, 'elégtelen']],
['Budai Szilvia', 'XXXYYY', ['Matematika', 2, 'közepes'], ['Statisztika', 5, 'elégtelen'], ['Informatika alapjai', 7, 'elégséges'], ['Programozás II.', 4, 'jeles']]
] 
```

A tantárgyak száma előre nem meghatározott, de minden hallgató tanul legalább egy tantárgyat. 
A hallgatók száma szintén nem rögzített, de legalább két hallgató adatai rendelkezésre állnak.

Például Kiss Béla (ABCDEF) a 3 kreditet érő Matematikából jeles, a 4 kredites Fizikából jó, 
Nagy Ivett (AIAIAI) a 20 kredites Programozásból közepes, a 7 kredites Informatika alapjaiból jeles, és a 3 kredites Adatbáziskezelésból elégtelen. 
Budai Szilvia (XXXYYY) a 2 kredites Matematika tantárgyból közepes, az 5 kredites Statisztikából elégtelen, a 7 kredites Informatika alapjaiból elégséges, és a 4 kredites Programozás II. tantárgyból jeles. 

Feladatok (a fenti adatokat felhasználva):
1. Listázzuk az egyes hallgatók nevét és osztályzatait!
2. Listázzuk azon hallgatók nevét, akik minden tárgyukat sikeresen teljesítették (azaz nincs elégtelenjük)!
3. A félév teljesítéséhez legalább 12 kreditet kell teljesíteni. Listázzuk a félévet sikeresen teljesítók nevét és az általuk megszerzett kreditek összegét!
4. A tanulók átlagát a sikeresen teljesített tantárgyak eredményeiből számolják. Ha az átlag legalább 3.5, akkor a tanuló ösztöndíjat kap. Az ösztöndíj összegének képlete: ösztöndíj = 150000 - (5.0-átlag)*100000. Listázzuk az ösztöndíjas hallgatók nevét, átlagát és az ösztöndíj összegét!
5. Technikai okok miatt a hallgatók Neptun-kódját megváltoztatják. Ezentúl a kód a következőképpen képződik (csupa nagybetűkkel): keresztnév első betűje + keresztnév hossza + keresztnév utolsó betűje + vezetéknév első betűje + vezetéknév hossza + vezetéknév utolsó betűje. Végezzük el a szükséges módosításokat, majd listázzuk a hallgatók nevét és az új Neptun-kódjukat! (feltehetjük, hogy a vezetéknév illetve a keresztnév mindig egy-egy szóból áll)

+1. Rögzítsük a fenti adatszerkezetbe egy új tanuló eredményeit a megfelelő adatok bekérésével! A rögzítés után jelenítsük meg a lista tartalmát!
