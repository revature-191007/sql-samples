-- PostgreSQL is a sql Relational database.
-- DBeaver a database management tool. It can be used to interact with
-- a variety of sql databases. 

-- Sublanguages of SQL --
-- SQL Syntax is categorized through a variety of 'sublanguages' which are 
-- groupings of commands or operations that operate on specific domains.

-- DDL - Data Definition language
-- The DDL sublanguage is responsible for the creation and maintenance of
-- database level objects. (tables, views, functions, sequences, etc).

-- Operations of DDL
-- CREATE - Create's a database object
-- ALTER - Alters an existing database object
-- DROP - Drop a database object (deleting it from the database) 
-- TRUNCATE - (specific to tables) - removes data, but leaves the object

-- Create anatomy (for tables)
--create table table_name (
--	col_name data_type constraints...,
--)

create table if not exists associates  (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	favorite_color VARCHAR,
	birth_date TIMESTAMP
);

-- REMOVE TABLE
drop table if EXISTS associates;

-- NUMERIC TYPES
-- INTEGER (and subtypes) - whole number
-- NUMERIC (OR decimal(10, 2) (10,000,000.00) - arbitrary precision decimal value
-- REAL/DOUBLE - floating point decimal values

-- CHARACTER TYPES
-- CHAR(n) - padded character string, n -> length
-- VARCHAR(n) - non-padded variable length string n -> max length
-- TEXT - Arbitrary length string, not easily searchable/manipulatible

-- TEMPORAL
-- TIMESTAMP - stored as unix timestamp
-- DATE
-- TIME 
-- INTERVAL - period of time 

-- Others:
	-- JSON/XML - Interchange format
	-- geometric
	
-- PSEUDO-DATATYPE - You can use it when you create a table,
--	but it's not the actual data type.
-- SERIAL -> It will create an INTEGER column, create a sequence, and
-- set the column to default by pulling a value from the sequence.
-- various TZ times (TZ -> timezone)
