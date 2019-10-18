-- transaction isolation

-- Three major problems that we will talk about
-- and we will also discuss the solutions to them
-- Largely these solutions are simple for you to leverage,
-- you just need to know how to evaluate your transaction and determine
-- which solution is necessary considering the scope of the transaction.


-- Problem 1: Dirty reads
-- 		Dirty reads are any read from within a transaction that reads
--		changes from another ongoing transaction that has not committed.


-- Problem 2: Non-repeatable reads
--		is anytime in which, from a transaction, you read data from the
--		database. You then attempt to read the same data, however some
--		row data has changed due to an outside transaction committing.

-- Problem 3: Phantom reads
-- 		Phantom reads are anytime in which you read from the database
-- 		and then execute the same query again, and get different rows.
--		This is caused by transactions deleting, inserting, or updating
--		from other transactions committing in such a way that your transaction
--		starts seeing rows that weren't there before, or rows that were there
--		are no longer.


-- Solutions: Is selecting the appropriate transaction isolation level
-- for your transaction. Each level grants greater isolation at the cost
-- of performance. 

-- 1. Read Uncommitted - It protects from nothing. PostgreSQL does not support
--		read uncommitted. Don't use it. Also you can't.

-- 2. Read Committed - Protects you against dirty reads. This is the default
--		transaction isolation level in postgres.

-- 3. Repeatable Read - Protects against both dirty reads and non-repeatable
--		reads.

-- 4. Serializable - Protects against dirty reads, non-repeatable reads,
--		and phantom reads. Note: That postgres uses snapshot serialization
--		for serializable transactions. It will attempt to resolve conflicting
--		transactions. The one that commits first sticks, the one that commits
--		second will error. When you use serializable, you need to have exception
--		handling logic to retry the operation again if it fails.










