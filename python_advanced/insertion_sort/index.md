# Beszúró rendezés
A beszúró rendezés a listán végighaladva az aktuális elemet mindig az őt megelőző elemek közé helyezi át az értékének megfelelő helyre. A módszer egy remek analógiája az, ahogy egy pakli kártyát rendeznénk sorba. Folyamatosan gyűjtjük a kezünkbe a pakli sorba rendezett részét, és minden újabb lap felhúzásakor az új lapot a már rendezett lapok közé a megfelelő helyre tesszük. Ezt addig ismételjük, míg az utolsó lapot is sikerül elhelyezni.

1. Menj végig 1-től az utolsó lista elemig az összes lehetséges indexen (nullát kivéve) egy ciklussal. A ciklusváltozó határozza meg az aktuális értéket (továbbiakban "kulcs érték".
2. A kulcs értéket a cikluson belül mentsd le egy változóba.
3. Hozz létre egy új változót, amiben a továbbiakban az éppen összehasonlításra kerülő elem indexét tárolod (továbbiakban `j`). Utóbbi értéke az aktuálisnál eggyel kisebb index legyen.
4. Még mindig az előző cikluson belül, a `j` változót felhasználva egy újabb ciklussal haladj az egyre kisebb indexek felé. Egészen addig, amíg az aktuális indexnek megfelelő érték nagyobb, mint a kulcs érték, és amíg az index nagyobb, mint nulla.
5. A belső ciklustörzsben írd felül a `j+1`-edik változó értékét a `j`-edik változó értékével. (Így kerülnek eggyel eltolásra a kulcs értéknél nagyobb értékek.)
6. A belső ciklus lefutása után (de még a külső ciklusban) az aktuálisan "szabad" helyre (`j`) írd be a kulcs értéket.