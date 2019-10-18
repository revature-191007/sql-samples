-- return table

drop function return_employees;
create or replace function return_employees()
returns table(id INTEGER, first_name VARCHAR, start_date date, 
		salary MONEY, team_id INTEGER, supervisor_id INTEGER) as $$
	begin
		return query select * from employees;
	end;
$$ LANGUAGE plpgsql security definer;

select * from return_employees();