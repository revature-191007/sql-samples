-- view is a database object that acts as a 'saved query' that
-- can be selected from in the future. Note that the view only saves
-- the query itself, and not the results of that query.

-- We can abstract complicated queries to a simple object to utilize.
-- We can supply permissions to a view even if the consumer of the view
-- does not have permissions on the used tables.
-- simple built in way to store useful queries directly on the database.
create view team_summary AS
select 
		team_id, 
		count(*) "team_members",
		sum(salary) "total_salary",
		avg(salary::numeric) as "average_salary"
	from employees 
		group by team_id 
		order by sum(salary) DESC;
		
update employees set salary = 3500 where id = 6;
	select * from team_summary;