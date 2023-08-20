
# 3. Minta ZH
**A 4 fő blokkot külön cellába dolgozd ki (a mintában és a valódi ZH-n is), hogy átláthatóbb legyen a megoldás!!!** Figyelj oda, hogy ebben az esetben érdemes az egész munkalapot újrafuttatni teszteléskor (forward gomb), pusztán az aktuális cella futtatása helyett (play gomb).

1. Blokk (10 pont)
	1.  Importáld és adj rövid nevet a mai nap során használt csomagoknak: `numpy`, `pandas`, `plotly_express`, `plotly.figure_factory` és `plotly.graph_objects`
	2.  Olvasd be a pokemons.csv fájlt.
	3.  Nézd meg az adattábla első 10 és utolsó 5 sorát.
	4.  Irasd ki a leíró statisztikákat és oszlopok közti korrelációt.
	5.  Melyik oszlopnak legnagyobb az átlaga? Melyik oszlop korrelál a leginkább fordítva a Speed oszloppal?
	
2. Blokk (10 pont)
	1.  Alakítsd át az adattáblát úgy, hogy a # oszlop legyen az index és minden oszlopnév kisbetű legyen.
	2.  Alakíts át a generation oszlopot kategórikus formátummá.
	3.  Keresd ki, hogy a Dragon tipusú (bármelyik type) pokemonok közül melyik a leggyorsabb.
	4.  Írd ki egy listaként azkat első generációs második típussal nem rendelkező pokemonokat, amelyeknek a speciális támadása és védelme összesen kevesebb mint 50 és a nevükben nincs benne, hogy 'Mega'.

3. Blokk (15 pont)
	1.  Csoportosítsd az első tipus oszlop alapján a pokemonokat. Számold ki a total átlagát, majd alakísd adattáblává a kapott eredményt és rendezt növekvő sorrendbe az átlagok szerint.
	2.  Szűrd le az adattáblát az első tipus szerint növény pokemonokra. Csoportosítsd generáció szerint, majd aggregált a hp oszlopot minimum és maximum szerint, az attack oszlopot medián és a defense oszlopot mean szerint.
	3.  Készítsünk egy csoportosítást az első tipus és a generáció alapján ahol a legnagyobb total értéket vesszük. Mentsük el ezt egy generacio_tipus_max adattáblába. Használjuk a merge funkciót, hogy egyberakjuk az új adattáblát az eredetivel. A nagy tábla értékeihez illesszük a kisebb táblát az első tipus és a generáció oszlopokon. A duplikátum oszlopokra a nagy táblánál semmi a kiseb tábla esetén meg a '_max' utótag kerüljön.
	4.  Szűrd le az adattáblát az első 9 pokemonra, amelyek nevében nem szerepel, hogy 'Mega'. Készíts egy oszlopdiagramot, amely az x tengelyen a pokemonokat az y tengelyen pedig a hp attack és defense oszlopokat mutatja. Frissítsd az ábrát egy Kezdőpokémonok címmel, amely középen található.
	5.  Az adattábla hp és speed közötti oszlopaiból csinálj sorokat a type 1 oszlop megtartása mellett. Az ezen oszlopneveket tartalmazó oszlop neve legyen stats_type az egykori értékeiket tartalmazó oszlop pedig legyen stats. Az eredményt csoportosítsd type 1 és stats_type alapján és vedd a stats oszlop átlagát, majd az eredményt alakítsd adattáblává. Vegyél le az így kapott stats oszlop értékeiből 40-et (a jobb ábrázolhatóság érdekében). A kapott adattáblából csinálj egy buborékdiagramot ahol az x tengelyen a type 1 az y tengelyen a stats type található, a buborékok mérete a stats oszloptól függjön és a színezés pedig a stats_type alapján történjen.

4. Blokk (15 pont)
	1.  Készíts egy bekérő ciklust. Írja ki, hogy meg kell adni a generációt, vagy a típus szó megadásával elérhető az összes generáció. Ellenőrizze, hogy a kapott generáció benne van-e az adattábla generation oszlopában. Ha igen, akkor a generációval szűrje lesz az adattáblát és lépjen ki a ciklusból. Sikertelen bekérés esetén induljon újra ciklus a generáció szó megadásával meg írja ki az elérhető generációkat.
	2.  Készíts egy második ciklust az első típusra (type 1). Ugyanazt tudja mint az első ciklus csak másik oszlopra vonatkozik és csak az előző ciklusban leszűrt adattáblán belül keressen.
	3.  Készíts egy harmadik ciklust a második típusra (type 2). Ugyanazt tudja mint az második ciklus csak másik oszlopra vonatkozik és csak az előző ciklusban leszűrt adattáblán belül keressen. Figyelj arra, hogy a 'type 2' üres is lehet: A kiválaszható értékek közül szűrd ki az üres értéket, és amennyiben csak üres 'type 2' volt a listában, akkor hagyd ki ezt a szűrési opciót.
	4.  Készíts egy utolsó ciklust a pokemonok neveire. Ugyanazt tudja mint az második ciklus csak másik oszlopra vonatkozik és csak az előző ciklusban leszűrt adattáblán belül keressen.
	5.  Az eredményül kapott pokemon adatait alakítsd adattáblává, oly módon, hogy a 'hp', 'attack', 'defense', 'sp. atk', 'sp. def', 'speed' oszlopokból sorok lesznek. Az oszlopnevekből stats_type oszlop az értékeikből stats oszlop keletkezik. Vizualizáld egy oszlopdiagramon. Az x tengelyen a stats_type, az y tengelyen a stats legyen a színezés pedig megint csak a stats_type alapján. Az ábra címe a kiválasztott '{pokémon neve} adatai' legyen és középre legyen igazítva.