# IEASalesTrackingDb SQL Database Setup

This repository contains SQL scripts for creating the **IEASalesTrackingDb** database and its associated tables, views, and stored procedures. The following sections provide a brief overview of the database structure and how to use the SQL scripts.

## Database Overview

![Database Overview](vindowsScreen.PNG)
This screenshot provides an overview of the database structure, including tables, views, and stored procedures.

## Tables

### Countries Table

The `Countries` table stores information about countries. You can execute the following SQL query to view all countries:

```sql
SELECT * FROM Countries;
AddressTypes Table
The AddressTypes table contains information about address types.

Other Tables
In addition to the above, this database includes several other tables, such as Customers, Employees, Orders, Products, and more.

Views
vwShowCountries View
The vwShowCountries view allows you to retrieve data from the Countries table. You can execute the following SQL query to view countries through the view:
SELECT * FROM vwShowCountries;

Other Views
This database includes various other views, such as vwShowCustomers, vwShowOrders, and more.

Stored Procedures
spCreateCountry
The spCreateCountry stored procedure is used to insert a new country into the Countries table. You can use it as follows:
-- Example of using spCreateCountry
EXEC spCreateCountry 'US', 'United States', 'Description', '1', NULL;

Other Stored Procedures
In addition to spCreateCountry, there are other stored procedures available for managing the database.

How to Use
Clone or download this repository.
Open SQL Server Management Studio.
Connect to your SQL Server instance.
Open and execute the SQL scripts in the order you need (e.g., create tables, views, stored procedures).
Use the provided SQL queries to interact with the database.
For any questions or issues, please feel free to reach out.


