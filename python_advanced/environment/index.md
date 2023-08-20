# Python fejlesztői környezet

## Python fordító és csomagkezelő
  
A **Python** egy általános célú magas szintű programozási nyelv melyet Guido van Rossum holland programozó kezdett el fejleszteni és hozott nyilvánosságra 1991-ben. Interpreteres nyelv, tehát a kódok használatához szükség van egy interpreter (magyarul: fordító) telepítésére, ami képes lefordítani a kódsorokat futtatható formára.

A Python fordító két telepítőkészletben is elérhető:

### python. org

A Python hivatalos oldaláról letölthető telepítőkészlet Windowsra és MacOs-re is. A telepítőkészlet jelenleg a 3.9.x verziónál jár. A legutóbbi verziók között számunkra nincsenek lényeges különbségek, ezért bármelyik használható. 

Fontos azonban megemlíteni, hogy a Python 2.7.x-es verziókat követően a 3.x verzióra a telepítőkészlet és nyelv alapfunkcióiban is bekövetkeztek olyan változások, melyek bizonyos esetekben a korábbi programok teljes újraírását igényelték volna. Ezért számos fejlesztő továbbra is a 2.7.x-es verzióban tartja karban az alkalmazásait. Az elérhető modulok kapcsán ezért gyakran előfordul, hogy csak a két változat valamelyikét támogatják.

Letölthető: [https://www.python.org/](https://www.python.org/)

### Anaconda

Az oldal írásának pillanatában 232 000 modul volt elérhető a Python modulokat gyűjtő [https://pypi.org/](https://pypi.org/) oldalon. A csomagok egy része aktív fejlesztés alatt áll, különböző verzió érhetők el belőlük. A csomagok közti egymásra épülés miatt az eltérő verziók okozhatnak problémát. A csomagok különböző verziói között a visszafelé kompatibilitás nem feltétlenül megoldott. Ha egy projektben olyan csomagokat akarunk használni, amik egy másik csomag különböző verziójára építenek, nehézségbe ütközhetünk. Többek közt az ilyen típusú konfliktusok feloldására jött létre az Anaconda. Kutatóknak diákoknak és egyéni kísérletezőknek ingyenes, üzleti felhasználásra fizetős. 

Letölthető: [https://www.anaconda.com/products/individual](https://www.anaconda.com/products/individual)

## Fejlesztőkörnyezetek

Tucatnyi különböző fejlesztőkörnyezet érhető el a Python nyelvhez. Az alábbiakban a teljesség igénye nélkül mutatunk be néhányat a leggyakrabban használtak közül.

### Jupyter

A Jupyter -- régebbi nevén IPython Notebook -- egy interaktív számítási környezet. A szerkesztőfelületen egymás alatt lévő cellákba felváltva helyezhetők el programkód részletek, formázott szövegek, képek és interaktív diagramok. Ez az elrendezés kiválóan alkalmas levezetések és számítások dokumentációjára, mivel a számítások hátteréül szolgáló szöveg, képletek és ábrák, valamint a számítást elvégző kódrészletek és futási eredmények egy dokumentumban kezelhetők.

![1588682381726.png](1588682381726.png)
A Jupyter Notebook eredeti formájában, vagy a legújabb JupyterLab részeként is elérhető. Fejlesztéshez az utóbbi telepítését ajánljuk.

Elérhető: [https://jupyter.org/](https://jupyter.org/)

### Visual Studio Code

Nem összekeverendő a Visual Studio Community / Enterprise / Professional termékvonallal. A VS Code egy teljesen nyílt forráskódú kódszerkesztő, mely elérhető Windows-ra, Mac-re és Linux-ra is. A VS Code egy általános kódszerkesztő, melyhez számtalan bővítmény telepíthető néhány kattintással saját piacteréről. A piactéren elérhető egy Microsoft által gondozott bővítmény a A Python alapú fejlesztéshez is.

A [Getting Started with Python in VS Code](https://code.visualstudio.com/docs/python/python-tutorial) útmutató a részletes leírást tartalmaz VS-Code fejlesztőkörnyezet telepítéséről és használatáról Windows és Mac környezetben.

Letölthető: [https://code.visualstudio.com/download](https://code.visualstudio.com/download) 

Szükséges Extension-ök: 
- Python extension for Visual Studio Code (ms-python.python)
- Live Share Extension Packms-vsliveshare.vsliveshare-packPreview (ms-vsliveshare.vsliveshare-pack)


### PyCharm

A PyCharm egy kifejezetten a Python nyelvhez klészült integrált fejlesztő környezet (IDE), amelyet cseh JetBrains cég fejlesztette ki.  Kódelemzést, grafikus hibakeresőt, integrált egység tesztelőt tartalmaz, és támogatja a webfejlesztést a Django, valamint az Data Science és az Anaconda segítségével. A PyCharm szintén cross platform Windows, macOS és Linux verziókkal. A közösségi kiadás az Apache licenc érhető el, de kereskedelmi licenc alatt elérhető változati is vannak kibővített funkciókészlettel. 

Letölthető: [https://www.jetbrains.com/pycharm/](https://www.jetbrains.com/pycharm/)

![1588682145398.png](1588682145398.png)



### Online kódszerkesztők

Ha valaki csak néhány egyszerű számítást szeretne elvégezni, vagy olyan gépen szeretné gyakorolni az alapokat, amire nincs telepítve a Python fordító és fejlesztőkörnyezet, használhat online szerkesztőket.

A nagyon egyszerű megoldások (pl.: [programiz.com](https://www.programiz.com/python-programming/online-compiler/), [online-python.com](https://www.online-python.com/)) gyakran hirdetésekkel tarkítottak, és nem képesek a modulok vagy forrásfájlok kezelésére. De néhány kódsor leellenőrzésére, vagy az alapok gyakorlására tökéletesen alkalmasak.

A [**jupyter**](https://jupyter.org/try) online változata lehetőséget ad modulok betöltésére és a fájlok kezelésére egyaránt. Minden számunkra szükséges eszköz elérhető benne. Egyetlen jelentős hátránya, hogy nincs benne szintaxis ellenőrzés és kódkiegészítés, de a tanulás első fázisában még egyébként is hasznos, ha ezeket nem a gép végzi helyettünk.

A [**repl.it**](https://repl.it/@enaard/Python-3) abban tűnik ki más megoldásoktól, hogy kódszerkesztés közben rendelkezésre áll az automatikus szintaxis ellenőrzés és kódkiegészítés. Kezdőként ezek nélkül a gyakorlás elég fapados élményt nyújt. Apró kényelmetlenség, hogy néhány éve már csak regisztrációt követően érhetők el a funkciói.

A tanulás során érdekes lehet még a [pythonturor.com](https://pythontutor.com/). Ez az oldal úgy enged egyszerű python kódokat futtatni, hogy közben megmutatja a változók értékeinek vizuális reprezentációját. A program lépéseit lekövetve, jól átlátható formában tekinthetjük meg, pontosan mit is csinál a program. Ha valakinek nehezére esik az órai példaprogramok működésének követése, akkor érdemes ezzel az eszközzel is megnézni.