# Workload Driver for Vehicle Location Insertion in WideWorldImporters

This application simulates an insertion workload for vehicle location in the WideWorldImporters sample database.

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

1. **Applies to:** SQL Server 2016 (or higher), Azure SQL Database
1. **Key features:** Core database features
1. **Workload:** OLTP
1. **Programming Language:** C#
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 25 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

1. SQL Server 2016 (or higher) or Azure SQL Database.
2. The WideWorldImporters database (Full version).

<a name=run-this-sample></a>

## Running the sample

1. Connect to the database and run the script VehicleLocation.sql to create the memory-optimized and disk-based tables used for the comparison.

2. Run the app and follow the instructions on-screen. Compare the time taken for On Disk and In Memory insertion.

## Sample details

This application is used to compare the insertion of rows into the OnDisk and InMemory tables in Wide World Importers. The required objects must have already been created by following the earlier steps in the demonstration script.

When executed, this application displays the following:

![Alt text](/media/wide-world-importers-vehicle-location-insert-app.png "WideWorldImporters Vehicle Location Workload Simulation")

Ensure that the connection string is set appropriately. It is save when the program is edited. If you ever need to set it back to the default value, open the program, clear the string, and exit the program. When you restart the program, the connection string will have been returned to the default value.

You can control the number of threads performing the insert operations. You can choose whether to insert into an on-disk table or an in-memory equivalent of the same table.

The application will periodically (about every second) display the latest execution times for each insert.

If there is no significant performance difference, this could be an indication of a log IO bottleneck, as each insert results in a transaction commit that involves a flush to disk. It is possible to work around using [delayed durability](https://msdn.microsoft.com/library/dn449490.aspx) in the database:

	ALTER DATABASE WideWorldImporters SET DELAYED_DURABILITY=FORCED

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links

- [in-memory/ticket-reservations](/samples/features/in-memory/ticket-reservations)
