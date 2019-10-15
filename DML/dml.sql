-- DML Sublanguage - data Manipulation language
-- domain of DML is table data

-- 3-4 operations

-- 1. insert - Used to insert a row or rows of table new table data.
-- 2. update - used to update existing table data.
-- 3. delete - used to delete existing table data.
-- 4. (select) - Used to query for table data. Many consider select to be its 
--		own sublanguage, called DQL (Data Query Language).

-- Anatomy of insert statement

-- INSERT INTO table_name (col, ...) VALUES (col_val, ...), (...);

-- insert some teams
insert into teams (name) values 
		('technology'), 
		('hr'), 
		('sales'), 
		('accounting'), 
		('qa');

--	To return table data rather than meta data, just include a returning clause
-- with the columns you want returned
insert into teams (name) values
		('legal') returning id, name;

-- this will violate the NOT NULL constraint on the name column
insert into teams (name) values (null);

---------------------------------------------

insert into employees (first_name, salary, team_id) values
		('Abby', 5000, 1),
		('Billy', 2000, 1);
	
insert into employees (first_name, start_date, salary, team_id) values
--	           YYYY-MM-DD, for datetime: 2019-10-15T16:00:00
	('Cindy', '2019-10-16', 3000, 2);
--	('Danny', '2019-10-16', 3000, 8); -- Fails foreign key constraint



----------  Update ------------

-- UPDATE table_name SET column = new_value, ...;
-- WARNING: This will update EVERY row! Probably not what you want.

-- To specify which rows specifically should be targeted, we can use a WHERE
-- clause.

-- ... WHERE predicate

update employees set first_name = 'Abigail'
--	where id = 1;
	where first_name is LIKE '___y';

-- String comparisons with the LIKE comparison operation
-- _ -> single character wild card
-- % -> any length wildcard

update employees set salary = 4000, start_date = CURRENT_DATE
	where id = 3 returning *;

----------------------DELETE---------------------------

-- delete from table_name;
delete from employees where id = 3 returning *;


-- Exercise:
-- Expand on the tables made in the previous step (movies, pokemon, etc) to
-- include some data in each table. Doesn't need to be a lot of data, 
--  2-3 rows each

-- Tomorrow:
 -- DML, DQL
 -- Multiplicity
 -- Functions (scalar and aggregate)
 -- Maybe JDBC?


