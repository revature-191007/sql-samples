--What is the difference between a scalar function and an aggregate function?
-- 
-- A scalar function takes in one or more values and returns a value.
-- That's it. It can be used anywhere, for instance in a filtering clause 
-- or to modify how data is represented in the result set. The scalar function
-- will not modify the structure of the result set.
--
-- On the other hand, an aggregate function operates on a retrieved data to 
-- condense the result set such that it describes an aggregation of the retrieved
-- data. This means that a where clause which filters to 10 rows, may result in
-- only a single row in the result set, because that row expression the aggregate
-- result of all 10 rows passed into the aggregate function.
--
-- For instance, if we wanted to know the total salary of all employees,
-- we could use the sum() aggregate function to calculate this.

select sum(salary) from employees;
-- sum - sum of all columns values passing the filter
select sum(salary) from employees where team_id = 1;

-- Average salary among all employees in teh technology team
select avg(salary::numeric) from employees where team_id = 1;

-- max - shows the maximum value in the set
select max(salary) from employees;

select min(salary) from employees;

-- Number of records
select count(*) from employees where salary IS null;

select string_agg(first_name, ', ') from employees;


-- In many cases we may want to aggregate based on some kind of category
-- such that we can compare the results for each category in an easy way
-- we can use a GROUP BY clause to specify a column or columns by which
-- rows can be grouped together and then aggregated such that each group
-- will be represented by a single row of output

select team_id, count(*) as "team_members", sum(salary) as "total_salary",
	avg(salary::numeric) as "average"
	from employees group by team_id;


-- HAVING is a filtering clause
-- WHERE is also a filtering clause? what's the difference?

-- WHERE filters data before aggregation, HAVING filters data after
-- aggregation

-- Generating a report that counts members in each team, their total salary,
-- and the average salary per team member, filtering out any teams whose
-- total salary is not greater than 3500.
select team_id, count(*) as "team_members", sum(salary) as "total_salary",
	avg(salary::numeric) as "average"
	from employees  group by team_id having sum(salary)::numeric > 3500;



-- Questions to be prepared for?

-- What is the difference between a scalar and an aggregate function?
-- What are some scalar functions? What are some aggregate functions?
-- What does the GROUP BY clause do?
-- What is the difference between HAVING and WHERE?
-- What columns can be selected in a query using an aggregate function?
		-- Only columns which are being aggregated or are in the group by clause


