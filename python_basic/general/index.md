# Alapok
A számítógépek és az általuk vezérelt eszközeink napjainkra a mindennapi életünk elengedhetetlen részeivé váltak. Ezek az eszközök azonban -- jelenleg még -- nem képesek olvasni a gondolatainkban, ezért valamilyen módon biztosítani kell a kommunikációt a felhasználó és az eszköz között. Ezt a kommunikációt biztosítják a különböző applikációk (más néven programok, szoftverek). A felhasználó kiadja az utasításokat (bemenet), a gép végrehajtja ezeket, majd valamilyen formában visszajelzést ad a végrehajtás eredményéről (kimenet). A programozás a kommunikációt biztosító, az azt kísérő műveleteket végrehajtó applikációk megvalósításának folyamata.

Az emberek és a gépek által használt nyelvezet azonban jelentősen eltér egymástól. A számítógép nyelve az úgynevezett **gépi kód**, mely a processzor számára értelmezhető formában írja le a műveleteket és az adatokat. A napjainkban elterjedt Neumann elvű számítógépek esetén a nyelv bináris számrendszer alapú, de a pontos nyelvezet processzortípusonként jelentősen eltérhet.

A gépi kód azonban rendkívül nehezen olvasható, ezért a kommunikáció megkönnyítése érdekében szükség van egy olyan nyelvre, amit egy ember is értelmezni tud. Ezt a szerepet töltik be a **programozási nyelvek**. Egy programozási nyelv olyan szöveges utasítások halmaza, melyek kombinációja a megfelelő formai elemek (**szintaxis**) alkalmazása esetén gépi kódot állít elő -- bár nem feltétlen közvetlenül, de ennek a részleteibe nem megyünk bele.

Az úgynevezett alacsony szintű vagy **assembly** (assemble = összeállít) nyelvek utasításkészlete és logikája nagyon közel áll a gépi kódhoz, ezért nehezen olvashatók, használatuk inkább mérnöki feladat. Mi csak magas szintű programozási nyelvekkel foglalkozunk (pl.: Visual Basic, C#, Python stb.). Ezeket úgy tervezték, hogy egy ember számára könnyen olvashatók és írhatók legyenek, és -- bár a szintaxisuk jelentősen eltérhet -- az alap logikájuk általában nagyon hasonló. Ezért egy gyakorlott programozó könnyedén sajátítja el új programozási nyelvek használatát.

A programnyelvek használata során algoritmusokat írunk le (**implementálás**), hogy megvalósítsunk egy adott problémát megoldó applikációt. Az **algoritmus** egy absztrakt fogalom: olyan utasítások precízen meghatározott, véges sorozata (**szekvenciája**), melyek egy problémát oldanak meg, például egy számítást végeznek el. Például: Egy számhalmazban a legkisebb érték keresés lépéseinek felsorolása egy algoritmus. A lépéseket valamilyen programozási nyelven megfelelően implementálva előállíthat egy olyan alkalmazás, melynek bemenete a vizsgált számok halmaza, a kimenete pedig a legkisebb érték.

## Python

A Python egy általános célú magas szintű programozási nyelv melyet Guido van Rossum holland programozó kezdett el fejleszteni és hozott nyilvánosságra 1991-ben (<a href="https://www.youtube.com/watch?v=xLVxoz-mQFs&l" target="_blank">The Early  Years of Python</a>).  A nyelv a nevét a <a href="https://hu.wikipedia.org/wiki/Monty_Python" alt="Monty Python" target="_blank">Monthy Python</a>) társulatról kapta. A nyelv fejlesztése folyamatos, a kezdeti kiadást számos újabb követte, a 3.9-es verzió 2020 októberében jelent meg.

Az egyszerűségének és a természetes nyelvhez közeli szintaxisának köszönhetően széles körben elterjedt. Ennek ellenére rendkívül komplex feladatok megoldására alkalmas: a gépi tanulási feladatok megoldására például a Python az egyik leginkább ajánlott programnyelv. Számtalan oktatóanyag érhető el hozzá, és nagyon aktív a fejlesztői közösség, tehát még egyedi problémák esetén is hamar választ kaphatunk a kérdéseinkre a különböző online fórumokon.

A Python nyelven történő fejlesztés támogatására számos [fejlesztői keretrendszer](/python_advanced/environment/) érhető el mind online, mind desktop változatban. Interpreter nyelv, tehát a kód futtatása sorról sorra történik, így az esetleges szintaktikai hibák csak futási időben derülnek ki.

A fejlesztők tipikusan a "Helló Világ!" üzenet kiíratásával szokták kezdeni pályafutásukat. Python nyelven egy üzenet kiírására a `print` függvénnyel van lehetőség. Utána zárójelek között, idézőjelek közé írva kell megadni a megjelenítendő szöveget. A választott keretrendszerben elindítása után az alábbi kódsorral kipróbálható, hogy megfelelően működik-e.
```python
print("Hello World!")
```
Futtatás után a kimenetben az alábbi szövegnek kell megjelennie.
```
Hello World!
```
Az elkövetkező anyagokban gyakran fogjuk használni a `print` függvényt az eredményeink vagy egyéb üzeneteink megjelenítésére. Az összetettebb példákban ezen felül gyakran szerepelnek majd magyarázó sorok, úgynevezett kommentek. Minden programnyelvben van lehetőség olyan magyarázó szövegek beépítésére, amelyeket a program futtatáskor figyelmen kívül hagy. A Pythonban az ilyen jellegű kommenteket `#` karakter után írhatjuk. A `#` után az adott sorban szereplő összes szöveget figyelmen kívül hagyja a program. Más programozási nyelvektől eltérően a Pythonban nincs többsoros kommentezési lehetőség.
```python
# Helló Világ program
print("Hello World!") # Ez a sor jeleníti meg a szöveget
```

Bár ezekben az egyszerű példákban nem releváns, de programozás során gyakran hosszú kódsorokat kell írnunk. Ezek olvasása kényelmetlen lehet, ezért néha szükség van a sorok tördelésére. A legtöbb magas szintű programnyelvben van egy a sorokat lezáró karakter (pl.: C#-ban a pontosvessző), így szinte korlátlanul lehet sortöréseket illeszteni a kódba. A Pythonban ezzel szemben szükség van egy a sortörést jelölő karakterre. A backslash (`\` ) karakter beírásával egy kódsor több sorba is tördelhető, és így bizonyos esetekben javítható a kód olvashatósága.
```python
print( \
      "Hello World!" \
     )
```
