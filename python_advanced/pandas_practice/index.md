# Gyakorló feladat - Qatar 2022
Ennek a feladatnak az a célja, hogy egy nagy példába sűrítve segítsen gyakorolni a numpy, pandas és adatvizualizációs ismereteket. 

A feladathoz ezúttal is a  [*Kaggle*](https://www.kaggle.com/) weboldaláról választottunk adatállományokat a 2022-es Qatarban rendezett futball-világbajnoksághoz kapcsolódóan.
Az állományok:
- [Világbajnokságon játszott mérkőzések 1930-2018](https://www.kaggle.com/datasets/piterfm/fifa-football-world-cup?select=matches_1930_2018.csv) Letöltés:  [matches_1930_2018.csv](matches_1930_2018.csv).
- [Világbajnokságon játszott mérkőzések 2022](https://www.kaggle.com/datasets/piterfm/fifa-football-world-cup?select=matches_2022.csv) Letöltés:  [matches_2022.csv](matches_2022.csv).
- [Mérkőzések beosztása](https://www.kaggle.com/datasets/amineteffal/qatar2022worldcupschudule?select=matchs-schudule.csv) Letöltés:  [matchs-schudule.csv](matchs-schudule.csv).

A fájlok pontos tartalmával kapcsolatban ezúttal is az eredeti weboldalon lehet tájékozódni.
Az alábbi feladatsor tartalmaz olyan jellegű kérdéseket, amire a választ a notebook kimenete szolgáltassa formázott stringek formájában.
Például (feltételezve, hogy a legeredmenyebb változóban a legeredményesebb labdarúgó neve szerepel a korábbi kódnak köszönhetően):
```python
print(f'A legeredményesebb labdarúgó: {legeredmenyesebb}')
```

## 1. Adatok betöltése
1. Töltsd be megadott csv-ket egy-egy dataframe-be, és konvertáld az oszlopok neveit kisbetűssé!
2. Ellenőrizd, hogy 1930-2018 közötti és a 2022-es meccseket leíró állományok azonos oszlopokkal és adattípussal rendelkeznek-e, és ha igen, egyesítsd a két dataframe-et.
3. A betöltött állományok hány sorral és hány oszloppal rendelkeznek? Van valamilyen probléma a mérkőzésbeosztás táblázatával? Ha igen, korrigáld.
4. Az egyesített tábla milyen típusú indexekkel rendelkezik? Az index egyedi értékeket tartalmaz? Ha nem, korrigáld. Tipp: az index tulajdonság rendelkezik egy is_unique tulajdonsággal, amely erre felhasználható. A művelet után a dataframe oszlopainak száma egyezzen meg a művelet előttivel.
5. Nézzük meg milyen adatokat tartalmaznak a dataframe-ek: kérdezzük le az első és utolsó néhány sort, valamint a 10-19. sorokat többféleképpen.

## 2. Előfeldolgozás, mérkőzések dataframe
1. Vizsgáljuk meg mindkét dataframe-et olyan szempontból, hogy mely oszlopok tartalmaznak nullértékeket.
2. Dobjuk el a home_xg és az away_xg oszlopokat a mérkőzéseket tartalmazó dataframe-ből: az eXpected Goals érték csak igen kevés mérkőzés esetében áll rendelkezésre. 
3. Vizsgáljuk meg a mérkőzéseket tartalmazó dataframe utolsó 20 sorát. Mit állapíthatunk meg? Csak azokat a sorokat tartsuk meg, amelyek tartalmaznak tényleges eredményadatot.
4. A maradék oszlopok közül a karakterláncot tartalmazók esetében a null értékeket helyettesítsük üres karakterlánccal.
5. Kérdezzük le, hogy van-e olyan eset, amikor a home_goals/away_goals értéke null, de a megfelelő pontszám (home_score, away_score) értéke nem 0. Az olyan soroknál, amelyeknél a home_goals/away_goals null, és a megfelelő score 0, helyettesítsük be null értéket az oszlop típusához illő üres értékkel.
6. Szintén helyettesítsük be a megfelelő adattípusú értékkel a home_penalty és az away_penalty oszlopok null értékeit. Ezt követően újból ellenőrizzük a null értékek jelenlétét. Ha mindent jól csináltunk, a mérkőzéseket tartalmató dataframe 948 sort és 22 oszlopot tartalmaz.
7. Irasd ki a numerikus oszlopok közötti korrelációt. Melyik két oszlop között található erős korreláció?

## 3. Gólok dataframe
1. Képezzünk egy új dataframe-et amely a csapatot, az ellenfelet és a rúgott gólokat fogja tartalmazni. Ehhez vegyük először a year, home_team, a home_goals és az away_goals oszlopokat egy új dataframe-ként, majd tegyük ugyanezt a másik adatforrásunkból a year, round, away_team, az away_goals és a home_goals oszlopokkal. Végül egyesítsük a két dataframe-et úgy, hogy az eredménynek öt oszlopa legyen: year, round, team, opponent és goals.
2. Az előző művelet eredményeképpen az index oszlop duplkált értékeket tartalmaz. Képezzünk az új dataframe részére egy új indexet, úgy, hogy a régit is megtartjuk.
3. A goals oszlop jelenleg ömlesztve tartalmazza a két csapat részéről szerzett gólokat "|" határolókarakterrel. Hozzunk létre egy új dataframe-et, amely a rúgott gólokat soronként tartalmazza. Először nem baj, ha a formátum "1	Eden Hazard · 82" formájú, a későbbi lépésekben fogjuk ezt a problémát kezelni.
A kívánatos végeredmény a következő. Tipp: split használata.


| goals                                                                                 | goal                  |
|--------------------------------------------------------------------------------------------|----------------------------|
| Mario Mandžukić (OG) · 18\|Antoine Griezmann (P) · 38\|Paul Pogba · 59\|Kylian Mbappé · 65 | Mario Mandžukić (OG) · 18  |
| Mario Mandžukić (OG) · 18\|Antoine Griezmann (P) · 38\|Paul Pogba · 59\|Kylian Mbappé · 65 | Antoine Griezmann (P) · 38 |
| Mario Mandžukić (OG) · 18\|Antoine Griezmann (P) · 38\|Paul Pogba · 59\|Kylian Mbappé · 65 | Paul Pogba · 59            |
| Mario Mandžukić (OG) · 18\|Antoine Griezmann (P) · 38\|Paul Pogba · 59\|Kylian Mbappé · 65 | Kylian Mbappé · 65         |

>A feladat végrehajtásához hasznos segédeszköz a DataFrame explode metódusa, amely a dataframe egyes sorait egy listát tartalmazó cella mentén megtöbbszörözi úgy, hogy a lista megfelelő elemeit szébontja.
```python
df = pd.DataFrame({'letters': ['A','B','C'], 'numbers':[[1,2,3],[1,2],[1]]})
display(df)
display(df.explode('numbers'))
```
```python
  letters    numbers
0       A  [1, 2, 3]
1       B     [1, 2]
2       C        [1]
  letters numbers
0       A       1
0       A       2
0       A       3
1       B       1
1       B       2
2       C       1
```

4. Új dataframe-ünk egyelőre egy oszlopban tartalmazza a labdarúgó nevét és a gól időpontját. Bontsuk ezt fel két oszlopra!
5. A gól időpontját tartalmazó oszlop jelenleg tartalmazza a hosszabbításban lőtt gólok esetében az extra játékidő perceit. Készítsünk egy egyszerű függvényt, ami képes a kapott karakterláncot pluszjel mentén kettévágni, majd a két részt összeadni. A függvény kezelje, ha null értéket kap, ebben az esetben adjon vissza nullt, illetve azt is, ha nem összeget kap. Apply segítségével alkalmazzuk ezt a perceket tartalmazó oszlopra és az eredményt tároljuk. 
6. Konvertáljuk a függvényünk segítségével immár kizárólag számokat és null értékeket tartalmazó oszlopot számmá.
7. Képezzünk két új logikai oszlopot, amelyekben az öngól és a büntetőgól tényét tároljuk. Ezek jelölése (OG) illetve (P)
8. A plotly_express gapminder csomagját használva képezzünk egy continent oszlopot is a rúgott gólok mellé. Hány ország esetében nem találtunk megfelelő kontinenst, és ezek hány meccset érintenek? Pótoljuk a hiányzó országokat az alábbi fájl segítségével: [missingcountries.csv](missingcountries.csv). Gondoskodjunk arról, hogy a végén csak egyetlen "continent" oszlop maradjon.

## 4. Lekérdezések és vizualizáció
1. Melyik öt labdarúgó lőtte a legtöbb gólt a VB-k történetében az adatkészlet szerint?
2. Melyik európai nemzeti válogatott lőtte a legtöbb büntetőt?
3. Ábrázold oszlopdiagramon, hogy az egyesek kontinensek összesen hány gólt szereztek a vb-k történetében!
4. Ábrázold vonaldiagramon évről-évre a büntetők és az öngólok alakulását! Az ábrának legyen címe és jelmagyarázata is.
5. Készíts egy három subplotból álló ábrát. A diagramterület két soros, két oszlopos legyen, a bal felső cellában az öngólök, a jobb felső cellában a büntetők, az alsó bal és jobb cella egyesítve minden gólt tartalmazzon hisztogramon. Minden ábrának legyen címe és tengelyfelirata.

## 5. Melt
1. Képezz egy új dataframe-et a gólok alapján: tartalmazza az évet, játékos nevét, a percet,  büntető és öngólt jelölő oszlopokat. Csak azok a sorok kerüljenek be, amelyek ténylegesen rúgott gólokat tartalmaznak.
2. Képezzünk egy harmadik logikai típusú oszlopot, amelynek akkor igaz az értéke, ha sem nem öngól, sem nem büntető az adott gól.
3. Az előállt háromoszlopos táblát alakítsuk át úgy, hogy a következő oszlopokat tartalmazza: Év, Játékos, Góltípus, Perc
