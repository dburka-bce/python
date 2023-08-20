# Karakterláncok

A Python karakterláncait egy pár aposztróf vagy idézőjel veszi körül.  A program kódjában ilyen direkt módon megadott karaktersorozat az úgynevezett *literál* (angol kifejezés: "szó szerinti").

A `"hello"` ugyanaz, mint a `'hello'`.

``` python
print("Hello világ")
print('Hello világ')
```
A megfelelő jelölést alkalmazva így a megjelenített szövegbe is tehetünk idézőjelet.

``` python
print("D'Artagnan nem a három testőr egyike")
```
A kettő azonban nem helyettesítheti egymást, az "idézetet" ugyanazzal a jelöléssel kell zárni, amivel megnyitottuk.
Az alábbi utasítás hatására azért keletkezik hiba, mert a rendszer a szöveg végén lévő aposztrófot (valamint a záró zárójelet) is a szöveg részének tekinti, és a sor végét (EOL = End Of Line) elérve sem találja a szöveg literál zárását.
``` python
print("Hello világ')
```
```
 File "<ipython-input-3-ce149e5da16b>", line 1
 print("Hello világ')
                        ^
SyntaxError: EOL while scanning string literal
```

Előfordulhat, hogy egy hosszabb szöveg megjelenítésére van szükség. Ilyenkor a kód olvashatósága érdekében három idézőjel használatával többsoros karakterláncot rendelhetünk egy változóhoz.

``` python
l = """Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Morbi convallis ante et turpis congue feugiat. 
Fusce scelerisque nulla sed orci ultricies, nec vulputate felis finibus. 
Integer nec odio ut nisi venenatis suscipit eu ut nibh. 
Nullam velit ex, cursus ac posuere et, faucibus vel magna. 
In posuere vitae velit vel accumsan."""
```
Fontos megjegyezni, hogy ettől a megjelenített szöveg még ugyanúgy egy soros lesz. Ez csak magát a kódot teszi szebbé (az ajánlás az, hogy a kódsorok ne legyenek 79 karakternél hosszabbak).

## Karakterek

A karakterlánc úgy működik mint egy [lista](/python_basic/list/): bármelyik elemére hivatkozhatunk. A legtöbb programnyelvhez hasonlóan a karakterláncok Pythonban is nullától indexelnek. A Pythonnak azonban nincs külön karakter adattípusa, az egyetlen karakter egyszerűen egy egy betűből álló karakterlánc.

``` python
x = "Helló :)"
y = x[0]

print(x)
print(type(x))

print(y)
print(type(y))
```
```
Helló :)
<class 'str'>
H
<class 'str'>
```
### Rész karakterlánc keresése
Egy karakterláncban egy karakter meglétét az `in` paranccsal ellenőrizhetjük, a visszatérési érték logikai típusú.
``` python
x = "Budapesti Corvinus Egyetem"
print("Corvinus" in x)
```
```
True
```
Gyakran szükséges lehet a rész karakterlánc pontos pozíciójának ismerete is, ezt a `find` függvénnyel kereshetjük ki. 
``` python
x = "Budapesti Corvinus Egyetem"
kezdet = x.find("Corvinus")
print(kezdet)
```
```
10
```
Nullától kezdődő számozással, a Corvinus "C" betűje a 10. karakter.
### Darabolás
A karakterláncok darabolása `string[start:end:step]` formulával valósítható meg. 

 - `start`: a kinyerni kívánt rész karakterlánc első karakterének pozícója. Alapértéke 0, amely a karakterlánc első betűje.
 - `end`: a kinyerni kívánt rész karakterlánc utolsó utáni karakterének pozíciója. Alapértéke az adott karakterlánc hossza.
 - `step`: Minden `step`-edik karakter kerül be a rész karakterláncba a `start` és az `end` között. Alapértéke 1.
``` python
x = "Budapesti Corvinus Egyetem"
print(x[:])
print(x[:1])
print(x[::2])
kezdet = x.find("Corvinus")
print(x[kezdet:kezdet+8])
```
```
Budapesti Corvinus Egyetem
B
BdpsiCriu gee
Corvinus
```


##  Szövegekkel kapcsolatos függvények

A karakterlánc -- és általában minden adattípus -- hosszúságának meghatározásához a `len()` függvény használható. Ennek a függvénynek a bemenő paramétere egy változó, a kimeneti értéke pedig egy szám.
``` python
a = "Hello világ!"
print(len(a))
```
```
12
```

