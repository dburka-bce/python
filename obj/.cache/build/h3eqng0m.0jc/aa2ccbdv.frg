<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>N&#233;zetek, t&#225;rolt elj&#225;r&#225;sok, f&#252;ggv&#233;nyek </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="N&#233;zetek, t&#225;rolt elj&#225;r&#225;sok, f&#252;ggv&#233;nyek ">
    <meta name="generator" content="docfx 2.59.4.0">
    
    <link rel="shortcut icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../../styles/docfx.css">
    <link rel="stylesheet" href="../../styles/main.css">
    <meta property="docfx:navrel" content="../../toc.html">
    <meta property="docfx:tocrel" content="../toc.html">
    
    
    
  </head>
  <body data-spy="scroll" data-target="#affix" data-offset="120">
    <div id="wrapper">
      <header>
        
        <nav id="autocollapse" class="navbar navbar-inverse ng-scope" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
              <a class="navbar-brand" href="../../index.html">
                <img id="logo" class="svg" src="../../logo.svg" alt="">
              </a>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
              <form class="navbar-form navbar-right" role="search" id="search">
                <div class="form-group">
                  <input type="text" class="form-control" id="search-query" placeholder="Search" autocomplete="off">
                </div>
              </form>
            </div>
          </div>
        </nav>
        
        <div class="subnav navbar navbar-default">
          <div class="container hide-when-search" id="breadcrumb">
            <ul class="breadcrumb">
              <li></li>
            </ul>
          </div>
        </div>
      </header>
      <div role="main" class="container body-content hide-when-search">
        
        <div class="sidenav hide-when-search">
          <a class="btn toc-toggle collapse" data-toggle="collapse" href="#sidetoggle" aria-expanded="false" aria-controls="sidetoggle">Show / Hide Table of Contents</a>
          <div class="sidetoggle collapse" id="sidetoggle">
            <div id="sidetoc"></div>
          </div>
        </div>
        <div class="article row grid-right">
          <div class="col-md-10">
            <article class="content wrap" id="_content" data-uid="">
<h1 id="nézetek-tárolt-eljárások-függvények" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="1">Nézetek, tárolt eljárások, függvények</h1>

<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="2"><a href="gyak10_x264.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="2">Összefoglaló videó</a></p>
<h2 id="nézetek" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="3">Nézetek</h2>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="4">A nézet egy elmentett, névvel ellátott lekérdezés.</p>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="6">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="6">A nézetekből ugyanúgy lehet lekérdezni, mint táblákból</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="7">A nézetek segítségével meghatározhatjuk a megjelenítendő adatok körét</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="8">A nézetekhez adhatunk jogosultságokat az  alaptáblákhoz való jogosultságok nélkül is</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="9">A DML-műveletek nem mindig megengedettek nézeteken keresztül</li>
</ul>
<h3 id="a-nézetek-két-fő-típusa" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="10">A nézetek két fő típusa</h3>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="11">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="11">Virtuális: csak a lekérdezés tárolódik (csak ez tananyag)</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="12">Materializált: az adatok is tárolásra kerülnek (indexed view)</li>
</ul>
<h3 id="létrehozás" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="13">Létrehozás</h3>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="14">CREATE VIEW view_név  
[(oszlopnevek listája)]
[WITH view_attribútumok]
AS SELECT_utasítás
[WITH CHECK OPTION]*
</code></pre>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="21">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="21">A szögletes zárójelbe tett részek opcionálisak</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="22">A view_attribútumokkal nem foglalkozunk</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="23">Az SQL Server 2016-tól a CREATE OR ALTER VIEW forma is használható</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="24">WITH CHECK OPTION záradék az adatintegritást segíti. Bekapcsolásával csak olyan adatmódosítást végezhetünk a view-n keresztül, amely megfelel a SELECT-ben lévő feltételeknek</li>
</ul>
<h3 id="példa" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="25">Példa:</h3>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="26">CREATE VIEW v_klimas_szobak
(Azonosító, Szobaszám, [Férőhelyek száma])
SELECT szoba_id, szoba_szama, ferohely
FROM szoba
WHERE KLIMAS=’i’

