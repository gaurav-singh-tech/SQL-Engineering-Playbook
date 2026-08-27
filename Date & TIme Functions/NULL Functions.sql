--TASK

--FInd avg score of customers??

select
CustomerID,
Score,
Coalesce(Score, 0) Colesce_Score2,
avg(Score) OVER() Avg_Scores,
Avg(Coalesce(Score, 0)) OVER() Avg_Score_2
from Sales.Customers

-- TASK 
-- Display the full names of customers in a SIngle Field by Merging their First and last name and add 10 points in score???


select
CustomerID,
FirstName,
LastName,
Coalesce(LastName, ' ') LastName2,
Concat(FirstName, ' ', Coalesce(LastName, ' ')) as Full_Name,
Score,
Coalesce(Score, 0),
Coalesce(Score, 0) + 10 as ScoreAdd10
from Sales.Customers



--TASK 

--Sort the data from lowest to highest with Null appearing at last??


--Lazy Method  :-

select
CustomerID,
Score,
ISNULL(Score, 99999)
from Sales.Customers
Order by  ISNULL(Score, 999999)


--Professional Method :-

select
CustomerID,
Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
from Sales.Customers
Order by  CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


select
CustomerID,
Score
from Sales.Customers
Order by  CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


-- TASK 

--FInd the sales price for each order by divinding sales by quantity ??

select
OrderID,
Sales,
Quantity,
Sales/NullIf(Quantity,0) as Price
from Sales.Orders

--TASK

--Identify the customers who have no scores

Select
*
from Sales.Customers
where Score IS NULL


--Identify the customers who have scores

Select
*
from Sales.Customers
where Score IS NOT NULL


-- Show all details for customers who have not placed any orders ??

Select 
c.*,
o.OrderID
from Sales.Customers as c
LEFT JOIN
Sales.Orders as o
ON c.CustomerID= o.CustomerID
WHERE o.CustomerID IS NULL




with orders as(
select 1 Id, 'A' Category UNION
select 2, Null Union
select 3, ' ' Union
select 4, ''
)
select
*,
datalength(Category) as Cat_len,
datalength(trim(category)) Policy1,
nullif(trim(category), '') Policy2,
isnull(nullif(trim(category), ''), 'unknown') Policy3
from Orders





