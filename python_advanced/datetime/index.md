# Dátumok
A Python alap eszközkészlete nem tartalmaz a dátumok és az idő kezelésére szolgáló eszközöket, mivel a legtöbb algoritmus megvalósításához ezekre nincs szükség. Amennyiben dátumokat akarunk kezelni, be kell tölteni a `datetime` csomag megfelelő elemeit. (Ez a Python telepítésével felkerül a gépünkre, nem kell külön letöltenünk.)
## Dátum
A dátumkezelő függvények használata esetén a date-t kell importálni a datetime module-ból.
```python
from datetime import date

date.today()
a = date(2019, 4, 13)
print(a)
```
```
datetime.date(2021, 10, 20)
2019-04-13
```

## Idő
Az időkezelő függvények használata esetén a datetime-t kell importálni a datetime module-ból.
```python
from datetime import datetime

a = datetime.now().time()
print(a)
a.hour, a.minute, a.second, a.microsecond
```
```
10:36:01.632524
(10, 36, 1, 632524)
```

## Datetime
```python
import datetime

x = datetime.datetime.now()
x
x.year
x.strftime("%A")
x.strftime("%Y-%m-%d %H:%M:%S")
date_string = "21 June, 2021"
datetime.datetime.strptime(date_string, "%d %B, %Y")
date_string = "2021-10-16"
datetime.datetime.strptime(date_string, "%Y-%m-%d")
```
```
datetime.datetime(2021, 10, 20, 10, 36, 19, 619533)
2021
'Saturday'
'2021-10-16 10:36:19'
datetime.datetime(2018, 6, 21, 0, 0)
datetime.datetime(2021, 10, 16, 0, 0)
```

## Időbélyeg
A dátumot és az időt időbélyegként is eltárolhatjuk, amely float típusú és időzónát nem tárol el. A datetime és time típusú adatformátumok az időzónát is eltárolják.
```python
import datetime

print(time.time())

timestamp = 1634142950
datetime.datetime.fromtimestamp(timestamp)
```
```
1634373870.2188792
datetime.datetime(2021, 10, 13, 18, 35, 50)
```

## Timedelta
Dátumokkal való műveletek elvégzése esetén hasznos.
```python
from datetime import datetime, date, timedelta

t1 = date(year = 2021, month = 7, day = 12)
t2 = date(year = 2020, month = 12, day = 23)
t3 = t1 - t2

t3, t3.days

t1 = datetime.now()
t2 = timedelta(days = 14)
t3 = t1 - t2

t3
t2.total_seconds()
```
```
(datetime.timedelta(days=201), 201)
datetime.datetime(2021, 10, 2, 10, 46, 59, 146879)
1209600.0
```