# A Nézet használata
SELECT * FROM v_klimas_szobak
</code></pre>
<h2 id="tárolt-eljárások" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="36">Tárolt eljárások</h2>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="37">A tárolt eljárás olyan adatbázis objektumként tárolt program, amely SQL- utasításokat is tartalmazhat.</p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="39">A tárolt eljárások főbb jellemzői</p>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="40">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="40">Input és output paramétereket, valamint különböző algoritmikus szerkezeteket is tartalmazhatnak (elágazás, ciklus)</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="41">Az adatbázis szerveren tárolódnak</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="42">Futtatásuk jogosultságokhoz köthető</li>
</ul>
<h3 id="tárolt-eljárások-létrehozása-sql-ben" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="43">Tárolt eljárások létrehozása SQL-ben</h3>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="44">CREATE PROCEDURE
eljárás_név
[paraméterek listája]
[WITH eljárás_opciók]
AS
[BEGIN]
Utasítások
[END]
</code></pre>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="54">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="54">A szögletes zárójelbe tett részek opcionálisak</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="55">Az eljárás opciókkal nem foglalkozunk</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="56">Az SQL Server 2016-tól a CREATE OR ALTER PROCEDURE forma is használható</li>
</ul>
<h3 id="példa-1" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="57">Példa</h3>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="58">CREATE PROCEDURE vevo_foglalasok
@vevoid nvarchar(20)
AS
BEGIN
SELECT *
FROM Foglalas
WHERE UGYFEL_FK = @vevoid
END
# Futtatás
EXEC vevo_foglalasok 'laszlo2'
</code></pre>
<h2 id="függvények" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="70">Függvények</h2>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="71">A (felhasználó által definiált) függvény olyan adatbázis objektum, amely végrehajt egy tevékenységet, majd annak eredményét visszaadja egy érték vagy egy tábla formájában
A függvények főbb jellemzői</p>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="73">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="73">Input paramétereket, SQL-utasításokat, valamint különböző algoritmikus szerkezeteket is tartalmazhatnak (elágazás, ciklus)</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="74">Az adatbázis szerveren tárolódnak</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="75">Futtatásuk jogosultságokhoz köthető</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="76">Felhasználhatók SQL-utasításokban, pl: SELECT utasításban</li>
</ul>
<h3 id="létrehozás-1" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="77">Létrehozás</h3>
<h4 id="skalárértékű" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="78">Skalárértékű</h4>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="79">CREATE FUNCTION fv_név
([paraméterek listája])
RETURNS adattípus_név
[WITH fv_opciók]
[AS]
BEGIN
Utasítások
RETURN skalár_kifejezés
END
</code></pre>
<h4 id="táblaértékű" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="90">Táblaértékű</h4>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="91">CREATE FUNCTION fv_név
([paraméterek listája])
RETURNS TABLE
[WITH fv_opciók]
[AS]
RETURN select_kifejezés
</code></pre>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="100">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="100">A szögletes zárójelbe tett részek opcionálisak</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="101">A fv. opciókkal nem foglalkozunk</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="102">Az SQL Server 2016-tól a CREATE OR ALTER FUNCTION forma is használható</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="103">A CLR-függvényekkel nem foglalkozunk</li>
</ul>
<h4 id="példa-2" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="104">Példa</h4>
<pre><code class="lang-sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="105">CREATE FUNCTION csillagszam
(@szallas_id INT)
RETURNS INT
AS
BEGIN
DECLARE @db INT
SELECT @db=CSILLAGOK_SZAMA
FROM Szallashely
WHERE SZALLAS_ID=@szallas_id
RETURN @db
END
# Függvény alkalmazása
SELECT dbo.csillagszam(5)
</code></pre>
<h2 id="függvények-és-tárolt-eljárások-összehasonlítása" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="120">Függvények és tárolt eljárások összehasonlítása</h2>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="121">A függvények sok tekintetben a tárolt eljárásokhoz hasonló tulajdonságokkal rendelkeznek, de van közöttük néhány fontos különbség.
| Függvények                                                              | Tárolt eljárások                         |   |
|-------------------------------------------------------------------------|------------------------------------------|---|
| Csak input paraméterek                                                  | Input és output paraméterek              |   |
| Tranzakciók nem használhatók                                            | Tranzakciók is használhatók              |   |
| A SELECT utasításban használhatók                                       | A SELECT utasításban nem használhatóak   |   |
| Kivételkezelés nem használható                                          | Kivételkezelés használható               |   |
| Nem hívhat meg tárolt eljárást                                          | Függvényhívás lehetséges                 |   |
| Mindig egy értéket adnak vissza (érték lehet egy skalár vagy egy tábla) | Visszaadhat nulla, egy vagy több értéket |   |</p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="131"><strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="131">Megjegyzések</strong>
-A nézetek definíciójában nem használható az ORDER BY záradék (kivéve, ha TOP záradék is definiálva van, ld. köv. gyakorlat)</p>
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="133">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="133">A nézetekben nem hivatkozhatunk ideiglenes táblákra (ld. köv. gyakorlat)</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="134">Tárolt eljárásoknál az output paramétereket az OUT kulcsszóval jelölhetjük, pl: @i INT OUT</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="135">A függvényekben sem paraméterként, sem visszaadott értékként nem szerepelhet a Timestamp típus</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="136">Afüggvények egymásba is ágyazhatók</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="137">Tárolt eljárásoknál és fv-eknél
<ul sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="138">
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="138">Elágazások megvalósítása: IF feltétel utasítás[blokk] [ELSE utasítás[blokk]]</li>
<li sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="139">Ciklusok megvalósítása: WHILE feltétel utasítás[blokk]</li>
</ul>
</li>
</ul>
<h1 id="feladatok" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="140">Feladatok</h1>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="141">A feladatok a szallashely adatbázishoz készültek,  létrehozásához szükséges script elérhető itt:
<a href="szallas.sql" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="142">szallas.sql</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="144">(+/-)Készítsünk sorszámozott listát a szálláshelyek adatairól!
a.	A lista legyen a szálláshely típusa szerint, azon belül hely szerint, majd a neve szerint növekvően rendezve!
b.	A számozás típusonként kezdődjön újra!
<a href="Gy10_1.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="147">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="149">(+/-)Készítsünk lekérdezést, amely a foglalások adatait jeleníti meg!
a.	A lista tartalmazzon két új oszlopot, amelyek az adott ügyfél legrövidebb, illetve leghosszabb foglalásának hosszát (a foglalt napok számát) mutatják meg!
b.	Az oszlopokat nevezzük el értelemszerűen!
<a href="Gy10_2.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="152">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="154">(+/-)Készítsük listát, amely megjeleníti az ügyfelek azonosítóját, nevét és a foglalásainak kezdő- és befejező dátumát, valamint azt, hogy a foglalás összesen hány főre történt!
a.	Egy új oszlopban jelenítsük meg azt is, hogy az ügyfél előző három foglalása összesen hány főre történt!
<a href="Gy10_3.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="156">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="158">(+/-)Készítsünk listát arról, hogy az egyes szálláshelyeken évente hány foglalás történt!
a.	A lista jelenítse meg a szálláshely azonosítóját, nevét, az évet, és a foglalások számát!
b.	Egy új oszlopban jelenítsük meg a szálláshely eddigi éves foglalásainak számát is (az aktuálisat is beleértve).
c.	Az évnél a METTOL dátumot vegyük figyelembe!
d.	A lista ne tartalmazzon duplikált sorokat!
<a href="Gy10_4.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="163">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="165">(+/-)Készítsük listát a szálláshelyekről! A lista tartalmazza a szálláshely azonosítóját, nevét, és a csillagok számát csillagszám szerint csökkenő, azon belül szállásnév szerint növekvő sorrendben!
a.	Vegyünk fel két új oszlopot, amely a sorrend szerint előző szálláshely nevét, illetve azonosítóját is megjeleníti!
<a href="Gy10_5.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="167">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="169">(+/-)<strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="169">Készítsünk nézetet NEPTUNKÓD_VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!</strong>
a.	Az oszlopoknak nem szükséges külön nevet adni!
b.	Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA
<a href="Gy10_6.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="172">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="174">(+/-) <strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="174">Készítsünk tárolt eljárást NEPTUNKÓD_SPUgyfelenkentiFoglalasok néve, amely ügyfelenkénti bontásban megjeleníti, hogy hány foglalás történt!</strong>
a.	Elég az ügyfél kódjával dolgozni!
b.	Teszteljük le a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelenkentiFoglalasok
<a href="Gy10_7.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="177">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="179"><strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="179">(+/-)Készítsen tárolt eljárást NEPTUNKÓD_SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!</strong>
a.	Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
<a href="Gy10_8.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="181">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="183"><strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="183">(+/-)Készítsen skalár értékű függvényt NEPTUNKÓD_UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!</strong>
a.	Teszteljük is a függvény működését, pl: SELECT dbo.UJAENB_UDFFerohely(600)
<a href="Gy10_9.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="185">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="187"><strong sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="187">(+/-)Készítsen tábla értékű függvényt NEPTUNKÓD_UDFFoglalasnelkuliek néven, amely azon ügyfelek adatait listázza, akik még nem foglaltak egyszer sem az adott évben adott hónapjában! A függvény paraméterként kapja meg a foglalás évét és hónapját! (Itt is a METTOL dátummal dolgozzunk)</strong>
a.	Teszteljük is a függvény működését,
pl: SELECT * FROM dbo.UJAENB_UDFFoglalasnelkuliek(2016, 10)**
<a href="Gy10_10.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="190">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="192">(+/-)Készítsünk nézetet NEPTUNKÓD_VFoglalasreszletek néven, amely a következő adatokat jeleníti meg: foglalás azonosítója, az ügyfél neve, a szálláshely neve és helye, a foglalás kezdete és vége, és a szoba száma.
a.	Az oszlopokat nevezzük el értelemszerűen!
b.	Teszteljük a nézet működését, pl: SELECT * FROM UJAENB_VFoglalasreszletek
<a href="Gy10_11.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="195">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="197">(+/-)Készítsen skalár függvényt NEPTUNKÓD_UDFAtlagosFoglalasszam néven, amely a paraméterként megkapott szállásazonosítóhoz megadja a napi foglalások átlagos számát (valós szám)! A napnál a METTOL dátumot használjuk!
a.	Ha az adott szálláson nem volt foglalás, akkor 0 jelenjen meg!
b.	Teszteljük a fv. működését, pl: SELECT dbo.UJAENB_UDFAtlagosFoglalasszam(1)
<a href="Gy10_12.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="200">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="202">(+/-)Készítsen tábla értékű függvényt NEPTUNKÓD_UDFJougyfelek néven, amely listázza azon ügyfelek azonosítóját és nevét, akik az átlagosnál többször foglaltak a paraméterként megadott időszakban (az átlag is az adott időszakra vonatkozzon)
a.	Az időszak kezdetét és végét a METTŐL dátumhoz viszonyítsuk!
b.	Az átlagnál egész számokkal dolgozzunk!
c.	Teszteljük a függvény működését,
pl: SELECT * FROM dbo.UJAENB_UDFJougyfelek('2016.01.01','2016.10.20')
<a href="Gy10_13.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="207">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="209">(+/-)Készítsünk tárolt eljárást NEPTUNKÓD_SPRangsor néven, amely rangsorolja a szálláshelyeket a foglalások száma alapján (a legtöbb foglalás legyen a rangsorban az első). A listában a szállás azonosítója, neve és a rangsor szerinti helyezés jelenjen meg - holtverseny esetén ugrással (ne sűrűn)!
a.	Teszteljük a tárolt eljárást, pl: EXEC UJAENB_SPRangsor
<a href="Gy10_14.mp4" sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="211">Megoldás</a></p>
<p sourcefile="adatb/gyak10/index.md" sourcestartlinenumber="213">(+/-)Töröljük le a létrehozott nézeteket, tárolt eljárásokat és függvényeket!</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/altinum/szamtud_docfx/blob/main/adatb/gyak10/index.md/#L1" class="contribution-link">Improve this Doc</a>
                  </li>
                </ul>
              </div>
              <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix" id="affix">
                <h5>In This Article</h5>
                <div></div>
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <footer>
        <div class="grad-bottom"></div>
        <div class="footer">
          <div class="container">
            <span class="pull-right">
              <a href="#top">Back to top</a>
            </span>
            
            <span>Generated by <strong>DocFX</strong></span>
          </div>
        </div>
      </footer>
    </div>
    
    <script type="text/javascript" src="../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../styles/main.js"></script>
  </body>
</html>
