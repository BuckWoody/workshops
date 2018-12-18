# Sample for use of Row-Level Security in WideWorldImporters

This script demonstrates the use of Row-Level Security to restrict access to certains rows in the table to certain users.


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
1. **Key features:** Row-Level Security
1. **Workload:** OLTP
1. **Programming Language:** T-SQL
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 26 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

<!-- Examples -->
1. SQL Server 2016 (or higher) or Azure SQL Database.
 - With SQL Server, make sure SQL authentication is enabled.
2. SQL Server Management Studio
3. The WideWorldImporters database.

<a name=run-this-sample></a>

## Running the sample

1. Open both scripts in different windows or tabs in Management Studio.

2. Follow the instructions in the main script DemonstrateRLS.sql.

## Sample details

The sample enables row-level security in the database, for the table `Sales.Customers`. Users of the database can only see the customers they are allowed to see.

The user 'Great Lakes Sales' is allowed to see only the customers in the Great Lakes sales territory.

The Website user, which is used by the Web front-end in this scenario, configures the sales territory, and RLS takes care of the required filtering based on the information provided by the Web app.

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links
<!-- Links to more articles. Remember to delete "en-us" from the link path. -->
For more information, see these articles:
- [Row-Level Security documentation](https://msdn.microsoft.com/library/dn765131.aspx)
- [Row-Level Security SQL Server 2016 (video)](https://channel9.msdn.com/Events/DataDriven/SQLServer2016/Row-Level-Security)
