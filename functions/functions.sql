-- procedural language
-- functions can be written and compiled for use with a PostgreSQL database.
-- PostgreSQL supports a variety of different languages to write functions
-- in. The common sql function languages are known as procedural languages.
-- Postgres has its own form of this, called procedural language: Postgres.
-- or 'plpgsql'.

-- in most sql language, there is a large distinction between the two 
--	categories of user defined functions. These are: functions and
--	stored procedures.

-- functions - are functions. They are named abstracted parts of programming
-- logic. They accept parameters and can return a result. Can be called
-- from within queries.

-- Stored procedures are named blocks of code which cannot return a result.
--	however, they do support 'out' style parameters, for which the parameter
--  itself will be defined or mutate based on the stored procedures
--	execution logic. Postgres, traditionally, had no support for 
--	procedures and language support was only added in a very recent version
--  of PostgreSQL. Functions can already do everything a stored procedure
-- 	does in PostgreSQL. Stored procedures cannot be called within a
--	query. 
--  
--  CallableStatement interface in JDBC is designed for the execution of
--  stored procedures. However, given PostgreSQL's history, we will use it
--  to execute functions.


-- simple function example for finding the sum of two integers
create or replace function my_sum(val_a INTEGER, val_b INTEGER)
returns INTEGER as $$ -- <-- DELIMITER
	begin
		return val_a + val_b;
	end;
$$ language plpgsql;

-- Demonstrating usage
select my_sum(1, 2);
select *, my_sum(id, team_id) from employees where id = my_sum(0, 1);


-- A function to insert an employee 
create or replace function insert_employee(fn VARCHAR, s MONEY, t_id INTEGER)
	returns void as $$
	begin
		insert into employees (first_name, salary, team_id)
			values(fn, s, t_id);
	end;
$$ language plpgsql;

-- 27000 <-- Integer,  27000::money casting integer value to money type
select insert_employee('Jacky', 27000::money, 3);
	
select * from employees;

