# Sample performance with Operational Analytics in WideWorldImporters

This script shows the performance of analytics queries in the operational database. It relies on the [Order Insert](../../workload-drivers/vehicle-location-insert/) workload driver.

The main purpose is to show the performance benefits of using nonclustered columnstore indexes for analytics queries on operational systems, and how they limit the impact on the operational workload.

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
1. **Key features:** nonclustered columnstore index
1. **Workload:** Operational Analytics
1. **Programming Language:** T-SQL
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 26 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

<!-- Examples -->
1. SQL Server 2016 (or higher) or Azure SQL Database.
2. SQL Server Management Studio
3. The WideWorldImporters database (Full version).

<a name=run-this-sample></a>

## Running the sample

1. Run the [Order Insert](../../workload-drivers/vehicle-location-insert/) workload for a while. When starting from the vanilla WideWorldImporters database the recommendation is to run at least 20 minutes, to ensure that enough data is generated and that compression kicks in (the sample has a COMPRESSION_DELAY of 10 minutes for the columnstore indexes).

2. Execute the sample script.

3. Open the Messages pane in SSMS and observe the time taken to run the query with and without columnstore index.

## Sample details

The [Order Insert](../../workload-drivers/vehicle-location-insert/) workload driver is used to simulate an order processing workload. The queries in the sample script are reporting queries run with and without columnstore index.

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links
<!-- Links to more articles. Remember to delete "en-us" from the link path. -->
For more information, see these articles:
- [Get started with Columnstore for real time operational analytics](https://msdn.microsoft.com/library/dn817827.aspx)
- [Real-Time Operational analytics with SQL Server 2016 (video)](https://channel9.msdn.com/Events/DataDriven/SQLServer2016/Real-Time-Operational-analytics)
