# Plotly
A `Plotly` egy komplex adatvizualizációs Python modul. A `Pandas` modulra épül, és lényegesen több lehetőséget biztosít, mint a `MatPlotLib`. Cserébe a modul struktúrája és használata lényegesen bonyolultabb.

Telepítés:
```
pip install plotly
pip install plotly_express
```
A `plotly_express` a `plotly` egy egyszerűsített változata, amiben a legtöbb alap funkció elérhető.

A `Plotly`-nak három fő modulja van: 

    plotly.plotly
    plotly.graph.objects
    plotly.tools

1. A `plotly.plotly` az interfész a sajátgép és a `plotly` szerver között. Olyan függvényeket tartalmaz, amelyek függnek a szervertől.
2. A `plotly.graph_objects` tartalmazza az objektumokat (figure, layout és plot definíció mint scatter plot, line chart), amelyekből fölépül az ábra. A figure egy `dict` vagy egy `plotly.graph_objects` példány. Ezekből lesz egy `JSON`, amelyet a `plotly` `javascript` nyelv segítségével jelenít meg.
3. A `plotly.tools` modul többféle függvényt használni, melyek eszközként képesek feltuningolni a Plotly ábrákat.

Vegyük a következő `figure` példát a `plotly_express` felhasználásával:
```python
import plotly_express as px

fig = px.line(x=[1,2, 3], y=[1, 2, 3])
print(fig)
```
```
Figure({
    'data': [{'hovertemplate': 'x=%{x}<br>y=%{y}<extra></extra>',
              'legendgroup': '',
              'line': {'color': '#636efa', 'dash': 'solid'},
              'marker': {'symbol': 'circle'},
              'mode': 'lines',
              'name': '',
              'orientation': 'v',
              'showlegend': False,
              'type': 'scatter',
              'x': array([1, 2, 3], dtype=int64),
              'xaxis': 'x',
              'y': array([1, 2, 3], dtype=int64),
              'yaxis': 'y'}],
    'layout': {'legend': {'tracegroupgap': 0},
               'margin': {'t': 60},
               'template': '...',
               'xaxis': {'anchor': 'y', 'domain': [0.0, 1.0], 'title': {'text': 'x'}},
               'yaxis': {'anchor': 'x', 'domain': [0.0, 1.0], 'title': {'text': 'y'}}}
})
```
A figure fa elrendezésű, amelyben a gyökérnek három tulajdonsága van: data (adat), layout (elrendezés) és frames (keret). A fentebbi példában a layout.legend egy olyan beágyazott szótár (dictionary) ahol a legend egy kulcs a szótáron belül és aminek az értéke szintén egy szótár.

A függvény kirajzolása az alábbi módon történik:
```python
import plotly_express as px

fig = px.line(x=[1,2, 3], y=[1, 2, 3])
fig.show()
```

>Ha nem jupyter notebookot használsz a kód futtatására, előfordulhat, hogy az ábra nem jelenik meg. 
>ebben az esetben lehet hasznos az alábbi kódrészlet:
 ```python
import plotly.io as pio
#Ebben az esetben böngészőben jelenik meg az output:
pio.renderers.default = 'browser'  
#Ebben az esetben pl. spyder esetén a beépített megjelenítőben. Kiegészítő csomag (kaleido) telepítése szükséges lehet!
pio.renderers.default = 'svg'  
```

