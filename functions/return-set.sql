-- Instead OF returning a refcursor we can RETURN a SET OF VALUES
-- SIMILAR TO a LIKE returning a tuple IN python

CREATE FUNCTION set_returner()
RETURNS TABLE(value varchar) AS $$
	BEGIN
		FOR VALUE IN 
			SELECT FIRST_NAME FROM employees WHERE id IN
				(SELECT y FROM generate_series(1, 10) AS y) LOOP
			RETURN NEXT;
		END LOOP;
	END;
$$ language plpgsql;

select * from set_returner();

select COUNT(*) from employees;