--String functions: https://www.postgresql.org/docs/8.1/functions-string.html

-- UPPER(input-string) can be used to convert a string to uppercase
select UPPER('hello');

-- Return set will pass first_name through the upper function
-- prior to returning it
select id, UPPER(first_name) from employees;

select id, LOWER(first_name) from EMPLoyees;
select * from employees;

SeLecT iD, Upper(substring(LOWER(first_name), 0, 1)) ||  substring(first_name, 1) FRoM EmPlOYees;

select id, char_length(first_name), first_name from employees;

select '    HELLO   ', TRIM('      HELLO     ');


-- Math functions: https://www.postgresql.org/docs/8.1/functions-math.html

--abs(n) absolute values
--ceil(n) round up
--floor(n) round down
-- round(n) round
-- random()
-- setseed(n)
-- trunc(n) truncate a values