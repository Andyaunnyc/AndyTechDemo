
DROP TABLE IF EXISTS Staging.YearlySalesData

Go
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Staging.YearlySalesData(
	[Year] [int] NULL,
	[ProductID] [int] NOT NULL,
	[ProductName]  NVARCHAR(500) NOT NULL,
	[TotalQuantitySold] [int] NULL,
	[TotalSalesAmount] [numeric](38, 6) NULL,
	[SalesRank] [bigint] NULL
) ON [PRIMARY]
GO
