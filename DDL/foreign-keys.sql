create table teams (
	id SERIAL primary key,
	name VARCHAR(20) not NULL
);



create table employees (
	id SERIAL primary key,
	first_name VARCHAR(25) not null check(length(first_name) > 0),
	start_date DATE default(current_date),
	salary money not null,
	team_id INTEGER references teams(id)
);

-- Exercise:
-- Choose one of the following:

-- 1) A database which stores actor data and the movies they starred in.
--  Actor table
--  Movie Table
-- ...? more

-- 2) A table of states and cities within them
-- State table
-- City Table
-- ...? more

-- 3) A table of pokemon and types and locations where they're found and skills and...
-- pokemon table
-- type table
-- skills table
-- Location table
-- ...?

