# Rendező algoritmusok
A rendezés a számítástudomány egyik leginkább kutatott algoritmusa. Számos különböző implementációja létezik, melyekkel hatékonyabbá tehető a kódunk működése.

Számos probléma megoldása kapcsán van szükség rendezésre:
- A legutóbbi alkalommal láttuk, hogy a **keresés** lényegesen hatékonyabb egy rendezett adatsoron.
- Több elem **kiválasztása** egy adott feltétel mentén szintén hatékonyabb egy rendezett listán, különösen, ha a rendezési elvvel kapcsolatos a feltétel (pl.: *k* legnagyobb érték kiválasztása).
- A **duplikátumok** megtalálása is lényegesen könnyebb egy rendezett listában.
- Az értékek **eloszlásának** vizsgálatára is gyakran van szükség, és ez is lényegesen gyorsabb, ha az elemek sorban vannak.

A Python alapértelmezett rendező funkciójának implementálása rendkívül gyors, de az egyes rendező megoldások gyakran adott körülmények teljesülése esetén működnek igazán hatékonyan. Ráadásul a különböző rendező algoritmusok megismerése segíthet elmélyíteni az eddig megszerzett programozói ismereteket. Ezért ebben az anyagban -- a teljesség igénye nélkül -- áttekintünk néhányat a leggyakrabban használt rendező algoritmusok közül.

Az alábbi linkeken az egyes algoritmusok rövid leírása és az implementációjuk vázlatos leírása található. Sokak számára azonban segítséget jelenthet a megértésben a működés [vizuális megjelenítése](https://www.youtube.com/watch?v=kPRA0W1kECg). Számos internetes anyag is meg található a neten (az algoritmusok nevével lehet keresni), amik szintén hasznosak lehetnek. De vannak igazán különleges megközelítések is, mint például az [AlgoRythmics](https://www.youtube.com/user/AlgoRythmics/videos) YouTube csatorna, melyen különböző néptáncok segítségével kerül bemutatásra az egyes algoritmusok működése.

További szemléltető példák:
<br/> https://www.toptal.com/developers/sorting-algorithms
<br/> https://www.digitalocean.com/community/tutorials/js-bubble-selection-insertion-sort
<br/> https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html

## Algoritmusok
[Buborék rendezés](/python_advanced/bubble_sort/)<br/>
[Beszúró rendezés](/python_advanced/insertion_sort/)<br/>
[Összefésülő rendezés](/python_advanced/merge_sort/)<br/>
[Kupac rendezés](/python_advanced/heap_sort/)<br/>