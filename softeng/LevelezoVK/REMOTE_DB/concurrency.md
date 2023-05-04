# Optimista és pesszimista konkurencia

Ha egyidejűleg több, adatmódosítási joggal rendelkező felhasználó is kapcsolódhat egy adatbázishoz, megoldást kell találni az egymásnak potenciálisan ellentmondó adatmódosítások, vagyis a konkurencia problémájára. [*konkurencia* < francia: *concurrence* (konkurencia, versengés); latin: *concurrentia* (együtt futás, ütközés); con- (össze) + curro (fut)] (együtt futás, ütközés); con- (össze) + curro (fut)]

A konkurencia kezelésére a következő megközelítések jellemzőek a gyakorlatban:

**Pesszimista konkurenciakezelés:** arra számítunk, hogy több felhasználó egy időben ugyanazt a táblát vagy rekordot akarja módosítani. Ezért ha egy felhasználó módosítani akar egy táblát vagy rekordot, először zárolnia kell, és csak sikeres zárolás után végezheti el a módosításokat. A módosítások végeztével fel kell oldani a zárolást. Ha a rekord vagy tábla már zárolva van, a zárolási kísérlet meghiúsul, és nem kerülhet sor a módosításra. Így addig nem engedünk másik felhasználót módosítani, amíg az első módosítás be nem fejeződik. Problémát jelent, ha elmarad a zárolás feloldása, mert például megszakad a kliens hálózati kapcsolata, vagy hiba történik a kliensoldali program futásában. Ilyenkor a zárolt tábla vagy rekord módosíthatatlanná válik. Egy ilyen helyzet adminisztrátori beavatkozást is igényelhet.

**Optimista konkurenciakezelés:** az alapfeltevés az, hogy alacsony az egyidejűleg kezdeményezett módosítások (és így az ütközések) valószínűsége. Ha mégis előfordul, hogy két felhasználó egyszerre ugyanazt az adatot módosítja, akkor a második módosítás adatbázisba írása előtt figyelmeztetjük a felhasználót, hogy már elavult adatot akart módosítani. A szerver minden rekord mellé feljegyzi az utolsó módosítási pontos idejét. Ha a kliens módosítani akar egy rekordot, megjegyzi a módosítás kezdetének időpontját. Amkor a kliens el akarja küldeni a módosított rekordot a szervernek, a szerver ellenőrzi, hogy nem módosított-e más a rekordon a módosítás kezdete óta, és csak akkor érvényesíti a módosítást, ha nincs ütközés. Az optimista megközelítés hátránya, hogy a felhasználó tipikusan későn értesül arról, hogy feleslegesen dolgozott. Ugyanakkor sok adat és kevés felhasználó esetén ez a célszerűbb megoldás, mivel nem kell zárolásokkal és azok feloldásával (pl. időtúllépési szabályok) foglalkozni.