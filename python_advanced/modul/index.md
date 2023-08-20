
# Modulok

Ahogy egyre hosszabbá válik a kód, előbb utóbb elkerülhetetlen a kód több fájlba történő szervezése. Az áttekinthetetlenül hosszú forrásfájlokat **spagetti kód**nak csúfolják a fejlesztők. Python környezetben ezt a célt szolgálják a modulok. A modulok egyszerű .py kiterjesztésű fájlok, azonosításuk fájlnév alapján történik. Az `import` kulcsszó után adhatók meg az importálandó modulok nevei -- a .py kiterjesztés nem kell beírni.

A moduláris programozás egy nagy, nehézkes programozási feladatot különálló, kisebb, jobban kezelhető részfeladatokká vagy modulokra való bontásának folyamatát jelenti. Számos előnye van a modulok használatának az alkalmazásfejlesztés során:
-   **Egyszerűség**: Ahelyett, hogy a teljes problémára összpontosítana, egy modul jellemzően a probléma egy viszonylag kis részére összpontosít, így kisebb a hibalehetőség.
-   **Karbantarthatóság**: A modulokat általában úgy tervezték, hogy logikai határokat érvényesítsenek a különböző problématerületek között. Ha a modulok úgy íródnak, hogy minimálisra csökkentsék az egymásrautaltságot, csökken annak valószínűsége, hogy egyetlen modul módosításai hatással lesznek a program más részeire.
-   **Láthatóság/scoping**: A modulok általában külön névteret határoznak meg, amely segít elkerülni a névütközést.
-   **Újrafelhasználhatóság**: Az egyetlen modulban meghatározott funkcionalitást az alkalmazás más részei könnyen újra felhasználhatják (egy megfelelően meghatározott interfészen keresztül). Ez kiküszöböli a kód ismétlődésének szükségességét.
  
A Pythonhoz több mint százezer, modulokat tartalmazó csomag érhető el, melyek a disztribúcióhoz tartozó parancssoros csomagkezelőn keresztül egyszerűen telepíthetők (pl.: pip, conda). A csomagkezelő azért nagyon fontos, mert a csomagok használhatnak más csomagokban lévő modulokat is, és ezeknek a függőségeknek a kézzel történő feloldása fáradságos és idegőrlő feladat lenne.

## Modul importálása -- az  `import` kulcsszó
Az `import`utasítás segítségével tölthetünk be a programunkba külső kódrészleteket. Az utasítás használatának azonban számos változata van annak függvényében, hogy pontosan mire is van szükségünk.

Egy vagy több modul importálása:
```
import <osztály neve>[, <osztály neve> ...]
```

Egy modulból egy objektum importálása:
```
from <modul neve> import <név>
```

Egy modul importálása más néven:
```
import <modul neve> as <név>
```

Egy objektum importálása egy modulból más néven:
```
from <modul neve> import <név> as <név>
```

Egy modul objektumainak listázása:
```
dir(modul)
```

### Import példák
Egyszerűen importálhatunk egy modult az `import`utasítás segítségével,  a modul nevét is meg kell adni ponttal elválasztva ahhoz, hogy hozzáférjünk a benne található definíciókhoz:

``` python
import math
print("A pi értéke", math.pi)
```
```
A pi értéke 3,141592653589793
```

Importálhatunk egy modult az alábbiak szerint átnevezve:
``` python
import math as m
print("A pi értéke", m.pi)
```
Innentől a `math.pi`érvénytelen, és az `m.pi`a helyes írásmód.

Importálhatunk bizonyos neveket egy modulból anélkül, hogy a modult egészben importálnánk:

``` python
from math import pi
print("A pi értéke", pi)
```
Itt csak az `pi`-t importáltuk a `math`modulból. Ilyen esetekben nem használjuk a `.` operátort.

``` python
from math import pi, e
print(pi)
print(e)
```
```
3.141592653589793
2.718281828459045
```

### Az összes név importálása
Az összes nevet (és definíciót) is importálhatjuk egy modulból  a következő konstrukcióval:
``` python
from math import *
print("A pi értéke", pi)
```

A fenti példában importáltuk az összes definíciót a `math` modulból. Ez magában foglalja az összes nevet, amely a hatókörünkben látható, kivéve azokat, amelyek aláhúzással kezdődnek (ezek a privát definíciók).

Csillaggal  mindent importálni (`import * from ...`) nem jó programozási gyakorlat. Elképzelhető, hogy a másik modulban is használták ugyanazt a változónevet. Az automatikus kódkiegészítő pedig áttekinthetetlenül sok lehetőséget kínálhat fel. 