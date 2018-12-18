/* WideWorldImportersDemo.sql
Purpose: Demonstrate end-to-end scenarios in Wide World Importers
Author: Buck Woody, Microsoft
Edited: 12/05/2018 - Initial Creation
Requirements: 
Restore "Full" WWI and "Full" WWI DW databases from here: https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers
License: The license for the sample database and the sample code is described here: https://github.com/Microsoft/sql-server-samples/blob/master/license.txt
Terms: The sample database includes public data that has been loaded from data.gov and Natural EarthData. The terms of use are here: https://www.naturalearthdata.com/about/terms-of-use/

Full documentation: https://docs.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-2017 
*/

use WideWorldImporters;
GO

SET NOCOUNT ON
GO

-- Generate some data
    EXECUTE DataLoadSimulation.PopulateDataToCurrentDate
        @AverageNumberOfCustomerOrdersPerDay = 60,
        @SaturdayPercentageOfNormalWorkDay = 50,
        @SundayPercentageOfNormalWorkDay = 0,
        @IsSilentMode = 1,
        @AreDatesPrinted = 1;

-- During the working day, Wide World Importers processes orders from customers. It is important
-- to estimate if stock will run out soon. To avoid this, a stock burn down rate needs to be 
-- calculated. The first part of this is to work out quantities on order lines that have not
-- yet been picked.

-- Terry, an analyst with the company has written a query that assesses the rate at which
-- the stock is being sold, and estimates (based on the sales rate), when the excess stock will
-- be sold. The problem with this query is that it uses the same tables that are being used by
-- the core order processing function within the company, and can impact the performance of those
-- tables if the query is run frequently. 

-- Terry has heard that SQL Server 2016 has strengths in operational analytics and hopes that
-- these capabilbies can allow him to run his queries even during busy order processing periods.


-- The above procedure creates nonclustered columnstore indexes on the Sales.OrderLines and Sales.InvoiceLines 
-- tables. Take a moment to view them now using Object Explorer.

-- The following query can be used to sum the stock yet to be picked for all stock items.

DECLARE @StartingTime datetime2(7) = SYSDATETIME();

SELECT ol.StockItemID, [Description], SUM(Quantity - PickedQuantity) AS AllocatedQuantity
FROM Sales.OrderLines AS ol WITH (NOLOCK)
GROUP BY ol.StockItemID, [Description];

PRINT 'Using nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';

SET @StartingTime = SYSDATETIME();

SELECT ol.StockItemID, [Description], SUM(Quantity - PickedQuantity) AS AllocatedQuantity
FROM Sales.OrderLines AS ol WITH (NOLOCK)
GROUP BY ol.StockItemID, [Description]
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);

PRINT 'Without nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';
GO

-- Demonstrate WorldWideImporters Polybase connections
-- Requires PolyBase to be installed.

USE WideWorldImportersDW;
GO

SELECT SERVERPROPERTY ('IsPolyBaseInstalled') AS IsPolyBaseInstalled; 

sp_configure @configname = 'hadoop connectivity', @configvalue = 7;  
GO  

RECONFIGURE  
GO

-- WideWorldImporters have customers in a variety of cities but feel they are likely missing 
-- other important cities. They have decided to try to find other cities have a growth rate of more 
-- than 20% over the last 3 years, and where they do not have existing customers.
-- They have obtained census data (a CSV file) and have loaded it into an Azure storage account.
-- They want to combine that data with other data in their main OLTP database to work out where
-- they should try to find new customers.

-- First, let's apply Polybase connectivity and set up an external table to point to the data
-- in the Azure storage account.

EXEC [Application].Configuration_ApplyPolybase;
GO

-- In Object Explorer, refresh the WideWorldImporters database, then expand the Tables node.
-- Note that SQL Server 2016 added a new entry here for External Tables. Expand that node.
-- Expand the dbo.CityPopulationStatistics table, expand the list of columns and note the
-- values that are contained. Let's look at the data:

SELECT * FROM dbo.CityPopulationStatistics;
GO

