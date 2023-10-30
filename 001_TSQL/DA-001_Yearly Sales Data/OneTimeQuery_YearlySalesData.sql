WITH YearlySales AS (
    SELECT 
        YEAR(soh.OrderDate) as [Year],
        p.ProductID,
        p.Name as ProductName,
        SUM(sod.OrderQty) as TotalQuantitySold,
        SUM(sod.LineTotal) as TotalSalesAmount
    FROM Sales.SalesOrderDetail sod
    JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
    JOIN Production.Product p ON sod.ProductID = p.ProductID
    GROUP BY YEAR(soh.OrderDate), p.ProductID, p.Name
)
SELECT 
    [Year],
    ProductID,
    ProductName,
    TotalQuantitySold,
    TotalSalesAmount,
    RANK() OVER(PARTITION BY [Year] ORDER BY TotalSalesAmount DESC) as SalesRank
FROM YearlySales
WHERE [Year] IS NOT NULL
ORDER BY [Year] ASC, SalesRank ASC;
go

 