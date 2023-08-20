# Összefésülő rendezés
Az összefésülő rendezés egy nagyon hatékony algoritmus, mely az "oszd meg és uralkodj" elven működik. Első körben a listát megfelezzük a közepén oly módon, hogy a kapott rész listákat tovább felezzük, egészen addig, amíg egy elemű listákat nem kapunk. Ezt követően a részlistákat páronként összevonjuk (összefésüljük) úgy, hogy az eredményül kapott lista elemei sorban legyenek. Így mikor az utolsó összevonás is megtörténik, egy rendezett listát kapunk.

A módszer lényege, hogy a két lista összevonásának pillanatában élhetünk azzal az előfeltevéssel, hogy mindkét lista már rendezett állapotban van, és így jelentősen felgyorsítható az összefésülés, és ezzel a sorba rendezés. (Annyira, hogy a "feldarabolásra" szánt idő bőven megtérül.)

Ennek az algoritmusnak az implementálása lényegesen bonyolultabb, mint az előző példák. A rendezés során érdemes rekurzív függvényt alkalmazni, és külön függvénybe szervezni az összefésülés folyamatát.

### Fésül (merge) függvény
1. Hozz létre egy függvényt, aminek a bemenete a `bal` és `jobb` oldali lista. (Nincs különbség a két oldal között, de ilyen megnevezéssel könnyebb az értelmezés.)
2. Ha a `bal` lista esetleg üres akkor térj vissza a `jobb` listával, és fordítva.
3. Hozz létre 1-1 index változót 0 kezdőértékkel a két listához, valamint egy üres eredmény listát.
4. Egy ciklus törzsét addig ismételd, amíg az eredmény lista mérete el nem éri a másik két lista méretének az összegét.
5. A ciklustörzsben, ha a `bal` indexhez tartozó érték a `bal` listában kisebb, mint a `jobb` indexhez tartozó érték a `jobb` listában, akkor add hozzá a `bal` lista értékét az eredményhez, és növeld a `bal` indexet. (Mivel a listák rendezettek, így mindig a lehető legkisebb érték kerül következőnek az eredmény listába.)
6. Amennyiben a ciklustörzsben a fenti feltétel után az egyik index eléri a megfelelő részlista hosszát, akkor a ciklust nem szabad tovább engedni, mert a következő iterációban a listán kívülre mutatna az index. Ezért ezen a ponton a másik lista tartalmát egyszerűen fűzd hozzá az eredménylistához, majd lépj ki a ciklusból.
7. Végül térj vissza az eredmény lista tartalmával.

### Rendezés
8. Amennyiben a bemeneti lista kevesebb, mint két elemű, térj vissza az eredeti listával. (A feltétel kissé fura lehet, de a rekurzív hívás miatt kell "értelmesen" kezelni a nulla elemű listát is.)
9. Határozd meg a lista középső indexét. (Az `int` függvénnyel megkapható egy tört alsó egész része.)
10. Vágd szét a kapott listát egy `bal` és `jobb` félre a középső index mentén.
11.  Hívd meg rekurzívan ezt a függvényt mindkét részlista bemenettel, és a hívások eredményeit tárold 1-1 változóban.
12. A két -- immár rendezett -- részlistát bemenetként használva hívd meg a `Fésül` függvényt, és az eredményét add visszatérési értékként.