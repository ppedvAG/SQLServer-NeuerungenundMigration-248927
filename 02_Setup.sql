/*


 Volumewartungstask = reine Windows Sicherheitseinstellung


jede Vergr��erung verbraucht eigtl die doppelte Schreibarbeit
da Windows zuerst die Dateien vergr��ert und mit 0 beschreibt
eigtl ein Sicherheitsfeature: Lokaler Sicherheitsrichtlinien.. 
Zuweisen von Benutzerrechten
-->SQL Dienstkonto bei Durchf�hren von Voluemwartungsuafgaben einsetzen
----------------------
0101010110101111111111
----------------------

aktiviert man den Volumewartungstask dann kann SQL Server eigenst�ndig vergr��eren
ohne vorher ausnullen-- schneller,

-->IO reduzieren! Aber einem guten Admin ist das wurst! ;-) Siehe DB Settings
--aber auch bei Restore!

Frage nach Verzeichnissen  :
Trenne Log von Daten physikalisch (HDDs) !!
Wirklich ideal 

MAXDOP = Anzahl der log Prozessoren (max 8)
-->eigenes Kapitel

TempDB
#tabellen, Zeilenversionierung
IX Wartung, Auslagerungen beim Sortieren etwa

Trenne Daten von Log und am besten eig HDDs

Aber auch : 
Anzahl der Datendateien = Anzahl der Kerne  max 8 
Traceflags 1117 + 1118


Soviele Dateien wie Kerne, aber max 8
Mehrere Tabellen k�nne im gleiche Block liegen, aber nur ein Thread darf zugreifen

-T1117 Uniform Extents... kein gleichzeitiger Zugriff mehr auf denselben Block, da jede Tabelle einen eig block belegt
-T1118 immer gleich gro�e Dateien.. greife nie in den Mechanismus ein, der wird sonst ausser Kraft gesetzt


--Arbeitspeicher. 
Setup schl�gt f�r SQL einen max Speicher vor, um im worst Case nicht den gesamten RAM zu belegen
--DAS OS braucht auch Luft zum atmen... das Setup ber�cksichtigt die Umgebung (OS)
--Sharepoint: Wenn auf dem Server 95% Speicherauslastung, dann stellt SP Dienste
--Begrenze den SQL Server immer im Bereich MAX RAM... (OS)


-- MAX Speicher 
-- immer einstellen 
-- wird sofort umgesetzt

-- MIN Speicher 
-- nur bei Konkurrrenz (weiterer Instanz) sinnvoll
-- der mind RAM Wert wird erst belegt, wenn SQL Daten entsprechend abgelegt hat.





--AUFGABEN: 4 Kerne 6 GB Kontrolle des HV-SQL1

--Findest du die Werte aus dem Setup im SQL Server wieder?
--MAXDOP = 2 oder 4
--im Setup MAXDOP 4

--tempdb 2 dateien
--Das Setup h�tte 4 angelegt

--VM hat 2 CPUs und hat 4 GB RAM

--wenn man nachtr�glich die VM anpasst, dann sollten eben auch die Werte im SQL angepasst
--werden


