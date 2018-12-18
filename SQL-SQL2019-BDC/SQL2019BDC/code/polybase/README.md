# Sample Querying of External Data Source in WideWorldImportersDW

This script demonstrates the use of PolyBase to query an external data source.

Demographics data is available in Azure blob storage. This data is joined with sales data recorded in the local database to determine which would be good candidates for future expansion of the business.

### Contents

[About this sample](#about-this-sample)<br/>
[Before you begin](#before-you-begin)<br/>
[Running the sample](#run-this-sample)<br/>
[Sample details](#sample-details)<br/>
[Disclaimers](#disclaimers)<br/>
[Related links](#related-links)<br/>


<a name=about-this-sample></a>

## About this sample

<!-- Delete the ones that don't apply -->
1. **Applies to:** SQL Server 2016 (or higher), Azure SQL Database
1. **Key features:** PolyBase
1. **Workload:** Analytics
1. **Programming Language:** T-SQL
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 26 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

<!-- Examples -->
1. SQL Server 2016 (or higher) with PolyBase, connected to the internet.
2. SQL Server Management Studio
3. The WideWorldImportersDW database (Full version).

<a name=run-this-sample></a>

## Running the sample

1. Execute the sample script.

2. Inspect external tables in the database.

3. Review query results.

## Sample details

The sample script performs a configuration and runs three queries:

1. An external table `dbo.CitePopulationStatistics` is created in the database, pointing to a data set in Azure blob storage.

2. The data in Azure storage is queried through Transact-SQL, showing all the data in the data source.

3. Cities with a significant growth rate (>= 20%) are identified.

4. Top cities for potential expansion are identified based on external data as well as sales data in the local database.

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links
<!-- Links to more articles. Remember to delete "en-us" from the link path. -->
For more information, see these articles:
- [Get started with PolyBase](https://msdn.microsoft.com/library/mt163689.aspx)
- [PolyBase: Gaining insights from HDFS and relational data in SQL Server 2016 (video)](https://channel9.msdn.com/Events/DataDriven/SQLServer2016/PolyBase)
