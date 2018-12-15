# Sample performance with In-Memory OLTP in WideWorldImporters

This script simulates an insertion workload for vehicle location in the WideWorldImporters sample database. Note that this script is single-threaded. For a multi-threaded variant, see the [vehicle-location-insert](../../workload-drivers/vehicle-location-insert) workload driver.

The main purpose is to compare the performance of data insertion into traditional disk-based tables compared with memory-optimized tables. For a more comprehensive sample demonstrating the performance of In-Memory OLTP see the [in-memory/ticket-reservations](/samples/features/in-memory/ticket-reservations) sample.

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
1. **Key features:** Core database features
1. **Workload:** single-threaded insert
1. **Programming Language:** T-SQL
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 25 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

<!-- Examples -->
1. SQL Server 2016 (or higher) or Azure SQL Database.
2. The WideWorldImporters database.

<a name=run-this-sample></a>

## Running the sample

1. Execute the script in SSMS.

2. Observe the time taken for the inserts in disk-based and memory-optimized tables.

## Sample details

This script creates comparable disk-based and memory-optimized tables, as well as corresponding stored procedures, for vehicle location insertion.

It then compares the performance of single-threaded insert of 500,000 row:
 - into a disk-based table
 - into a memory-optimized table
 - into a memory-optimized table, with rows generated in a natively compiled stored procedure

The script outputs the time taken for each

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links
<!-- Links to more articles. Remember to delete "en-us" from the link path. -->
For more information, see these articles:
- [In-Memory OLTP documentation](https://msdn.microsoft.com/library/dn133186.aspx)
- [In-Memory OLTP quick start](https://msdn.microsoft.com/library/mt694156.aspx)
- [In-Memory OLTP in SQL Server 2016 (video)](https://channel9.msdn.com/Events/DataDriven/SQLServer2016/InMemoryOLTP)
- [Get started with In-Memory in SQL Database](https://azure.microsoft.com/documentation/articles/sql-database-in-memory/)
