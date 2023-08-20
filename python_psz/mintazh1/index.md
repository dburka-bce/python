# 1. Minta ZH
A feladat egy adott ország olimpiai éremtáblázatának lekérdezése, de csak azokban az években, amik 0-ra végződnek.

1. Fájlból olvasás (15 pont)
	1. Hozz létre egy függvényt `load_data` néven. A függvénynek legyen egy bemenő paramétere, amiben a beolvasandó fájl nevét adod át. Hívd meg a függvényt a korábbi komplex feladathoz tartozó "Summer_olympic_Medals.csv" fájl nevével, és persze gondoskodj róla, hogy elérhető legyen a fájl a kód számára.
    2. A függvényben olvasd be a megadott nevű fájl sorait sorait egy listába. (Jegyzettömbbel megnyithatod magadnak a fájlt, hogy lásd a tartalmát.)
	2. A fájl bezárását követően töröld az első sorban levő fejlécet.
	3. Menj végig a lista sorain. Töröld le a sorok végéről a sortörést, és darabold fel a sorokat a határoló karakterek mentén. A sorokból ilyen módon kapott listákat töltsd bele egy újonnan létrehozott üres listába. Ez legyen a függvény visszatérési értéke.
    4. Módosítsd úgy a függvényhívást, hogy visszatérési értékét lementsd egy változóba. A további részek során az így lementett listával dolgozz.

2. Ország adatainak kiírása (20 pont)
	1. Hozz létre egy függvényt `get_country_data` néven. Hívd meg az előző pont lista beolvasása után, és bemenő értékként add át neki az adatokat tartalmazó listát. 
    2. A függvényben kérd be a felhasználótól az általa választott ország nevét. A bevitt adaton nem kell ellenőrzést végezni!
    3. A függvényen belül hozz létre egy üres listát `filtered_list`, amibe majd felgyűjtheted a paraméterként kapott listából kiválogatott sorokat.
	4. Egy ciklussal menj végig a listád sorain, és add hozzá azoknak a soroknak a tartalmát a `filtered_list`-hez, amelyekben az ország neve (Country_Name-re ellenőrizz, ne a Host_country-ra) egyezik a felhasználó által bevitt névvel.
	5. A függvény visszatérési értéke a `filtered_list` legyen, és a függvény hívást követően mentsd le az értékét egy változóba.
    6. Ha a visszakapott lista elemszáma nem nagyobb, nullánál (tehát, ha nem jó értéket adott meg a felhasználó), akkor írd ki számára, hogy "Nincs találat".
    7. Módosítsd az eddigi kódot úgy, hogy addig kérdezze újra az országnevet, amíg nincs találat. (Segítség: Ehhez egyik függvény belsejében sem kell módosítást végezni!)

3. Éremtáblázat (15 pont)
	1. Sikeres adatbekérést követően menj végig az előző feladatban létrehozott szűrt lista sorain és írd ki őket úgy, hogy tabulátorokkal elválasztva látszódjon rendre az év (Year), az arany (Gold), az ezüst (Silver) és a bronz (Bronze) érmek száma.
	2. Módosítsd úgy a megjelenítést, hogy az eredményül kapott táblázatnak fejléce is legyen, amiben rendre az "ÉV", "ARANY", "EZÜST" és "BRONZ" szavak szerepelnek.
	3. A kiíratást bővítsd ki egy olyan feltétellel, hogy csak a nullára végződő évek sorai jelenjenek meg.