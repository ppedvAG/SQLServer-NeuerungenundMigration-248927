-- WICHTIG: Kompatibilitätslevel 160 aktivieren (SQL Server 2022)
ALTER DATABASE Nwind SET COMPATIBILITY_LEVEL = 120;
ALTER DATABASE Nwind SET COMPATIBILITY_LEVEL = 160;


-- Neue Demo-Tabelle
DROP TABLE IF EXISTS dbo.BatchModeDemo;
CREATE TABLE dbo.BatchModeDemo (
    ID INT NOT NULL PRIMARY KEY,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description NVARCHAR(100) NULL
);

-- Testdaten einfügen: 1 Million Zeilen
;WITH E1(N) AS (SELECT 1 UNION ALL SELECT 1),
E2(N) AS (SELECT 1 FROM E1 a, E1 b),       -- 4
E3(N) AS (SELECT 1 FROM E2 a, E2 b),       -- 16
E4(N) AS (SELECT 1 FROM E3 a, E3 b),       -- 256
E5(N) AS (SELECT 1 FROM E4 a, E4 b),       -- 65,536
E6(N) AS (SELECT 1 FROM E5 a, E2 b),       -- 262,144
Nums AS (
    SELECT TOP (1000000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ID
    FROM E6
)
INSERT INTO dbo.BatchModeDemo (ID, CategoryID, Price, Description)
SELECT 
    ID,
    ID % 20, -- 20 Kategorien
    1.00 + (ID % 100) * 0.5,
    'Produkt ' + CAST(ID AS NVARCHAR)
FROM Nums;

-- Execution Plan anzeigen!
--und messen
SET STATISTICS io, time  ON;

-- Query, die Batch Mode auslösen kann (Aggregation über große Datenmenge)
SELECT 
    Customerid,
    COUNT(*) AS Anzahl,
    AVG(freight) AS Durchschnittspreis
FROM 
    dbo.orders where customerid like 'A%'
GROUP BY 
    Customerid;
