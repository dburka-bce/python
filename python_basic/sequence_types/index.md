# Szekvencia típusok
A szekvencia típusok több elem rendezett halmazának tárolására szolgálnak. Ezek az elemek lehetnek tetszőleges típusúak. Léteznek módosítható (*mutable*) és nem módosítható (*immutable*) szekvenciák. A nem módosítható szekvenciákra azért van szükség, mert komplex programkódok esetén nem lehet arra számítani, hogy a fejlesztő emlékezni fog egy adott változó funkcionalitására. Ha mindig csak mutábilis szekvenciákat alkalmaznánk, akkor például extrém esetben egy figyelmetlen fejlesztő esetleg felülírhatná az egyetemen kiosztható érdemjegyek halmazát.

A Python alapvetően három szekvencia típust különböztet meg, de speciális szekvencia típusnak számítanak még a [karakterláncok](/python_basic/variables_text/) és a bináris típusok is.

|||
|-|-|
[List](/python_basic/list/) |mutable
[Tuple](/python_basic/tuple/) |immutable
[Range](/python_basic/range/) |immutable

Az egyes szekvencia típusokkal lényegében ugyanazok a műveletek végezhetők el. Kivétel ez alól, hogy az immutábilis típusok esetén nincs lehetőség az elemek értékeinek vagy halmazának módosítására. A követhetőség érdekében a `list` típus leírásában, `list` példákat alkalmazva mutatjuk be a szekvencia típusokkal végezhető műveleteket. A másik két típus leírásában már csak az eltérésekre hívjuk fel a figyelmet.

A legtöbb nyelv alapvető szekvencia típusa a **tömb**, mely a lista egy olyan speciális változata, amelyben az elemek értékei módosíthatók ugyan, de az elemek halmaza nem. A Python-ban nincs a tömbnek megfelelő alap adattípus, de léteznek hozzá olyan bővítmények, amik implementálják.
