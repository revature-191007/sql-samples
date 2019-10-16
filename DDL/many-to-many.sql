insert into employees (first_name, salary, team_id) values
	('Emily', 4000, 3),
	('Franky', 4025, 4),
	('Georgie', 3800, 5),
	('Henry', 3500, 6);
	
select * from employees;

create table followers (
	follower_id INTEGER references employees(id) not NULL,
	followee_id INTEGER references employees(id) not NULL,
	check (follower_id != followee_id),
	primary KEY(follower_id, followee_id)
);

insert into followers (follower_id, followee_id) values
	(1, 2),
	(2, 1),
	(6, 2),
	(7, 8),
	(8, 1);


select follower_id || ' is following ' || followee_id as description from followers;
