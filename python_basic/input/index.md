# Input
A legtöbb program célja, hogy megoldást nyújtson a végfelhasználó valamilyen problémájára. Ehhez azonban elengedhetetlen, hogy a felhasználó információt tudjon továbbadni a programnak. Az `input` parancs segítségével lehetőségünk van adatot bekérni a felhasználótól a konzolon keresztül.
```python
uzenet = input("Mondj valamit és én megismétlem: ")
print(uzenet)
```
```
Mondj valamit és én megismétlem: [                 ]
```
A fenti példa során a következő történik:
1. A program indítása után megjelenik az `input` függvénybe paraméterként átadott szöveg. Mellette pedig egy szövegdoboz, amibe szöveget tud írni a felhasználó. (Érdemes megfigyelni, hogy a szöveg végére egy szóközt tettünk, hogy a bemeneti mező ne érjen össze szöveggel.)
2. Ekkor a felhasználó bármilyen szöveget írhat a mezőbe. A beírt szöveget az *Enter* lenyomásával hagyja jóvá. Amíg nem nyomja meg az *Enter*-t addig nem fut tovább a program.
3. A jóváhagyás után a beírt szöveg bekerül az `uzenet` változóba.
4. Végül megjelenítjük az üzenet tartalmát.

Ha a beírt szöveg például "Hello World!" (az idézőjelet nem kell kiírni), akkor a program futása végén az output így fog kinézni:
```
Mondj valamit és én megismétlem: [Hello World!]
Hello World!
```
A továbbiakban az outputban szögletes zárójelekkel jelöljük majd a bemeneti mező helyét!

## Bemenet konvertálása
Az `input` függvény használata során a Python szövegként fogja kezelni a bemenetet, függetlenül annak tartalmától. Ez tipikusan számértékek megadása során jelent problémát.
```python
x = input("Mondj egy számot és megmondom a négyzetét: ")
print(x ** 2)
```
```
Mondj egy számot és megmondom a négyzetét: [10]

---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-8-9274696a4539> in <module>
 1 x = input("Mondj egy számot és megmondom a négyzetét: ")
----> 2  print(x ** 2)

TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'int'
```
Látható, hogy a szám megadása után, amint egy szöveggel nem értelmezhető műveletet próbálunk végezni, azonnal egy hibaüzenet fogad minket. Ezért, ha nem szöveg típusú adattal akarunk dolgozni,  akkor át kell [konvertálnunk](/python_basic/type_conversion/) a bemenetet.
```python
x = input("Mondj egy számot és megmondom a négyzetét: ")
x = int(x)
print(x ** 2)
```
```
Mondj egy számot és megmondom a négyzetét: [10]
100
```
# Ellenőrző kérdések, feladatok:
1.	Kérd be a felhasználótól a nevét, majd üdvözöld a kimeneten a teljes nevén!
2.	Kérd be a felhasználótól a nevét, majd üdvözöld a kimeneten a keresztnevén!
3.	Kérd be a felhasználótól egy kör sugarát, és írd ki a területét. Ezúttal nem kell foglalkoznod azzal, ha a felhasználó nem számmá konvertálható értéket ad meg.
4.	Kérj be a felhasználótól egy lebegőpontos számot, majd írd ki a kimenetre egész számmá konvertálva.
5.	Kérj be a felhasználótól egy karakterláncot, majd írd ki megfordítva!