-- How did that work? First the procedure created an external data source like this:
/*

CREATE EXTERNAL DATA SOURCE AzureStorage 
WITH 
(
	TYPE=HADOOP, LOCATION = 'wasbs://data@sqldwdatasets.blob.core.windows.net'
);

);

*/
-- This shows how to connect to AzureStorage. Next the procedure created an 
-- external file format to describe the layout of the CSV file:
/*

CREATE EXTERNAL FILE FORMAT CommaDelimitedTextFileFormat 
WITH 
(
	FORMAT_TYPE = DELIMITEDTEXT, 
	FORMAT_OPTIONS 
	(
		FIELD_TERMINATOR = ','
	)
);

*/
-- Finally the external table was defined like this:
/*

CREATE EXTERNAL TABLE dbo.CityPopulationStatistics
(
	CityID int NOT NULL,
	StateProvinceCode nvarchar(5) NOT NULL,
	CityName nvarchar(50) NOT NULL,
	YearNumber int NOT NULL,
	LatestRecordedPopulation bigint NULL
)
WITH 
(	
	LOCATION = '/', 
	DATA_SOURCE = AzureStorage,
	FILE_FORMAT = CommaDelimitedTextFileFormat,
	REJECT_TYPE = VALUE,
	REJECT_VALUE = 4 -- skipping 1 header row per file
);

*/
-- From that point onwards, the external table can be used like a local table. Let's run that 
-- query that they wanted to use to find out which cities they should be finding new customers
-- in. We'll start building the query by grouping the cities from the external table
-- and finding those with more than a 20% growth rate for the period:

WITH PotentialCities
AS
(
	SELECT cps.CityName, 
	       cps.StateProvinceCode,
		   MAX(cps.LatestRecordedPopulation) AS PopulationIn2016,
		   (MAX(cps.LatestRecordedPopulation) - MIN(cps.LatestRecordedPopulation)) * 100.0 
		       / MIN(cps.LatestRecordedPopulation) AS GrowthRate
	FROM dbo.CityPopulationStatistics AS cps
	WHERE cps.LatestRecordedPopulation IS NOT NULL
	AND cps.LatestRecordedPopulation <> 0 
	GROUP BY cps.CityName, cps.StateProvinceCode
)
SELECT * 
FROM PotentialCities
WHERE GrowthRate > 2.0;
GO

-- Now let's combine that with our local city and sales data to exclude those where we already
-- have customers. We'll find the 100 most interesting cities based upon population.

WITH PotentialCities
AS
(
	SELECT cps.CityName, 
	       cps.StateProvinceCode,
		   MAX(cps.LatestRecordedPopulation) AS PopulationIn2016,
		   (MAX(cps.LatestRecordedPopulation) - MIN(cps.LatestRecordedPopulation)) * 100.0 
		       / MIN(cps.LatestRecordedPopulation) AS GrowthRate
	FROM dbo.CityPopulationStatistics AS cps
	WHERE cps.LatestRecordedPopulation IS NOT NULL
	AND cps.LatestRecordedPopulation <> 0 
	GROUP BY cps.CityName, cps.StateProvinceCode
),
InterestingCities
AS
(
	SELECT DISTINCT pc.CityName, 
					pc.StateProvinceCode, 
				    pc.PopulationIn2016,
					FLOOR(pc.GrowthRate) AS GrowthRate
	FROM PotentialCities AS pc
	INNER JOIN Dimension.City AS c
	ON pc.CityName = c.City 
	WHERE GrowthRate > 2.0
	AND NOT EXISTS (SELECT 1 FROM Fact.Sale AS s WHERE s.[City Key] = c.[City Key])
)
SELECT TOP(100) *
FROM InterestingCities 
ORDER BY PopulationIn2016 DESC;
GO

-- Clean up if required
/*
DROP EXTERNAL TABLE dbo.CityPopulationStatistics;
GO
DROP EXTERNAL FILE FORMAT CommaDelimitedTextFileFormat;
GO
DROP EXTERNAL DATA SOURCE AzureStorage;
GO
*/

/* EOF - WideWorldImportersDemo.sql */