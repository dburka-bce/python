# Rendező algoritmusok feladat
Az eheti beadandó feladat a bemutatott rendező algoritmusok implementálása. Minden algoritmus külön függvénybe kerüljön, melyek visszatérési értéke a rendezett lista legyen. A teszteléshez töltsd le a korábbi példafeladathoz tartozó `szamok.txt` fájlt, és használd az alábbi példakódot, melyben a `sorting_algorithm` helyére természetesen az éppen tesztelni kívánt függvény neve kerül.
```python
with open("szamok.txt") as f:    
    x = []
    for line in f.readlines():
        x.append(int(line))
print(sorting_algorithm(x))
```
**Vigyázat:** Nem megfelelő változókezelés esetén előfordulhat, hogy az eredeti `x` változó sorrendje is felülíródik a függvény meghívásakor. Így pedig egy hibás második függvény tesztelésekor könnyen azt hihetjük, hogy az jól működik. Ennek elkerülése érdekében érdemes az alábbi sort illeszteni a függvények elejére (feltéve, hogy a bemenő paraméter neve `lista`):
``` python
lista = lista[:]
```
Ez a sor egy másolatot készít az átadott listából, és azt teszi a `lista` változóba. Így garantált, hogy az eredetileg átadott lista (a fenti példában `x`) értéke nem változik.