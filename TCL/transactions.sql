-- TCL - transaction control language
-- The domain of TCL is the management of transactions.
-- Operations under TCL are:

-- begin - Used to start a transaction
-- savepoint - Create a saved point during a transaction that
-- 			can be rolled back to.
-- release - Release a savepoint from memory once no longer needed.
-- rollback - Rollback to a savepoint or to prior to the transaction
--			beginning.
-- commit - Commit the transaction, and save changes as the new 
-- 			state of the database.

-- What is a transaction?
-- Let's say, you're creating a banking application.
-- So one feature you might want to have would a transfer
-- feature.  How would you create this feature?

-- Transactions allow us to write combine multiple operations into
-- 'a transaction' which must all occur or none of them occur.

-- in situations where some operations happening and others not would
-- invalidate the state of our application, we should use transactions
-- to prevent us from entering that invalid state.

rollback;
begin;
update EMPLOYEES set salary = 1000 where first_name like 'Emily';

select * from employees;

commit;
rollback;


-- Using savepoint
begin;
update employees set salary = 2000 where first_name like 'Georgie';
savepoint georgie;
update employees set salary = 3000 where first_name like 'Henry';
rollback to georgie;
update employees set salary = 4000 where first_name like 'Franky';
commit;

select * from employees;




