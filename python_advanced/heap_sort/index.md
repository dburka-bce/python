# Kupac rendezés
A kupac rendezés során egy úgynevezett kvázi teljes bináris fában helyezzük el és mozgatjuk az értékeinket. Egy bináris fa gyökerében egy érték van. A második szintjén tartozik ez alá (mivel lefelé építve szokás ábrázolni) két másik érték. A harmadik szinten az előző szint minden értéke alá tartozik 2-2 érték, tehát itt összesen 4 érték szerepel. A többi szint ehhez hasonlóan épül fel. Egy lista értékeit úgy tárolhatjuk egy ilyen fában, hogy szintről szintre, balról jobbra haladva, sorban beírjuk az értékeket a lehetséges helyekre. Így előfordulhat -- ha az elemeink száma nem kettő hatvány --, hogy az utolsó sort nem tudjuk végig kitölteni. Ilyenkor bár a bináris fa nem teljes, de "hézagok" sincsenek benne, ezért a "kvázi teljes" megnevezés.

Egy kupac egy olyan olyan kvázi teljes bináris fa, amiben bármelyik érték nagyobb, mint az alatta található két érték (és persze az azokból induló teljes ágak értékei). Érdekes módon egy kupac előállításának leggyorsabb módja nem az, hogy a megfelelő értékekből felépítjük. Gyorsabb, ha rendezetlenül beszórjuk az értékeket egy kvázi teljes bináris fába, majd felülről indulva a kisebb értékeket kicseréljük a náluk nagyobb, alattuk levő -- a kettő közül a nagyobbik --  értékkel. Ezt a műveletet szokás "süllyesztésnek" nevezni.

Sorban az összes érték esetén végrehajtva a süllyesztést az eredmény egy kupac, amiben biztosan tudjuk, hogy a legfelső gyökérelem a legnagyobb érték. A kupac rendezés során a listánkat kupaccá alakítjuk, majd a legfelső értéket kicseréljük a legalsó, legjobboldalibb elemmel. Ezt követően újra végrehajtjuk a süllyesztéseket, de már egy az eredetinél eggyel kisebb kvázi teljes bináris fán, tehát a már megtalált legnagyobb értéket figyelmen kívül hagyjuk. Így egy kisebb részfeladat megoldásával megkapjuk a második legnagyobb elemet. Ezt folytatva annyiszor, amennyi a listánk elemszáma, a végeredmény egy olyan fa, amiből az értékeket az eredeti beírás sorrendjében kiolvasva, az eredeti lista rendezett változatát kapjuk.

A kupac rendezés a leghatékonyabb rendező algoritmusok egyike. A megvalósítása során érdemes külön kezelni egy a süllyesztésről gondoskodó függvényt, amit rekurzívan is meg kell hívni. Ezen felül az első kupacba rendezés valamennyire eltér a későbbi iterációktól, hiszen az első körben a fa teljesen rendezetlen, míg a későbbi lépések során csak a legfelső érték van rossz helyen, így elég egyetlen ág mentén azt az egy értéket süllyeszteni, amíg szükséges. Nem kell minden elemen végigmenni.

### Süllyeszt
1. Hozz létre egy függvényt a "süllyesztés" implementálására.
2. A függvénynek legyen három bemeneti paramétere. Az első a teljes eredeti lista, a második az éppen süllyesztendő érték indexe (`i`), a harmadik pedig az az index, ami után már ignoráljuk a már helyére került értékeket (továbbiakban `r`).
3. Egy-egy változóban határozd meg az `i` index alatt balra és jobbra levő indexeket. A legfelső gyökér index a nulla, ebből kiindulva gondold át, hogyan számolhatsz. Gondolj arra, hogy a bináris fa utolsó sora mindig eggyel több elemet tartalmaz, mint az összes előtte szereplő sor együtt véve.
4. Ha a bal index nagyobb, mint `r`, akkor a vizsgált tartományban nem szerepel az `i` alatt található érték, tehát befejezhetjük a függvény futását.
5. Ha a bal index értéke egyezik `r`-el, akkor az azt jelenti, hogy ez az utolsó elem a tartományban, tehát a jobb index nincs a tartományban. Ilyenkor biztos, hogy a bal indexen szereplő értékkel kell összehasonlítani az `i` helyen levő értéket. A későbbi felhasználás érdekében mentsd le a bal indexet egy `j` változóba.
6. Ha a bal index kisebb, mint `r`, akkor meg kell vizsgálni, hogy a bal vagy a jobb indexhez tartozó érték a nagyobb. A nagyobbhoz tartozó indexet mentsd le a `j` változóba.
7. Hasonlítsd össze a lista `i`-edik és `j`-edik elemének értékét. Ha a `j`-edik nagyobb, akkor cseréld fel a kért értéket, majd hívd meg rekurzívan a "süllyesztés" függvényt, a `j` indexel (a lista és az `r` argumentum változatlan). Ez utóbbival a már lejjebb süllyesztett értéket fogod a következő szinten is ellenőrizni.

### Induló kupac
8. Hozz létre egy függvényt, ami az induló kupacot építi fel a listából. A függvény bemenet a lista legyen.
9. Keresd meg a lista középső indexét (lefele kerekíts az `int` függvénnyel).
10. Egy ciklussal menj végig csökkenő sorrendben a lehetséges indexeken a középsőtől az elsőig. (A többi index az utolsó sorra esne, ahol nem lenne értelme süllyeszteni, ezért kell kihagyni.)
11. A ciklustörzsben hívd meg a "süllyesztés" függvényt. Argumentumként add át a listát, az aktuális indexet és a lista utolsó indexét (hossz - 1).

### Kupac rendezés
12. Hívd meg az induló kupac függvényt.
13. Mentsd le az utolsó elem indexét egy változóba (továbbiakban `r`).
14. Ezen a ponton a lista első eleme a legnagyobb érték, ezért cseréld ki az első és az utolsó elem értékét.
15. Egy ciklussal folyamatosan csökkentsd az `r` értékét. (A ciklustörzsben első alkalommal a hossz - 2 értéket kell felhasználni.)
16. A ciklustörzsben hívd meg a "süllyesztés" függvényt úgy, hogy az első argumentum a lista legyen, a második fixen nulla, a harmadik pedig az `r` aktuális értéke. (Így a függvény rekurzív jellege miatt az aktuális hibás legfelső érték lesz lesüllyesztve a megfelelő pozícióba.)
17. A süllyesztés után az első pozícióban megint a legnagyobb érték van, ezért cseréld ki, az `r`-edik helyen levő értékkel. 
18. A ciklus lefutását követően az értékek sorba lesznek rendezve, tehát vissza lehet térni a listával.