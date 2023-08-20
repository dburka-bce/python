# Kereső algoritmusok
Az adatok feldolgozásának első része a rendelkezésre álló értékek közül a számunkra relevánsak lekérdezése. A legtöbb művelethez szükségünk van újabb adatokra, és ezek ritkán érkeznek közvetlenül a felhasználótól, általában összetett adatbázisokban találhatók. A keresés tehát nem feltétlenül egyszerű feladat, viszont rendkívül gyakran van rá szükség, ezért különösen fontos a kereső funkciók hatékony működése. Ezért most áttekintjük a két legalapvetőbb kereső algoritmus működését.

## Lineáris keresés
A lineáris keresés működését már a nevéből is lehet sejteni. Egyszerűen végigmegyünk a listánkon, és minden érték esetén megvizsgáljuk, hogy egyezik-e a keresett értékünkkel. Sajnos, ha nincs semmilyen információnk a lista tartalmáról, akkor nem igazán tudunk ennél hatékonyabbak lenni.
```python
def lin_ker(lista, keresett_ertek):
    for i in range(0, len(lista)):
        if(lista[i] == keresett_ertek):
            return (i, True)
    return (None, False)
        
x = [5, 3, 6, 17, 2, 8]
y = int(input("Keresett érték: "))

eredmeny = lin_ker(x, y)

if(eredmeny[1]):
    print(f"A keresett érték indexe: {eredmeny[0]}")
else:
    print(f"A keresett érték nem található")
```
```
Keresett érték: 6
A keresett érték indexe: 2
```
A példában függvényként valósítottuk meg a kereső funkciót, de a kimenetét különleges módon kezeltük. A keresés eredménye kettős lehet: vagy megtaláljuk az értéket, és visszaadjuk az indexét, vagy nem találtuk meg. Ilyenkor a találat hiányát a `None` érték visszaadásával szokás jelezni, de ez a megoldás nem teljes. Ugyanis előfordulhat, hogy a listában szerepel egy `None` érték, és akkor nem tudunk rá keresni. Ezért illik egy második értéket is visszaadni ([Tuple](/python_basic/tuple/) segítségével), amely valamilyen módon jelzi, hogy volt-e találat. A példában erre egy logikai értéket használtunk.

A gép számára az alapműveletek közül az összehasonlítások (feltételek) eredményének meghatározása a leginkább erőforrás igényes, ezért ezek minimalizálása a cél. Tehát mindenképp szükség van arra, hogy amint megtaláltuk a keresett értéket, mindenképp hagyjuk abba a felesleges összehasonlításokat. Ezt egy megfelelő `return` parancs alkalmazásával érhetjük el (mely egy függvényben található ciklus törzsében a `break`-hez hasonló szerepet tölt be).

## Logaritmikus keresés
Az adatbázisok tartalma azonban általában rendezett. (Nem maguk az adatsorok, hanem a hozzájuk tartozó indextáblák értékei vannak sorban.) Amennyiben tudjuk egy lista elemeiről, hogy azok nem csökkenő sorban követik egymást, lehetőségünk van a lineárisnál hatékonyabb megoldás alkalmazására.

A logaritmikus- vagy bináris keresés lényege, hogy egy rendezett listában a keresett érték lehetséges pozícióinak számát minden ciklus iterációban elfelezzük. Minden lépésben a fennmaradt lista középső elemét vizsgáljuk meg. Ha az érték egyezik, akkor találatot értünk el, ha nagyobb, mint a keresett érték, akkor a továbbiakban elég csak a lista első felére fókuszálni, ha pedig nagyobb, akkor a másodikra. Ezt ismételve a lineáris megközelítésnél jelentősen gyorsabban találhatjuk meg a keresett értéket.
```python
def log_ker(lista, keresett_ertek):
    start = 0
    end = len(lista) - 1    
    while start <= end:
        m = int((start + end) / 2) # középső index
        if(lista[m] == keresett_ertek):
            return (m, True)
        elif(lista[m] < keresett_ertek):
            start = m + 1
        else:
            end = m - 1
    return (None, False)
        
x = [2, 3, 5, 6, 8, 17]
y = int(input("Keresett érték: "))

eredmeny = log_ker(x, y)

if(eredmeny[1]):
    print(f"A keresett érték indexe: {eredmeny[0]}")
else:
    print(f"A keresett érték nem található")    
```
```
Keresett érték: 6
A keresett érték indexe: 3
```

## Feladatok
1. Valósíts meg egy maximum kereső függvényt, ami változó számú paramétert, és listát is elfogad bemenetként. A bemenet feldolgozásakor figyelj arra, hogy ne rontsa el a feldolgozást néhány hibás adat. A programnak csak számokra kell működnie.
2. Az előző feladat módosított változata: A szimpla és listában megadott bemenetek keverékét és egymásba ágyazott listákat is tudjon kezelni a függvény! (Ez a tárgy szintjéhez képest nagyon nehéz feladat. Azoknak szól, akik szeretik a kihívást.)