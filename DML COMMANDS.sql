--DML COMMANDS-

--1. INSERT

INSERT INTO CUSTOMERS (id, first_name, country, score)
VALUES
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100)

SELECT * FROM customers

INSERT INTO CUSTOMERS
VALUES
	(9, 'Max', 'USA', NULL)


INSERT INTO CUSTOMERS (id, first_name)
VALUES
	(10, 'Anna')


--INSERT USING SELECT


--Insert data from 'customers' table to 'PERSONS' table . customers is source table and PERSONS is target table


INSERT INTO PERSONS (ID, NAME, BIRTH_DATE, CONTACT, Email)
SELECT
id,
first_name,
NULL,  -- FOR BIRTH PLACE IN PERSONS TABLE WE INSERT NULL
'Unknown', -- As NULL is not allowed for Contact column in PERSONS table we insert static value
'Unknown'-- As NULL is not allowed for Email column also  in PERSONS table we insert static value
FROM customers


--In above query firstly we write query to fetch data from customers table and then insert it into PERSONS table

select *from customers

select * from PERSONS



--2. UPDATE


UPDATE customers
SET score = 0
WHERE ID =6



SELECT *
FROM CUSTOMERS
where ID =6


-- Update score to 0 and update country to UK of ID 10

UPDATE customers
SET score = 0,
	country = 'UK'
WHERE ID =10







SELECT * FROM customers
WHERE SCORE IS NULL



UPDATE customers
SET score = 0,
	country = 'UK'
WHERE SCORE IS NULL


--3. DELETE

DELETE FROM customers
WHERE ID>8


--4. TRUNCATE

TRUNCATE FROM PERSONS