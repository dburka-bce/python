# 1. feladat - Olimpiai érmek
Ennek a feladatnak az a célja, hogy egy nagy példába sűrítve segítsen gyakorolni az eddig tanult ismereteket. A feladatban semmi újdonság nincs azon kívül, hogy lényegesen hosszabb, mint az eddig látott példák.

A  [*Kaggle*](https://www.kaggle.com/) weboldala egy regisztrációt követően számos érdekes, különböző forrásból származó adatforráshoz ad hozzáférést. [Innen](https://www.kaggle.com/ramontanoeiro/summer-olympic-medals-1986-2020) származik a mai gyakorlat során használt, olimpiai éremtáblázatokat tartalmazó *Summer olympic Medals.csv* is. A fájl pontos tartalmával kapcsolatban az eredeti weboldalon lehet tájékozódni, de viszonylag egyszerű a szerkezete.

A mai feladat célja, hogy egy olyan szépen kidolgozott alkalmazást fejlesszünk a rendelkezésre álló adatforrás segítségével, ami az olimpia évének és a vizsgált országnak a megadása után kiszámolja, hogy az adott ország hányadikként végzett a kiválasztott olimpián az országok rangsorában. A hagyományos sorrend számítást vesszük alapul, tehát a több aranyérem automatikusan jobb helyet eredményez, az ezüstérmek száma csak akkor releváns, ha az aranyak száma megegyezik, és természetesen a bronzérmek számát is hasonlóan kell kezelni.

A következő lépések megvalósításával építsd fel a programot. Próbáld a lehető legjobban követni az utasításokat: ha egy feladatrész (lásd 3.) azt kéri, hogy **törölj** egy sort a listádból, akkor ne írj feltételt a lista létrehozásához, hogy bele se kerüljön az érték, hanem valóban töröld. Ha valami nem egyértelmű, vagy esetleg elakadtál, akkor kérdezz nyugodtan a gyakorlatvezetőtől.

## Adatok betöltése
1. A program indulásakor jelenjen meg az "OLIMPIAI HELYEZÉSEK" felirat, hogy a felhasználó tudja mire való a program.
2. Olvasd be a Moodle rendszerből letölthető *Summer olympic Medals.csv* fájl tartalmát és tárold le a sorait egy listában. Ne felejtsd el bezárni a fájlt!
3. Töröld ki az első sort a beolvasott sorok közül. Ez a sor az oszlopfejléceket tartalmazza, a programban nincs rá szükségünk. Az eredeti fájlban viszont érdemes megnézni, mi is található az egyes oszlopokban.
4. Hozz létre egy üres listát, amibe felgyűjtheted a beolvasott sorok letisztázott változatait. Egy ciklussal menj végig a korábban beolvasott listádon. Távolítsd el a sorok végéről a felesleges sortörést, majd darabold fel a sorokat az adatokat határoló karakter mentén. A sorokból így előálló listákat add hozzá az előbb létrehozott üres listához úgy, hogy a végeredmény egy listákból álló lista legyen.

## Évek
5. Az előző ciklus létrehozása előtt hozz létre egy üres listát, amiben az évek lesznek tárolva. A ciklust egészítsd ki úgy, hogy a sorokból kiolvasható évek, egész számmá konvertálva bekerüljenek az új listába. De csak akkor adj hozzá egy évet a listához, ha az még nincs benne. Ebből a listából engedünk majd választani a felhasználónak.
6. A ciklus után rendezd sorba az éveket tartalmazó listát.
7. Kérd be a felhasználótól a kiválasztott évet.
8. Ellenőrizd, hogy számot adott-e meg. Ha nem, akkor jeleníts meg egy hibaüzenetet, és kérd be újra az évet.
9. Ha a felhasználónak sikerült számot megadnia, akkor ellenőrizd, hogy a szám szerepel-e az évek listájában (ne felejtsd el a típuskonverziót). Ha a szám nem szerepel az évek között, akkor írd ki számára, hogy az adott évben nem volt olimpia, és fűzd az üzenet végére, hogy az "évek" parancs megadásával lekérdezheti az olimpiai éveket. Ebben az esetben is kérdezd meg újra az évet.
10. Egészítsd ki a korábbi feltételeket úgy, hogy az "évek" szó megadására jelenjen meg az éveket tartalmazó lista minden eleme valamilyen formában. Ebben az esetben se felejtsd el, hogy újra be kell kérni az évet a megjelenítés után.

## Országok
11. Az év sikeres megadása után ( a bekérő ciklust követően) hozz létre egy üres listát az országok tárolására.
12. Egy ciklus segítségével az évekhez hasonló módon gyűjtsd fel a különböző országokat a listába. Ebben az esetben viszont arra is figyelj, hogy csak a megadott évnek megfelelő sorokból gyűjts adatot. Így csak az adott évben valóban résztvevő országok kerülnek a listába.
13. A ciklus után rendezd a listát név szerint.
14. Az ország lista előállítása után kérd be a felhasználótól a kiválasztott országot. Itt nincs szükség típuskonverzióra, de az évekhez hasonlóan itt is csak az országok listában található bemeneteket fogadd el. Amennyiben a felhasználó nem megfelelő értéket ad meg, akkor az "országok" paranccsal tudja lekérdezni a résztvevő országok listáját.


## Helyezés számítása
15.  Az ország sikeres bekérése után egy ciklussal menj végig az adataidon, és keresd meg azt a sort, ami megfelel a kiválasztott évnek és országnak. A sor tartalmát tárold le egy változóba. (Lényegében csak az egyes érmek számára leszünk kíváncsiak, tehát a sor lista helyett letárolhatod azokat is 1-1 változóba, vagy egy rövidebb listába.)
16. Hozz létre egy nulla értékű változót. Ebbe a változóba lesz majd összeszámolva a kiválasztott országnál jobban teljesítő országok száma.
17. Egy ciklussal újból menj végig az adataidon, és növeld a számláló értékét, ha az aktuális ország az érmei alapján jobban teljesített, mint a kiválasztott ország. Az ehhez kapcsolódó szabályokat fent olvashatod. Az összehasonlítás során lehetőleg csak egy elágazást használj egy összetett feltétellel. Ne felejtsd el, hogy csak a kiválasztott évhez tartozó sorok esetén szabad növelni a számlálót.
18. Jelenítsd meg az eredményt a felhasználó számára egy jól érthető üzenettel.

Megjegyzés: A kiválasztott országgal holtversenyben levő országok nem befolyásolják a helyezést. Ennek köszönhetően nem jelent problémát, hogy az ország a pontszáma alapján saját magával is "holtversenyben lenne". Ezért a ciklusban nem kell foglalkoznunk önmaga kiszűrésével.


