create table employees_audit (
	ID SERIAL primary key,
	added_employee json,
	added_timestamp timestamp
);

create or replace function employee_audit_func()
returns trigger as $$
	begin
		insert into employees_audit (added_employee, added_timestamp)
			values (ROW_TO_JSON(NEW), current_timestamp);
		return new;
	end;
$$ language plpgsql security definer;

-- before
-- after
-- instead of

create trigger new_employee_trigger
	before insert on employees
	for each row -- we could enter more than one employee in an insert
	execute procedure employee_audit_func();
	

select * from employees_audit;
insert into employees (first_name, salary, team_id) values
	('Kelly', 12, 2);
	
select * from employees;