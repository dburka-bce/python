# Adatkezelés feladat
Ebben a feladatban a korábban tanultakat egyesítve megvalósítunk egy számsorozat tárolására és szerkesztésére szolgáló szoftvert. Az elkészült program egy fájlban tárolja a számainkat, és induláskor betölti azokat. A felhasználónak az alábbi lehetőségei vannak:
1. A szám indexének megadása után átírhatja annak értékét.
2. Egy szám érték alapján megkeresheti annak indexét.
	* Ha nem található a keresett érték, akkor a hozzá legközelebbi indexet adja vissza.
3. Bezárhatja a programot

## Fájl beolvasása
1. Töltsd le a "szamok.txt" állományt a Moodle rendszerből, és helyezd el a kódodat tartalmazó fájl mellé.
2. Hozz létre egy konstans változót a kód elején, és tárold benne a fájlnevet.
3. Hozz létre egy függvényt, aminek a bemenete a fájlnév, a kimenete pedig egy számokból álló lista.
	1. Olvasd be a fájl sorait egy listába.
	2. Hozz létre egy üres listát.
	3. Menj végig a lista sorain. A sortörések eltávolítása után konvertáld a sorokat számmá, és add őket a listához. (Nem kell kezelni a konverziós hibákat, feltételezheted, hogy a fájl tartalma helyes.)
	4.  Add vissza a listát a függvényből.
4. Hívd meg fájl olvasó függvényt a korábban létrehozott változót használva bemenetként. A kimenetet mentsd egy `numbers` nevű változóba. (Tesztelés céljából ideiglenesen írd ki a változó értékét.)

## Főmenü
5. A főprogramban induláskor az alábbi szöveg látszódjon.
	```
	100 SZÁM ALKALMAZÁS

	Válassza ki a kívánt funkciót:
		M - Szám módosítása
		K - Szám index keresése
		Q - Mentés és kilépés
	```
6. A szöveg után kérj be egy értéket a felhasználótól, és írd meg az értékeknek megfelelő elágazást. 
	1. Ideiglenesen `pass`-t írj az egyes ágakba, vagy egy `print` üzenetet, hogy tudj tesztelni.
	2. Kisbetűt is fogadj el megfelelőnek. 
	3. Helytelen érték esetén írj ki egy hibaüzenetet.
	4. A fenti szöveg alsó felének megjelenítését és az adatbekérést addig ismételd, míg "Q"-t nem választ a felhasználó.

## Mentés (Q)
7. Írj egy függvényt, aminek egyik bemenő paramétere egy fájlnév, a másik egy számokból álló lista. (A bemenetek helyességét feltételezheted, nem kell ellenőrizni.)
	1. Hozz létre egy üres listát a szöveges értékek tárolására.
	2. Menj végig a bemeneti listán, és add hozzá az elemeit szöveggé konvertálva az előbb létrehozott listához.
	3. Fűzd össze a szöveges lista értékeit sortörések segítségével.
	4. Az eredményül kapott szöveget írd ki a bemenetként kapott fájlba. (Írd felül a fájlt, ha már létezik.)
8. Amennyiben a főmenüben a felhasználó "Q"-t választott, hívd meg a fájlba író függvényt értelemszerű argumentumokkal. Ezután írd ki a felhasználónak, hogy sikeres a mentés, majd állítsd le a program futását.

## Keresés (K)
A továbbiakban újabb ciklusok alkalmazásával kell majd kérdéseket adatbekéréseket megjeleníteni a felhasználó számára. Annak érdekében, hogy ne kelljen fél tucat behúzást alkalmaznunk a kódban, ezeket az adatbekéréseket függvénybe érdemes szervezni. A mostani példában olyan függvényeket fogunk írni, amik bekérik az aktuális adatot, és hiba esetén a hibaüzenet szövegével térnek vissza. Ha a kódban nem történt hiba, akkor pedig egyszerűen lefutnak, tehát a visszatérési értékük `None` lesz. Így az alábbi kódhoz hasonló megoldással lesz érdemes meghívni az adatbekérő függvényeinket:
```python
while True:
    result = function_name()        
    if(result == None):
        break
    else:
        print(result)
```
Ahol a `function_name` az éppen meghívott függvényünk neve. Látható, hogy hiba esetén megjelenik a visszakapott üzenet, és addig ismétlődik az adatbekérés, amíg minden rendben nem volt.

9. Hozz létre egy bemeneti paraméter nélküli függvényt a keresés funkció megvalósítására, és a "K" ágban, a fenti szerkezet használatával hívd meg a függvényt.
	1. A függvényben kérj be egy értéket a felhasználótól.
	2. Ha az érték üres, akkor térj vissza `None` értékkel. (Ezzel végeredményben a főmenübe léphet vissza a felhasználó.)
	3. Ha az érték nem szám, akkor térjen vissza a függvény egy ennek megfelelő hibaüzenet szöveggel.
	4. Ha az érték valóban szám, akkor keresd meg az értékhez tartozó indexet a listában.
	5. Ha megtalálható az index, akkor írd ki a felhasználónak, és térj vissza `None` értékkel.
	6. Ha nem található az index, akkor térj vissza egy erről szóló üzenettel.
> `None`-al való visszatéréshez elég annyit írni, hogy `return`, nem kell kiírni, hogy `return None`. 

## Módosítás (M)
A módosítás funkció a kereséshez hasonlóan függvényként valósul meg, de mivel az indexre és a módosított értékre is rá kell kérdezni, két egymásba ágyazott `while` ciklusra van szükség. Ehhez is a korábbi konstrukciót fogjuk használni, de most az első függvény végén hívjuk majd meg ciklus segítségével a másodikat.

10. Hozz létre egy bemeneti paraméter nélküli függvényt a módosítás funkció megvalósítására, és az "M" ágban, a korábbi szerkezet használatával hívd meg a függvényt.
	1. A függvényben kérj be egy indexet a felhasználótól.
	2. Ha az index üres, akkor térj vissza `None` értékkel. (Ezzel végeredményben a főmenübe léphet vissza a felhasználó.)
	3. Ha az index nem szám, akkor térjen vissza a függvény egy ennek megfelelő hibaüzenet szöveggel.
	4. Ha az index szám, akkor ellenőrizd, hogy kisebb-e, mint száz. Ha nem, akkor térj vissza megfelelő hibaüzenettel.
	5. A függvény végén kell majd a következő függvényt meghívni
11. Hozz létre egy új függvényt, aminek az index a bemenő paramétere, és ezt hívd meg az előző függvény végén a korábbi `while` szerkezet segítségével.
	1. A függvényben kérj be egy értéket a felhasználótól.
	2. Ha az érték üres, akkor térj vissza `None` értékkel. (Ezzel végeredményben a főmenübe léphet vissza a felhasználó.)
	3. Ha az érték nem szám, akkor térjen vissza a függvény egy ennek megfelelő hibaüzenet szöveggel.
	4. Ha az érték szám, akkor a megfelelő konverzió után írd felül az indexhez tartozó szám értékét a `numbers` listában az újonnan megadott értékkel.
	5. Írd ki a felhasználónak, hogy a módosítás sikeres, és térj vissza a függvényből `None` értékkel.