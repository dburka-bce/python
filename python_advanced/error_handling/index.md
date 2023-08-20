# Hibakezelés
Kezeletlen hiba:
```python
10/0
```
```
---------------------------------------------------------------------------
ZeroDivisionError                         Traceback (most recent call last)
~\AppData\Local\Temp/ipykernel_11236/530406163.py in <module>
----> 1  10/0

ZeroDivisionError: division by zero
```
Megfelelően kezelt hiba:
```python
try:
    print(10/0)
except ZeroDivisionError:
    print("Véletlenül 0-val osztottunk")
```
```
Véletlenül 0-val osztottunk
```
Szándékosan kiváltott hiba:
```python
raise NameError('Hello')
```
```
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
~\AppData\Local\Temp/ipykernel_11236/2327143687.py in <module>
----> 1  raise NameError('Hello')

NameError: Hello
```

Hibakezelés függvényben:
```python
def divide(x, y):
    try:
        result = x / y
    except ZeroDivisionError:
        print("Nullával nem lehet osztani!")
    else:
        print("Az eredmény: ", result)
    finally:
        print("Finally")

divide(2, 1)
divide(2, 0)
divide("2", "1")
```
```
Az eredmény:  2.0
Finally
Nullával nem lehet osztani!
Finally
Finally
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
~\AppData\Local\Temp/ipykernel_11236/1759864827.py in <module>
----> 1  divide("2", "1")

~\AppData\Local\Temp/ipykernel_11236/2650830245.py in divide(x, y)
 1 def divide(x, y):
 2     try:
----> 3  result = x / y
 4     except ZeroDivisionError:
 5         print("Nullával nem lehet osztani!")

TypeError: unsupported operand type(s) for /: 'str' and 'str'
```
## Feladatok
1. Egészítsd ki a divide függvényt, hogy helytelen típusú input esetén is dobjon kivételt!