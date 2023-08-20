
# 1. Minta ZH
A feladat egy adott ország olimpiai éremtáblázatának lekérdezése, de csak azokban az években, amik 0-ra végződnek.

1. Adatok beolvasása (10 pont)
	1. Hozz létre egy függvényt, aminek a bemeneti paramétere egy fájlnév, a kimenete pedig egy lista lesz.
	2. A függvényben olvasd be a megadott nevű fájlt, és töltsd be a sorait egy listába.
	3. A fájl bezárását követően töröld az első sorban levő fejlécet.
	4. Végül a függvény térjen vissza az újonnan feltöltött listával.
	5. Töltsd le a korábbi órai feladathoz tartozó "Summer_olympic_Medals.csv" fájlt, és másold a kódod mellé. Hívd meg a függvényt a fájl nevével, és a visszatérési értéket írd egy változóba. 

2. Adatfeldolgozás (15 pont)
	1. Hozz létre egy függvényt, aminek a bemenete és kimenete is egy lista, és dolgozd fel az előző blokkban beolvasott adatokat.
	2. A függvényben hozz létre egy üres listát, és ebbe töltsd majd bele a módosított sorokat.
	3. Menj végig a bemeneti lista sorain. Töröld le a sorok végéről a sortörést, és darabold fel a sorokat a határoló karakterek mentén.
	4. Minden sorhoz hozz létre egy új listát, és ez eredeti sor alapján az alábbi értékekkel töltsd fel.
		* Év (Year) - Egész számként
		* Ország (Country_Name) - Szövegként
		* Arany (Gold) - Egész számként
 		* Ezüst (Silver) - Egész számként
 		* Bronz (Bronze) - Egész számként
	5. Az így kapott listát add hozzá az első üres lista elemeihez, majd végül a függvény ennek a listának a tartalmával térjen vissza.
	6. Hívd meg a függvényt az előző blokkban a fájlból beolvasott listával, és az eredményt mentsd egy változóba. 

3. Ország adatainak kiírása (10 pont)
	1. Kérd be a felhasználótól az általa választott ország nevét. A bevitt adaton nem kell ellenőrzést végezni.
	2. Egy ciklussal menj végig a feldolgozott listád sorain, és írd ki azoknak a soroknak a tartalmát, amelyekben az ország neve egyezik a felhasználó által bevitt névvel.
	3. Számold meg, hogy hány sort írtál ki a ciklusban, és ha egyetlen sor sem került kiírásra (tehát, ha nem jó értéket adott meg a felhasználó), akkor írd ki, hogy "Nincs találat", és addig ismételd ezt a blokkot és az adatbekérést, amíg a felhasználó olyan bemenetet ad, aminek van eredménye.

4. Éremtáblázat (10 pont)
	1. Az előző feladat 2. pontjában a kiírást módosítsd úgy, hogy ne a teljes sor jelenjen meg, hanem tabulátorokkal elválasztva látszódjon rendre az év (Year), az arany (Gold), az ezüst (Silver) és a bronz (Bronze) érmek száma.
	2. Módosítsd úgy a megjelenítést, hogy az eredményül kapott táblázatnak fejléce is legyen, amiben rendre az "ÉV", "ARANY", "EZÜST" és "BRONZ" szavak szerepelnek.
	3. Bővítsd ki a feltételeket úgy, hogy csak a nullára végződő évek sorai jelenjenek meg.
    4. Bővítsd tovább a feltételeket úgy, hogy legfeljebb az elmúlt 50 évben rendezett olimpiák jelenjenek meg. A `datetime` csomag felhasználásával kérd le az aktuális dátumot, és ahhoz viszonyítva számolj.

5. Fájlba írás (5 pont)
	1. Az előző blokk táblázatának szövegét kiírás helyett egyetlen szöveges változóba írd. Az utolsó sor végén ne legyen felesleges sortörés.
	2. Kérj be a felhasználótól egy értékét az alábbi szöveggel: "Kívánja fájlba menteni a táblázatot? (I/N)".
	3. Ha a felhasználó "i" vagy "I" karaktert ad meg, akkor írd ki a táblázatot egy "Táblázat.txt" nevű fájlba.
	4. Ha a felhasználó bármilyen másik értéket ad meg (tehát a hibás bemenetet is nemnek vesszük), akkor jelenítsd meg a táblázatot.