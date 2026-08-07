-- ** SET OPERATORS ** --

Use SalesDB

select
CustomerID,
LastName
from
Sales.Customers

UNION

select
EmployeeID,
LastName
from
Sales.Employees



--

select
CustomerID as c,
LastName
from
Sales.Customers

UNION

select
EmployeeID as e, -- THis alias will be ignored in output as its 2nd query
LastName as l  -- THis alias will be ignored in output as its 2nd query
from
Sales.Employees

--


--1. UNION

-- Combine the data from employees and customers into one table ??

select *
from sales.Customers;



select *
from Sales.Employees;



select
FirstName,
LastName
from sales.Customers

UNION

select
FirstName,
LastName
from sales.Employees


--2. UNION ALL

-- Combine the data from employees and customers into one table including duplicates ??

select
FirstName,
LastName
from sales.Customers

UNION ALL

select
FirstName,
LastName
from sales.Employees


-- 3 EXCEPT

-- FInd employees who are not customers ??


select
FirstName,
LastName
from sales.Employees

EXCEPT

select
FirstName,
LastName
from sales.Customers



-- FInd customers who are not employees ??

select
FirstName,
LastName
from sales.Customers

EXCEPT

select
FirstName,
LastName
from sales.Employees



-- 4. INTERSECT

--FInd employees who are also customers ??

select
FirstName,
LastName
from sales.Customers

INTERSECT

select
FirstName,
LastName
from sales.Employees






