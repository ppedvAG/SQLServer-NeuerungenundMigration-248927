Der Kompatibilitätsgrad (engl. compatibility level) einer SQL Server-Datenbank steuert, welches Verhalten und welche Features der SQL Server-Abfrageoptimierer und das Datenbankmodul bei der Ausführung von T-SQL verwenden – unabhängig von der installierten SQL Server-Version.

🎯 Warum gibt es den Kompatibilitätsgrad?
Er ist dazu da, Abwärtskompatibilität zu gewährleisten, wenn du:

eine Datenbank auf eine neue SQL Server-Version migrierst,

aber nicht sofort alle Änderungen im Verhalten (z. B. Optimizer, Funktionen) nutzen willst.

⚙️ Was beeinflusst der Kompatibilitätsgrad?
Hier einige konkrete Beispiele:

Bereich	Einfluss
Abfrageoptimierer	Neuere Versionen enthalten verbesserte Cardinality Estimation, Adaptive Joins, Batch Mode etc. – diese sind nur aktiv ab bestimmten Kompatibilitätsgraden.
T-SQL-Syntax	Manche T-SQL-Features funktionieren nur ab einem bestimmten Grad (z. B. STRING_AGG, GREATEST/LEAST, PIVOT etc.).
Funktionen/Verhalten	Verhalten von Datentypen, NULLs, Division durch 0, Aggregationen kann sich ändern.
Performance Features	Adaptive Query Processing, Table Variable Deferred Compilation, Scalar UDF Inlining usw. sind nur in höheren Graden aktiv.