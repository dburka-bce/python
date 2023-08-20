# Tuple
  
A `tuple` egy rendezett immutábilis gyűjtemény. Az immutabilitás azt jelenti, hogy a gyűjtemény elemeit a létrehozás után nem lehet megváltoztatni. Ha például a gyűjteményhez új elemet akarunk hozzáadni, a memóriában egy új `tuple` jön létre.

## Tuple létrehozása

`tuple` létrehozható a benne szereplő értékeket kerek zárójelben történő felsorolásával. Emlékeztetőül: a [lista](/content/python_basic/list) elemeit szögletes zárójelben kellett felsorolni.

``` python
t = ("alma","banán","cseresznye","dinnye")
l = ["alma","banán","cseresznye","dinnye"]

print(type(t))
print(type(l))
```
```
<class 'tuple'> 
<class 'list'>
```

A `tuple` rendezett típus (ordered), a benne szereplő értékek sorrendje számít. A `tulpe`-ben szereplő értékek könnyen ki olvashatók változóba.

``` python
t = ("alma","banán","cseresznye","dinnye")
a, b, c, d = t
print(a)
print(b)
print(c)
print(d)
```
```
alma 
banán 
cseresznye 
dinnye
```
Azonban, ha a változók száma nem egyezik meg a `tuple` elemeinek számával, hibára fut a program.

## Típuskonverzió
Lista könnyedén `tuple`-lé alakítható -- és vissza:
``` python
l = ["alma","banán","cseresznye","dinnye"]
t =  tuple(l)
print(type(t))
l2 =  list(t)
print(type(l2))
```
```
<class 'tuple'> 
<class 'list'>
```

## Sorted
A `tuple` immutábilis, ezért nem érhető el hozzá a `sort` metódus hívás.  A `sorted` parancs azonban hasonló funkcionalitással rendelkezik, és bármelyik szekvencia típussal használható. Abban tér el a `sort`-tól, hogy a sorba rendezést nem az eredeti gyűjteményen végzi, hanem egy új gyűjteményt hoz létre, aminek az elemei a megfelelő sorrendben vannak.
``` python
cars = ('Ford', 'Mitsubishi', 'BMW', 'VW')
print(sorted(cars))
print(cars)
```
```
['BMW', 'Ford', 'Mitsubishi', 'VW']
('Ford', 'Mitsubishi', 'BMW', 'VW')
```
Az előző példa kimenetéből már látszik, hogy a `sorted` metódus eredménye nem egy tuple, hanem egy rendezett lista. De a típuskonverzió segítségével az eredmény átalakítható a megfelelő típusra.

``` python
cars = ('Ford', 'Mitsubishi', 'BMW', 'VW')
cars_sorted = sorted(cars)
cars_sorted_tuple = tuple(cars_sorted)

print(type(cars))
print(type(cars_sorted))
print(type(cars_sorted_tuple))
```
```
<class 'tuple'>
<class 'list'>
<class 'tuple'>
```
De persze ugyanezt lehet rövidebben is írni, illetve nincs szükség új változóra, az eredeti is felülírható.
``` python
cars = ('Ford', 'Mitsubishi', 'BMW', 'VW')
print(type(cars))

cars = tuple(sorted(cars))
print(type(cars))

print(cars)
```
```
<class 'tuple'>
<class 'tuple'>
('BMW', 'Ford', 'Mitsubishi', 'VW')
```