Figyelj oda, hogy a következőkben felsorolt függvényeket a korábbiaktól eltérő módon kell meghívni!
Vannak általános függvények, mint a <code>len()</code>, <code>type()</code> vagy a <code>print()</code>, amik bármikor meghívhatók, ezért a fenti formában kell használni őket. Az adott adattípusra (pontosabban <i>osztályra</i>, de erről majd később) specifikus függvények hívása viszont kicsit eltér ettől. Az ilyenek esetén egy pontot kell írni a megfelelő típusú változó neve után, és ezután következik a függvény neve, utána zárójelben pedig a bemeneti paramétereinek felsorolása. Ilyenkor a változónk maga is egy rejtett bemeneti paraméter, amit nem kell még egyszer felsorolni. Emiatt viszont gyakori, hogy az ilyen függvényeknek nincs más bemenő paramétere, ezért a zárójelek üresen maradnak (de mindenképp ki kell írni őket).


A `strip()` a felesleges szóközök eltávolítása szolgál a karakterlánc elejéről illetve végéről

``` python
x = " Budapesti Corvinus Egyetem "
print(x.strip())
```
```
Budapesti Corvinus Egyetem
```
Az `upper()` és a `lower()` függvény csupa kis- vagy nagybetűssé alakítja a szöveget:

``` python
x = "Budapesti Corvinus Egyetem"
print(x.upper())
print(x.lower())
```
```
BUDAPESTI CORVINUS EGYETEM
budapesti corvinus egyetem
```

A `title()` függvény pedig a szavak kezdőbetűit nagybetűre változtatja, a többit pedig kicsire alakítja. Ez értelemszerűen a nevek kezelése kapcsán tud hasznos lenni.

``` python
x = "KIS pista"
print(x.title())
```
```
Kis Pista
```

A `replace()` függvénnyel egy adott szövegrészlet cserélhető ki:

``` python
x = "Budapesti Corvinus Egyetem"
print(x.replace("Budapesti", "Székesfehérvári"))
```
```
Székesfehérvári Corvinus Egyetem
```

Fontos megjegyezni, hogy a szövegfüggvények használatához nincs szükség változóra, közvetlenül a szövegen keresztül is meghívhatók. 
``` python
print("Budapesti Corvinus Egyetem".upper())
```
```
BUDAPESTI CORVINUS EGYETEM
```

## Szövegek formázott megjelenítése

A `+` operátor segítségével fűzhetők össze szövegrészletek:

``` python
x = "Budapesti"
y = "Corvinus"
z = "Egyetem"
print(x + " " + y + " " + z)
```
```
Budapesti Corvinus Egyetem
```

### str.format()
Bár a `+` jelek alkalmazása kényelmes a változók szövegbe történő beszúrására, már a fenti példából is látszik, hogy kissé nehézkes az utolsó sor olvasása. Ennél olvashatóbb, ha előre elkészítjük a szöveg vázát. A `format` szövegfüggvény segítségével pedig a paraméterként átadott változókat beszúrhatjuk a szövegünkben kapcsos jelekkel megadott helyőrzőkkel jelölt részekre.

További előny a `+` jelekkel szemben, hogy így akár más típusú adatok (tipikusan számok) is összefűzhetők a szöveggel anélkül, hogy [típuskonverziót](/python_basic/type_conversion/) kellene alkalmazni.

``` python
s = "My name is {}. {} {}."
print(s.format("Bond","James","Bond"))
```
```
My name is Bond. James Bond.
```
A beszúrás helyei számozhatók, így elkerülhető, hogy ismételni kelljen a  beszúrandó szövegrészleteket. 

``` python
s = "My name is {0}. {1} {0}."
print(s.format("Bond","James"))
```
```
My name is Bond. James Bond.
```
De a formázás használható akár szöveges indexekkel is. 

``` python
print("My name is {vezeteknev}. {keresztnev} {vezeteknev}."
	.format(vezeteknev="Bond",keresztnev="James"))
```
```
My name is Bond. James Bond.
```

### f-string
A Python 3.6-os verziója óta elérhető a szövegek összeállításának egy új módja, az úgynevezett **f-string**, vagy **formázott string literál**. A működési elve ugyanaz, mint a `format` függvényé, de nem kell minden egyes változót egy függvény paramétereként felsorolni, közvetlen beírhatók a szövegbe. És még függvényhívásra sincs szükség, csak az `f` vagy `F` betűt kell az idézőjel elé írni.

``` python
keresztnev = "James"
vezeteknev = "Bond"
print(f"My name is {vezeteknev}. {keresztnev} {vezeteknev}.")
```
```
My name is Bond. James Bond.
```
### Formázás paraméterek
A fent leírt két megközelítés még számos különböző módon paraméterezhető, különösen a számok vagy a dátumok formázása terén. Alapvetően a változóra való hivatkozás után kell írni a megfelelő karaktereket a kívánt formátum megjelenítéséhez, függetlenül attól, hogy melyik megközelítést választjuk.

