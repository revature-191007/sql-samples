-- union - Combines results from two or more queries
			-- union remove duplicate entries
-- union all -- Same as union, but preserves duplicates
-- intersect -- shows only duplicate rows (the intersection of the
--				two queries)
-- except -- Shows the entries from the top query that are not a part
--			of the second query

-- keywords can be used to combine different queries together to form
-- a result set based on the combination of their results sets or some
-- relation between the result sets
select * from employees where first_name = 'danny'
	union
select * from employees where id > 5;

-- Warning: Unions can be used by malicious users to get data
-- outside of the table you intended to query! Use PreparedStatements!
select * from employees where first_name = 'danny' union
	select follower_id, 'trash', '2000-01-01', 1::money, followee_id from followers;-- Danny
-- This query was intended to select users by name, but by injecting
-- a union, I can dump the data from another table into the response
	
	-- Danny, Emily, ...