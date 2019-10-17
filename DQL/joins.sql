-- union, ect. Unions allows us to append new rows to a result set
-- in a vertical fashion.

-- Joins, on the other hand, generally allow us to add new columns
-- by appending new data horizontally.

-- The principal idea of joins, is that a relational database describes
-- relations, and that we need some tool through which we can connect
-- related information into a single result. Joins allow us to accomplish
-- this, and as such they are very frequently alongside foreign keys.

-- There are a number of types of joins, but for the first sample we will
-- be using a 'left (outer) join'.

-- The join clause has two parts - following a declaration of the join
-- the table that one intends to join, and then (generally) an on clause
-- which defines a predicate which will be used to combine rows wherever
-- the predicate evaluates to true.

-- Aliasing name as "team_name"
select employees.*, teams.name "team_name" from employees 
	left join teams on employees.team_id = teams.id;

--	Types of Joins

--  Left (outer) join - A left outer join will take the base table
-- and join the joined table to it, wherever there is a relation mapped.
-- The left side will always have values, but the right side may be null
-- if there is nothing to map it to.
	
-- Right (outer) join - A right outer join will take the joined table
--	and join the base table to it on the right, wherever there is a
-- mapped. The base table will not necessarily display all items that we
-- may expect to be displayed - it will only display, where the
-- relationship can be mapped.
	
select * from employees 
	right join followers on employees.id = followers.followee_id;


-- Inner join - Inner join will join the base and joined table but
-- only where relations exist.

insert into employees (first_name, salary) values ('Izzy', 10000);
select * from teams;
	
select * from teams 
	full outer join employees on teams.id = employees.team_id;
	
	
-- outer join -- Opposite of the inner join. The outer join will
-- show all records from both tables, even if there is no relationship
-- mapped by the on clause.


-- natural join 
select * from teams 
	natural join employees;


-- Cross join
select * from employees
	cross join teams;

select * from employees, teams, followers;

alter table employees add column supervisor_id integer default (1);

select * from employees;
update employees set supervisor_id = null where id = 1;

-- self join 
-- Joining a table to itself
select employees.first_name "employee",
	supervisors.first_name "supervisor" from employees
	left join employees "supervisors" 
		on employees.supervisor_id = supervisors.id;
		
-- uneven join
-- any join where the relationship (on clause) is not based upon
-- equality
	
select * from employees 
	left join teams on team_id < employees.id;
	
create view follower_view as
select follower.first_name "follower",
		followee.first_name "followee" from followers
	left join employees "follower" 
		on follower.id = followers.follower_id
	left join employees "followee"
		on followee.id = followers.followee_id;
	
select * from follower_view;