Egyéb hasznos források:
[https://www.kaggle.com/kanncaa1/plotly-tutorial-for-beginners](https://www.kaggle.com/kanncaa1/plotly-tutorial-for-beginners)
[https://towardsdatascience.com/visualization-with-plotly-express-comprehensive-guide-eb5ee4b50b57
](https://towardsdatascience.com/visualization-with-plotly-express-comprehensive-guide-eb5ee4b50b57
)[https://www.geeksforgeeks.org/python-plotly-tutorial/](https://www.geeksforgeeks.org/python-plotly-tutorial/)

## Ábrák
###  Adatbetöltés

Ebben az alfejezetben az ábrákhoz a plotly_express beépített Gapminder adatait fogjuk használni.
Csinálunk egy leszűrt adattáblát, amelyben csak a magyar adatok szerepelnek, majd egy másikat, amelyben csak a legutolsó éves adatokat használjuk. Készítünk egy új oszlopot is, amelyre később még szükség lesz.
```python
import plotly_express as px

gf = px.data.gapminder()

gf1 = gf.loc[gf['country'] == 'Hungary']

gf2 = gf.sort_values(by=['country', 'year']).drop_duplicates(subset=['country'], keep='last')
gf2['count'] = 1
```
Ennek a kódrészletnek a futtatása szükséges lesz néhány további kódrészlet használatához. Vagy másold a megfelelő kód elejére, vagy jupyterben egy második, független cellában dolgozz. (Első körben érdemes a `head` paranccsal megnézni az adatstruktúrát.)

### Vonaldiagram
Készítsünk egy vonaldiagramot, amely az x-tengelyen az éveket az y-tengelyen pedig az egy főre jutó GDP-t ábrázolja
```python
fig = px.line(gf1, x='year', y='gdpPercap')
fig.show()
```
Nézzük meg, hogy milyen paramétereket adhatunk még meg a px.line() függvénynek.
```python
px.line?
```

### Oszlopdiagram
Készítsünk egy előzőhöz hasonló ábrát csak oszlopdiagramként.

```python
fig = px.bar(gf2, x='country', y='gdpPercap')
fig.show()
```
Nézzük meg az olyan interaktív plotly lehetőségeket mint a nagyítás és leszűrés. Rajzoljuk ki az ábrát még egyszer miután sorba rendeztük az értékeket.
```python
gf2.sort_values(by='gdpPercap', inplace=True)
fig = px.bar(gf2, x='country', y='gdpPercap')
fig.show()
```

### Hisztogram
A hisztogram segítségével eloszlásokat ábrázolhatunk ezért szükségünk lesz egy darabszámra. Szerencsére korábban csináltunk egy ilyen oszlopot 'count' néven
```python
fig = px.histogram(gf2, x='lifeExp', y='count')
fig.show()
```

### Szórvány- és buborékdiagram
A szórványdiagram segítségével megfigyelhetjük, hogy van-e korreláció a különböző értékek között. Itt használni fogjuk még a `hover_name` paramétert, amely megadásával láthatjuk az adott ország nevét ha rávisszük a kurzort az értékre. Elsőként készítsünk egy szórványdiagramot a kontinensre és a várható élettartamra.
```python
fig = px.scatter(gf2, x='continent', y='lifeExp', hover_name='country')
fig.show()
```

Az előbbi ábrán azért nem látható az értékek közti korreláció mert a kontinens egy kategorikus változó. Éppen ezért csináljuk még egy ábrát, csak ezúttal a várható élettartam és az egy főre jutó GDP között.

```python
fig = px.scatter(gf2, x='gdpPercap', y='lifeExp', hover_name='country')
fig.show()
```

Adjunk hozzá egy trendvonalat és tegyük logaritmusossá az X-tengelyt.
```python
fig = px.scatter(gf2, x='gdpPercap', y='lifeExp', hover_name='country', trendline='lowess', log_x=True)
fig.show()
```
A buborék diagram valójában egy olyan szórványdiagram, ahol egy harmadik változót ábrázolunk a buborékok méretével.
```python
fig = px.scatter(gf2, x='continent', y='lifeExp', hover_name='country',  size='pop', color='continent')
fig.show()
```
### Kördiagram
Ábrázoljuk a népességet kontinensekre lebontva.
```python
fig = px.pie(gf2, values='pop', names='continent')
fig.show()
```

### Dobozrajz
A dobozrajz előnye, hogy több statisztikai értékét is ábrázolja az adott változónak. Lentről indulva ábrázolja a minimumot az első kvartilis végét, a mediánt, a harmadik kvartilis végét és a maximumot. A külön pontokkal jelölt értékek kiugrónak minősülnek.

Ábrázoljuk az egy főre jutó GDP-t kontinensenként úgy, hogy a kurzort az rétékekre víve az országokat mutassa.
```python
fig = px.box(gf2, x='continent', y='gdpPercap', hover_name='country')
fig.show()
```

### Hegedűdiagram

A hegedűdiagram nagyon hasonlít a dobozdiagramhoz, viszont ahelyett, hogy megmutatná a változó statisztikai értékeit, az eloszlást ábrázolja részletesebben.
```python
fig = px.violin(gf2, x='continent', y='gdpPercap', hover_name='country')
fig.show()
```
Az előbbi ábrán úgy tűnhet mintha negatív GDP adataink is lennének, de ez csak egy vizuális bug. Sajnos a Plotly Expressen belül ezt nem lehet egyszerűen javítani, de ugyanakkor ez jó példa arra, hogy néha a komplexebb alap Plotlyt kell használnunk. Az alábbi kód spandmode='hard' paramétere már helyes ábrázolást eredményez.
```python
fig = go.Figure()  
fig.add_trace(go.Violin(x=gf2['continent'], y=gf2['gdpPercap'], spanmode='hard'))  
fig.show()
```

### Gantt-diagram
A Gantt-diagramot rendszerint a munka vagy különböző feladatok megtervezésére használják. Az ábrán az X-tengely rendszerint az eltelt időt mig az Y-tengelyen szerint elrendezett szalagok a különböző tevékenységeket ábrázolják.

Szótár készítése az ezévi tantervről:
```python
import plotly.figure_factory as ff

gant = [dict(Task='Első harmad', Start='2021-09-13', Finish='2021-10-17'),
        dict(Task='Második harmad', Start='2021-10-18', Finish='2021-11-22'),
        dict(Task='Harmadik harmad', Start='2021-11-22', Finish='2021-12-20')]
fig = ff.create_gantt(gant)
fig.show()
```

## 3 változós ábrák
### Kontúrdiagram
A kontúrdiagram segítségével 3D ábrát tudunk 2D módon ábrázolni. A 3D jelen esetben azt jelenti, hogy három különböző változót ábrázolunk. Ebben az esetben a Z érték változását mutatjuk, meg két másik változó (X, Y) függvényében.
```python
import numpy as np
import plotly.graph_objects as go

feature_x = np.arange(0, 50, 2)
feature_y = np.arange(0, 50, 3)
[X, Y] = np.meshgrid(feature_x, feature_y)
Z = np.cos(X / 2) + np.sin(Y / 4)

haromd1 = go.Contour(x = feature_x, y = feature_y, z = Z)

fig = go.Figure(haromd1)
fig.show()
```

### Hőtérkép
A hőtérkép grafikus módon jeleníti meg a mátrix formában található adatokat. A nagyobb értékek élénkebb a kisebbek pedig sötétebb színekkel vannak megjelenítve. Az ábrán meghívót update_layout funkció segítségével többek között megadhatunk egy címet és annak pozícióját (jelen esetben középre zárás).
```python
import plotly_express as px
import plotly.graph_objects as go

gf = px.data.gapminder()
gf2 = gf.sort_values(by=['country', 'year']).drop_duplicates(subset=['country'], keep='last')
gf2['count'] = 1

haromd2 = px.density_heatmap(gf2, x = 'lifeExp', y = 'gdpPercap', z = 'pop')

fig = go.Figure(haromd2)
fig.update_layout(title_text='Hőtérkép', title_x=0.5)
fig.show()
```

### 3D szórványdiagram

3 dimenziós szórványdiagram 3 változót egyszerre tud megjeleníteni.
```python
import plotly_express as px

gf = px.data.gapminder()
gf2 = gf.sort_values(by=['country', 'year']).drop_duplicates(subset=['country'], keep='last')
gf2['count'] = 1

fig = px.scatter_3d(gf2, x = 'lifeExp',y = 'gdpPercap', z = 'pop', color = 'continent')
fig.show()
```

## Interaktív ábrák

### Választható ábra
A következő kódrészlet mutatja meg, hogy mit kell tennünk ha szeretnénk még interaktívabbá tenni a plotly ábránkat. A layout tulajdonságon belül az updatemenu függvényt lehet arra használni, hogy egy leugró fülön több ábra között lehessen váltani.
```python
import numpy as np
import plotly.graph_objects as go

# Random számokat tartalmazó adattábla létrehozása
np.random.seed(42)
random_x = np.random.randint(1, 101, 100)
random_y = np.random.randint(1, 101, 100)
 
plot = go.Figure(data=[go.Scatter(x=random_x, y=random_y, mode='markers')])
 
# A leugró fül implementálása
plot.update_layout(
    updatemenus=[
        dict(
            buttons=list([
                dict(
                    args=['type', 'scatter'],
                    label='Scatter Plot',
                    method='restyle'
                ),
                dict(
                    args=['type', 'bar'],
                    label='Bar Chart',
                    method='restyle'
                )
            ]),
            direction='down',
        ),
    ]
)
 
plot.show()
```
### Animáció

Plotly lehetőséget ad az animációk használatára, amely különösen alkalmas az idő múlásának a megjelenítsére. Az alábbiakban a szokásos paramétereken túl megadjuk még az X és Y tengely szélsőértékeit (range_x, range_y), hogy az animáció minden esetben az ábra keretein belül maradjon, illetve a maximum változó pont méretet (size_max) is, hogy a nagy országok ne takarják ki a többit.
```python
import plotly_express as px

gf = px.data.gapminder()

px.scatter(gf, x='gdpPercap', y='lifeExp', size='pop', color='continent', hover_name='country',
           animation_frame='year', animation_group='country', log_x=True, 
           size_max=55, range_x=[100,100000], range_y=[25,90])
```
Érdemes megnézni a [Plotly weboldalt](https://plotly.com/python/getting-started/), ahol az alapokon túl sok inspirációt lehet találni a különböző ábrafelhasználási területekre.

## Feladatok
1.  Töltsd be a szeged.csv dokumentumot. Formázd a 'Formatted Date' oszlopot: vágd le a szöveg végéről a mikromásodpercet és az időzónát, majd a megmaradt oszlopot konvertáld dátum formátúvá.
2.  Készíts egy vonaldiagramot a 2016 április 4. tapasztalható hőmérsékletről.
3.  Készíts egy szórványdiagramot az összes decemberi hőmérsékletekről. Az ábrán a kurzor kijelölése esetén szerepeljen a pontos időpont. Az ábra alapján olvasd le pontosan mikor volt a leghidegebb és legemelegebb a vizsgált időszakban
4.  Szűrd le az adatokat azokra az esetekre amikor 40-nél nagyobb volt a szél. Készíts egy 3d szórványdiagramot, amelynek x értéke a látási távolság, y értéke a szélsebesség és z értéke a hőmérséklet. Az ábra alapján mond meg, hogy melyik időpontban volt a legnagyobb a szél, mikor volt legnagyobb a hőmérséklet és mikor volt az a hóesős időpont amikor a legkisebb volt a látótávolság.
5.  Csinálj egy új oszlopot, amely a valós és érezhető hőmérséklet közti különbséget tartalmazza. Nevezd el 'Temp Diff'-nek. Szűrd le az adattáblát úgy, hogy csak a 2010-es és csak az 1-nél nagyobb 'Temp Diff' adatokat tartalmazza. Készíts egy olyan ábrát, ahol az X-tengegy a 'Temp Diff', Y-tengely pedig a szélsebesség. Az ábrán leugró fül segítségével ki lehessen választani, hogy szórványdiagramot vagy hisztogramot akarunk-e látni.
