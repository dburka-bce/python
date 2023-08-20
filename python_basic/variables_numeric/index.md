# Numerikus típusok
A Pythonban három beépített numerikus típus létezik:
- `int` egész értékek tárolására
- `float` lebegőpontos számok tárolására
- `complex` kompex számok tárolására

A változó típusa akkor dől el amikor értéket kap. A típus a `type()` függvénnyel bármikor lekérdezhető. 
  
``` python
a = 1  # int
b = 3.14  # float
c = 1 + 1j  # complex

print(type(a))
print(type(b))
print(type(c))
```
```
<class 'int'>
<class 'float'>
<class 'complex'>
```
Amennyiben egy változó értéke már adott, de más típusú adatként van rá szükségünk, akkor [típuskonverziót](/python_basic/type_conversion/) kell alkalmazni.

## `int` -- egész számok

Az `int` egész számot tárol, értéke lehet pozitív vagy negatív, tizedesjegy nélkül. Gyakorlatilag korlátlan hosszúságú.  (A dupla csillag a hatványozás jele.)

``` python
hosszú_szám = 6 * 10 ** 23 + 1
print(hosszú_szám)
```
```
600000000000000000000001
```
De lehetünk merészebbek is:

``` python
nagyon_hosszú_szám =  6  *  10  **  230  +  1
print(nagyon_hosszú_szám)
```
```
600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001
```
  

## `float` -- lebegőpontos számok

A tizedes pontot tartalmazó szám literálokat a Python `float` típusúnak tekinti. (Az angol nyelv pontot használ szemben a magyar tizedesvesszővel.)  A tudományos formátumban megadott számokat szintén `float`-ként értelmezi a Python -- annak ellenére hogy a példában szereplő értékek mind egészek.

``` python
f1 = 1.0
f2 = 6e23
f3 = 6E23

print(type(f1))
print(type(f2))
print(type(f3))
```
```
<class 'float'>
<class 'float'>
<class 'float'>
```
Fontos megjegyezni, hogy a lebegőpontos számok tárolására a Python 8 byte-ot használ -- a szám kettes számrendszerbeli normálalakja kerül tárolásra a memóriában. Ennek megfelelően fel kell készülni a számábrázolásból fakadó hibákra. Lebegőpontos számok mellett ez a gyakorlatban a 15-16 tizedesjegy körül jelentkezik. Az alábbi mintaprogramban, amikor egyszerűen kiíratjuk változó értékét, a hiba nem tűnik fel, hiszen a Python alapértelmezetten csak a szám releváns részét jeleníti meg. Ha viszont a megfelelő formázási paraméterrel kikényszerítjük a 30 tizedesig történő kiíratást, rögtön szembetűnik a számábrázolás hibája.

``` python
x = 1 / 10
print(x)
s = format(x,".30f")
print(s)
```
```
0.1
0.100000000000000005551115123126
```

A számábrázolási hibák általában csak komplex számítási problémák során merülnek fel. Sokat segít a probléma orvoslásában, ha a kód írása során odafigyelünk, hogy az osztási műveleteket csak a lehető legkésőbb végezzük el. De szükség esetén a `decimal` modul is használható, de ezzel majd később foglalkozunk.

## Műveletek
Természetesen az összes alapművelet (`+`, `-`, `*`, `/`) alkalmazható a számokkal kapcsolatban. Az osztás kivételével a műveletek mindig a leginkább összetett adattípust adják eredményül. Egy `int` és egy `float` összege tehát mindig `float` lesz. Osztás esetén viszont automatikusan `float` az eredmény még akkor is, ha két `int` értéket osztottunk egymással.
``` python
a = 1
b = 2
c = 3.0

print(type(a + b))
print(type(a / b))
print(type(a - c))
```
```
<class 'int'>
<class 'float'>
<class 'float'>
```
Gyakran használt operátor még a hatványozás (`**`) és modulo (`%`).
``` python
print(3 ** 2)
print(10 % 3)
```
```
9
1
```
# Ellenőrző kérdések, feladatok:
1. Készítsen programot, amely kiszámolja és megjeleníti, hogy 20 ezer Ft mennyit ér euróban és dollárban! 
    - az euró árfolyama legyen 352.5 Ft, a dolláré pedig 295.5 Ft
    - a számításhoz használjon változókat!
    - az eredményt egészre kerekítve adja meg!
2. Készítsen programot, amely megoldja a ax+b=0 elsőfokú egyenletet, majd megjeleníti a megoldást 2 tizedesjegy pontossággal!
    - legyen a=3 és b=1
    - az eredmény a következő formában jelenjen meg: "Az egyenlet megoldása: {megoldás értéke}"
3. Számítsuk ki és jelenítsük meg a téglatest térfogatának és felszínének nagyságát, ha élei a=3, b=4 és c=5 egység hosszúak
    - A térfogat: V=abc, a felszín: A=2(ab+ac+bc)
    - A választ esztétikus formában, 1 sorban adjuk meg! 
4. Készíts programot, amely megadja egy 8 sugarú kör kerületét, majd két tizedesjegyre formázva kiírja az outputra!
5. Készíts programot, amely megadja 9 tizedik hatványát!
6. Készíts programot, amely megadja két adott szám osztási maradékát.
7. Készíts programot, megadja két adott szám egész osztási eredményét!
8. Készíts programot, amely megadja egy derékszögű háromszög két befogójából az átfogó hosszát. Tipp: hatványozás operátor használata.
