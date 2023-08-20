# Gyakorló feladatsor

A feladat a rendelkezésre álló adatok alapján a legboldogabb Európai országok, és azok alkoholfogyasztási mutatójának megjelenítése.

## Adatok beolvasása
1.	Hozz létre egy függvényt, aminek a bemeneti paramétere egy fájlnév, a kimenete pedig egy lista lesz.
2.	A függvényben olvasd be a megadott nevű fájlt, és töltsd be a sorait egy listába.
3.	A fájl bezárását követően töröld az első sorban levő fejlécet.
4.	Végül a függvény térjen vissza az újonnan feltöltött listával.
5.	Töltsd le a “HappinessAlcoholConsumption.csv” fájlt, és másold a kódod mellé. Hívd meg a függvényt a fájl nevével, és a visszatérési értéket írd egy változóba.

## Adatfeldolgozás
1.	Hozz létre egy függvényt, aminek a bemenete és kimenete is egy lista, és dolgozd fel az előző blokkban beolvasott adatokat.
2.	A függvényben hozz létre egy üres listát, és ebbe töltsd majd bele a módosított sorokat.
3.	Menj végig a bemeneti lista sorain. Töröld le a sorok végéről a sortörést, és darabold fel a sorokat a határoló karakterek mentén.
4.	Minden sorhoz hozz létre egy új listát, és ez eredeti sor alapján az alábbi értékekkel töltsd fel. 
    - Ország (Country_Name) - Szövegként
    - Régió (Region) - Szövegként
    - Boldogság pont (HappinessScore) - Tört számként
    - Sörfogyasztás (Beer_PerCapita) - Egész számként
    - Rövidital fogyasztás (Spirit_PerCapita) - Egész számként
    - Borfogyasztás (Wine_PerCapita) - Egész számként
5.	Az így kapott listát add hozzá az első üres lista elemeihez, majd végül a függvény ennek az összevont listának a tartalmával térjen vissza.
6.	Hívd meg a függvényt az előző blokkban a fájlból beolvasott listával, és az eredményt mentsd egy változóba.
 
## Régió szűrés
1.	Kérj be egy értéket a felhasználótól, amivel szűrhet a régió oszlopra.
2.	Az adatbekérés után hívd meg a következő pontban létrehozandó függvényt és a kimenetét mentsd el egy változóba. Ha a kimenet egy üres lista, akkor figyelmeztesd a felhasználót és kérd be újra a szűrő értéket mindaddig, amíg létező régiót nem ad meg.
3.	Hozz létre egy függvényt, aminek a bemenete az előző feladat eredményeképp előállt lista és a bekért szűrő szöveg, a kimenete pedig egy szűrt lista lesz.
4.	A függvényben hozz létre egy új, üres listát, amibe a sorokat gyűjtöd majd.
5.	Egy ciklussal menj végig a bemeneti lista elemein. A sorokban a „Region” oszlopban levő értéket darabold fel a szóközök mentén. Csak akkor add hozzá a lista aktuális sorát az új listához, ha a szűrő érték szerepel a „Region” alapján előállt listában.
> Ezzel a lépéssel elérhetjük, hogy a "Europe" szűrőparaméterrel az összes európai országot elérjük az eredmények között.
6.	A függvény térjen vissza a szűrt listával.
7.	Hívd meg a függvényt paraméterként átadva a feldolgozott listát és a megadott régiót. Mentsd ez eredményt egy változóba.

## Számítások  és vizualizációk
1. Alakítsd át a szűrt lista oszlopait numpy tömbökké. 
2. Számítsd át a sör, tömény és bor értékeket literré (a fogyasztott sör 250ml, a tömény 25ml, a bor 87,5ml-es alcohol unitban van megadva), tárold ezeket új tömbökben.
3. Számítsd ki az összegzett alkoholfogyasztást egy új tömbbe: a sör 4%, a tömény 40%, a bor 8% alkoholt tartalmaz.
4. Jelenítsd meg a különféle tiszta alkoholfogyasztásokat hisztogramon.
5. Jelenítsd meg a választott régió országainak tiszta  alkoholfogyasztását egy kördiagrammon. 
6. Hozz létre egy három subplotból álló ábrát, ami három külön oszlopdiagramon mutatja a választott régi országainak literben számított sör-bor-töményfogyasztását. Nézd meg a plt.xticks() metódus súgóját, és próbáld elérni, hogy a felső két ábrán ne látszódjon az x tengelyen felirat, illetve hogy az alsó ábrán a címkék 90 fokkal elforgatva jelenjenek meg.

