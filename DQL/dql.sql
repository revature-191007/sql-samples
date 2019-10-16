-- DQL - data Query language
-- is the sublanguage that is responsible for retrieving data from the database
-- for usage in some application.

-- The only operation that is a part of the DQL sublanguage is:
-- SELECT

-- Anatomy of a select statement:
-- select col, ... from table_name;
-- select * from table_name;
-- select table_name.col, ... from table_name;
-- select table_name.*, ... from table_name;

select name, id, id + id from teams;

select * from employees;

insert into employees (first_name, salary, team_id) values
	('Cindy', 3000, 2), ('Danny', 3500, 1);

-- ORDER BY clause
-- Default is ascending order, to make it descending, following the column
-- with DESC
select * from employees order by salary DESC;

select * from employees order by start_date, salary desc, FIRST_NAME;


-- LIMIT n - limits result set to n entries
-- OFFSET n - offsets results by n entries
select * from employees order by salary DESC limit 1 offset 1;

-- Aliasing the first_name column as "name"
select first_name as "name" from employees where first_name not like 'Cindy';

-- Where clause - Filtering clause which filters rows from the table which
-- will be retrieved or affected by the operation.

select * from employees where id = 2;

-- operators that can be used for comparison:
-- = equals
-- > greater than
-- < less than
-- >= greater than or equal to
-- <= less than or equal to
-- != not equals <>
-- AND
-- OR

select * from employees where id % 2 = 1;

-- select from a set of values using IN
select * from employees where id in (1, 2, 3, 4);

-- Between to select between two values
select * from employees where id between 4 and 8;

-- Also works for temporal types
select * from employees where start_date between '2019-10-15' and '2020-01-01';

-- LIKE expression for String comparison
-- _ -> single character wildcard
-- % -> multicharacter wildcard
select * from employees where first_name like '__n%';

select * from employees where salary < 4000::money OR start_date = CURRENT_DATE;

select * from employees where first_name < 'Cindy';

-- Note: Java or (||) is used for string concatonation in postgresql
select 'Hello ' || first_name from employees;

select * from employees where salary =
(select max(salary) from employees);


