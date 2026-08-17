-- TASK

-- Generate the report showing total sales
Select
Category,
sum(Sales) as TotalSales
FROM(
	Select
	OrderID,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'HIGH'
		WHEN Sales> 20 THEN 'MEDIUM'
		ELSE 'LOW'
	END Category
	from Sales.Orders
) SubqueryAlias
GROUP BY Category
ORDER BY TotalSales DESC


--TASK

--Retriever employye details with gender display as full text

Select
EmployeeID,
FirstName,
LastName,
Gender,
CASE
WHEN Gender = 'M' THEN 'MALE'
WHEN Gender = 'F' THEN 'FEMALE'
ELSE 'N/A'
END FullGender
from Sales.Employees

--Retriever customere details with abbrevated country code

Select
CustomerID,
FirstName,
Country,
CASE
WHEN Country = 'Germany' THEN 'Ger'
WHEN Country = 'USA' THEN 'US'
ELSE 'N/A'
END AbbrCountry
from Sales.Customers



-- Quick Form / Only in case of one column and '=' operator

Select
CustomerID,
FirstName,
Country,
CASE Country
WHEN 'Germany' THEN 'Ger'
WHEN 'USA' THEN 'US'
ELSE 'N/A'
END AbbrCountry
from Sales.Customers



Select Distinct country
from Sales.Customers



--TASK 

/*Find the average scores of customers and treat Nulls as 0
And additionally provide such details like CustomerID and LastName*/

Select
CustomerID,
LastName,
Score,
Avg(CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END ) Over() AvgCustomer,
Avg(Score) Over() AvgCustomer2
from Sales.Customers

-- TASK

-- Count how many times each customer has made an order with sales greater than 30

select
CustomerID,
Sum(
CASE
WHEN Sales >30 THEN 1
ELSE 0
END) TotalOrdershigh30,
Count(*) TotalOrders
from Sales.Orders
Group By CustomerID