``` python
szam = 5
szoveg = "Egész szám: {0}"
print(szoveg.format(szam))
print("Rövid tizedes tört: {0:.2f}".format(szam))
print(f"Hosszú tizedes tört: {szam:.10f}")
```
```
Egész szám: 5
Rövid tizedes tört: 5.00
Hosszú tizedes tört: 5.0000000000
```
Nem elvárás az összes formázási paraméter ismerete. Ha valakinek szüksége van rá, vagy csak érdeklődik, akkor a például a [Python megfelelő wiki oldalán](https://wiki.python.org/moin/Py3kStringFormatting) megtalálhatja a részletes leírásukat.

### Escape karakter
Korábban felmerült, hogy a kétfajta idézőjel alkalmazása kapcsán lehet játszani a szöveg körüli idézőjelekkel annak érdekében, hogy a szövegben aposztrófot vagy idézőjelet jelenítsünk meg. Előfordulhat azonban, hogy egyszerre mindkettőre szükségünk van, vagy más speciális szerepet betöltő karaktert szeretnénk kiírni. 

A `\` karakter (backslash, visszaperjel) az úgynevezett *escape* karakter. Ez a karakter normál esetben nem jelenik meg. Azt jelzi, hogy az utána következő karaktert különleges módon kell kezelni. A legtöbb programozási nyelv alkalmaz *escape* karaktert, és általában ugyanerre a karakterre esik a választás.

Az *escape* karakter után írt idézőjelek egyszerű karakterként lesznek számon tartva, nem a szöveg nyitó vagy lezáró elemeként.
``` python
print("D\'Artagnan a \"Három testőr\" című könyv egyik főszereplője.")
```
```
D'Artagnan a "Három testőr" című könyv egyik főszereplője.
```

Ha pedig magát az *escape* karaktert szeretnénk leírni, akkor duplán kell használni.
``` python
print("c:\\temp\\valami.txt")
```
```
c:\temp\valami.txt
```

Ezen felül pedig létezik még néhány speciális karakter. A két leggyakrabban használt a sortörést jelölő `\n`, és a tabulátort jelölő `\t` .

``` python
keresztnev = "James"
vezeteknev = "Bond"
print(f"My name is {vezeteknev}. \n\t{keresztnev} {vezeteknev}.")
```
```
My name is Bond. 
	James Bond.
```

Az *escape* karakter nagyon hasznos, de kifejezetten zavaró is lehet, ha például sok `\` jelet akarunk írni egy fájl útvonal megadása során. Ilyenkor egy az idézőjel elé írt `r` vagy `R` karakter segítségével kikapcsolhatjuk a szövegben az *escape* karakter funkcionalitását. (Az `r` a "raw" azaz "nyers" rövidítése.)

``` python
print(r"c:\\temp\\valami.txt")
```
```
c:\\temp\\valami.txt
```
Az f-string és az `r` jelölés egyszerre is alkalmazható tetszőleges sorrendben.
``` python
keresztnev = "James"
vezeteknev = "Bond"
print(fR"My name is {vezeteknev}. \n\t{keresztnev} {vezeteknev}.")
```
```
My name is Bond. \n\tJames Bond.
```

# Ellenőrző kérdések, feladatok:
1. Adott az alábbi karakterlánc. Módosítsd úgy, hogy a `print`-el kiíratva a két verssor külön sorba kerüljön:
"Ég a napmelegtől a kopár szík sarja Tikkadt szöcskenyájak legelésznek rajta"
2. Mit jelent egy karakterlánc literál előtt az `r` karakter?
3. Milyen típus alkalmas Pythonban egyetlen karakter tárolására?
4. Tárold le két különböző változóban csupa kisbetűvel a vezeték- és az utónevedet, majd egyetlen `print` utasítással írasd ki a teljes neved.
5. Készíts programot, amely egy két szóból álló, egyetlen szóközzel határolt karakterlánc szavait megcseréli.
6. Készíts programot, amely egy karakterláncot megfordít, például az ABC stringből CBA-t alakít. Tipp: a részkarakterláncok kinyerésére szolgáló formulában esetén a léptetés (step) lehet negatív is! 
7. Készíts programot, amely egy két szóból álló, egyetlen szóközzel határolt névben az első szót nagybetűssé alakítja, például Gipsz Jakab esetén a kívánt eredmény GIPSZ Jakab.
8. Készíts programot, amely kinyeri egy két tagú, szóközzel határolt névből a monogramot, például Gipsz Jakab esetén a kívánt eredmény GJ.
9. Készíts programot, amely egy két szóból álló, egyetlen szóközzel határolt, kisbetűs nevet javít ki: nemecsek ernő -> Nemecsek Ernő. Próbáld meg úgy is, hogy nem használod a függvényt, ami dedikáltan erre szolgál!
10. Készíts programot, amely előbb eltávolítja egy adott karakterlánc elejéről és végéről a szóközöket, majd kiírja a kapott eredmény hosszát! A feladatot próbáld minél kevesebb kódsorból megvalósítani! Próbáld meg úgy is, hogy nem használod a függvényt, ami dedikáltan erre szolgál!
