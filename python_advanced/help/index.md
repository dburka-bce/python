# Help
Ahogy egy fejlesztő egyre több modult kezd használni, egyre nehezebbé válik a lehetséges funkciók és azok pontos működésének az észben tartása. Egy jól megírt modul általában egyben jól dokumentált is, és a csomag a kapcsolódó dokumentációt is tartalmazza, így a telepítése után könnyen elérhető. A Python modulok kapcsán is több lehetőségünk van az egyes funkciókkal kapcsolatos segítségek és dokumentációk lekérdezésére.

## help()
A `help()` függvény segítségével részletes leírást kaphatunk a kiválasztott funkció vagy modul kapcsán.
```python
help(max)
```
```
Help on built-in function max in module builtins:

max(...)
    max(iterable, *[, default=obj, key=func]) -> value
    max(arg1, arg2, *args, *[, key=func]) -> value
    
    With a single iterable argument, return its biggest item. The
    default keyword-only argument specifies an object to return if
    the provided iterable is empty.
    With two or more arguments, return the largest argument.
```
A függvény hasonlóan működik, mint a `print()`, tehát rögtön a kimenetre írja az eredményét. A fenti példában a `max()` függvénnyel kapcsolatos segítséget kértük le, de a függvény működik komplett modulokkal, osztályokkal és azok elemeivel is.
> Figyeld meg, hogy a segítség lekérésekor nem írtuk ki a `max` függvény neve után a zárójeleket!
```python
import numpy as np
help(np.arange)
```
```
Help on built-in function arange in module numpy:

arange(...)
    arange([start,] stop[, step,], dtype=None, *, like=None)
    
    Return evenly spaced values within a given interval.
    
    Values are generated within the half-open interval ``[start, stop)``
    (in other words, the interval including `start` but excluding `stop`).
    For integer arguments the function is equivalent to the Python built-in
    `range` function, but returns an ndarray rather than a list.
    
    When using a non-integer step, such as 0.1, the results will often not
    be consistent.  It is better to use `numpy.linspace` for these cases.
    
    Parameters
    ----------
    start : integer or real, optional
        Start of interval.  The interval includes this value.  The default
        start value is 0.
    stop : integer or real
        End of interval.  The interval does not include this value, except
        in some cases where `step` is not an integer and floating point
        round-off affects the length of `out`.
    step : integer or real, optional
        Spacing between values.  For any output `out`, this is the distance
        between two adjacent values, ``out[i+1] - out[i]``.  The default
        step size is 1.  If `step` is specified as a position argument,
        `start` must also be given.
    dtype : dtype
        The type of the output array.  If `dtype` is not given, infer the data
        type from the other input arguments.
    like : array_like
        Reference object to allow the creation of arrays which are not
        NumPy arrays. If an array-like passed in as ``like`` supports
        the ``__array_function__`` protocol, the result will be defined
        by it. In this case, it ensures the creation of an array object
        compatible with that passed in via this argument.
    
        .. versionadded:: 1.20.0
    
    Returns
    -------
    arange : ndarray
        Array of evenly spaced values.
    
        For floating point arguments, the length of the result is
        ``ceil((stop - start)/step)``.  Because of floating point overflow,
        this rule may result in the last element of `out` being greater
        than `stop`.
    
    See Also
    --------
    numpy.linspace : Evenly spaced numbers with careful handling of endpoints.
    numpy.ogrid: Arrays of evenly spaced numbers in N-dimensions.
    numpy.mgrid: Grid-shaped arrays of evenly spaced numbers in N-dimensions.
    
    Examples
    --------
    >>> np.arange(3)
    array([0, 1, 2])
    >>> np.arange(3.0)
    array([ 0.,  1.,  2.])
    >>> np.arange(3,7)
    array([3, 4, 5, 6])
    >>> np.arange(3,7,2)
    array([3, 5])
```
Sajnos nincs arra garancia, hogy ez a fajta súgó megfelelően legyen kitöltve minden modulban, de a széles körben használt funkciókhoz biztosan elérhető lesz. Sőt, gyakran még a felhasználással kapcsolatos példakódokat is tartalmaz.

## \_\_doc\_\_
A standard súgó mellett általában egy külön dokumentáció is elérhető az egyes elemekhez. Ennek a kitöltését sem kényszeríti ki a nyelv, de a gyakran használt elemekhez többnyire elérhető. A legtöbb esetben egy rövidebb, tömörebb leírást tartalmaz, mint a `help()` segítségével lekért súgó.

Ezt a leírást az elemek `__doc__` tulajdonsága tartalmazza. Az értékét a `print()` utasítással érdemes megjeleníteni, mert pusztán az outputra írva elveszik a formázása.

```python
print(max.__doc__)
```
```
max(iterable, *[, default=obj, key=func]) -> value
max(arg1, arg2, *args, *[, key=func]) -> value

With a single iterable argument, return its biggest item. The
default keyword-only argument specifies an object to return if
the provided iterable is empty.
With two or more arguments, return the largest argument.
```
A `max()` függvény dokumentációja jó példa arra, hogy egyszerű elemek esetén a súgó és a dokumentáció szinte teljesen megegyezik. De egy komplexebb modul esetén már lényeges eltérések lehetnek.

A dokumentáció egyik előnye a súgóval szemben a másodlagos szintaxisának működése. A dokumentáció lekérdezhető még az elem után írt `?` karakterrel is. Ilyenkor nincs szükség külön `print` metódusra, mert egy külön ablakban nyílik meg a dokumentáció. Így könnyen áttekinthető egyszerre a dokumentáció és az aktuális kódunk is.
```python
import numpy as np
np?
```
> A kérdőjel szintaxis nem minden Python verzióban érhető el, és vannak olyan fejlesztőkörnyezetek is, amik nem támogatják.

## dir()
A segítség és a dokumentáció lekérése hasznos funkció, de nem sokat érünk vele, ha nem ismerjük az elérhető funkciókat egy adott modulban. A `dir()` függvény segítségével lekérdezhető egy modul vagy egy osztály elérhető funkcióinak listája.
```python
import math
dir(math)
```
```
['__doc__',
 '__loader__',
 '__name__',
 '__package__',
 '__spec__',
 'acos',
 'acosh',
 'asin',
 'asinh',
 'atan',
 'atan2',
 'atanh',
 'ceil',
 'comb',
 'copysign',
 'cos',
 'cosh',
 'degrees',
 'dist',
 'e',
 'erf',
 'erfc',
 'exp',
 'expm1',
 'fabs',
 'factorial',
 'floor',
 'fmod',
 'frexp',
 'fsum',
 'gamma',
 'gcd',
 'hypot',
 'inf',
 'isclose',
 'isfinite',
 'isinf',
 'isnan',
 'isqrt',
 'lcm',
 'ldexp',
 'lgamma',
 'log',
 'log10',
 'log1p',
 'log2',
 'modf',
 'nan',
 'nextafter',
 'perm',
 'pi',
 'pow',
 'prod',
 'radians',
 'remainder',
 'sin',
 'sinh',
 'sqrt',
 'tan',
 'tanh',
 'tau',
 'trunc',
 'ulp']
```