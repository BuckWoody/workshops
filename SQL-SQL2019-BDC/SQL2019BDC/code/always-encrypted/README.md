# Sample for use of Always Encrypted in WideWorldImportersDW

This script demonstrates the use of Always Encrypted to encrypt sensitive data in the database.


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
1. **Key features:** Always Encrypted
1. **Workload:** OLTP
1. **Programming Language:** T-SQL, C#
1. **Authors:** Greg Low, Jos de Bruijn
1. **Update history:** 26 May 2016 - initial revision

<a name=before-you-begin></a>

## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

<!-- Examples -->
1. SQL Server 2016 (or higher) or Azure SQL Database.
2. SQL Server Management Studio
3. Visual Studio 2015
4. The WideWorldImporters database.

<a name=run-this-sample></a>

## Running the sample

1. Build the solution to create the data population app.

2. Open both scripts in different windows or tabs in Management Studio.

3. Follow the instructions in the main script DemonstrateAlwaysEncrypted.sql.

## Sample details

The sample adds a new table with sensitive data about suppliers. This sensitive data is always encrypted.

As part of the sample you create an encryption key that is saved locally (where you run SSMS). The client application inserts data into the table. With the sample scripts you will see how the data is encrypted in the table and cannot be viewed, even by a sysadmin, unless you have the encryption key.

<a name=disclaimers></a>

## Disclaimers
The code included in this sample is not intended to be used for production purposes.

<a name=related-links></a>

## Related Links
<!-- Links to more articles. Remember to delete "en-us" from the link path. -->
For more information, see these articles:
- [Always Encrypted documentation](https://msdn.microsoft.com/library/mt163865.aspx)
- [Keep Sensitive Data Secure with Always Encrypted](https://channel9.msdn.com/Events/DataDriven/SQLServer2016/AlwaysEncrypted)
