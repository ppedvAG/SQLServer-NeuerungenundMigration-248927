-- Adaptive Join Demo
SET  STATISTICS IO, Time ON

-- Columnstore Index auf Orders
-- bis SQL 2019 -- CREATE CLUSTERED COLUMNSTORE INDEX CCI_Orders ON Orders;

ALTER DATABASE [Nwind] SET COMPATIBILITY_LEVEL = 120
ALTER DATABASE [Nwind] SET COMPATIBILITY_LEVEL = 160
GO

use Nwind;
GO 


DECLARE @custid NCHAR(5) = 'ALFKI';
--DECLARE @custid NCHAR(5) = 'aagzv';

SELECT 
    o.OrderID,
    o.OrderDate,
    od.ProductID,
    od.Quantity
FROM 
    Orders o
JOIN 
    [Order Details] od
    ON o.OrderID = od.OrderID
WHERE 
    o.CustomerID = ISNULL(@custid, o.CustomerID);

--, CPU-Zeit = 438 ms, verstrichene Zeit = 125 ms.

    


SELECT 
    o.OrderID,
    o.OrderDate,
    od.ProductID,
    od.Quantity
FROM 
    Orders o
JOIN 
    [Order Details] od
    ON o.OrderID = od.OrderID
WHERE 
    o.CustomerID = 'aagzv'

-- SQL Server-Ausführungszeiten: 
-- CPU-Zeit = 1158 ms, verstrichene Zeit = 980 ms.
