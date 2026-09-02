-- WINDOWS AGGREGATE FUNCTIONS--

--1. COUNT()

-- FInd total number of orders for each product??


select
ProductID,
count(OrderID) over(Partition By ProductID) as Totalorder
from Sales.Orders


-- FInd total number of orders for each product??
select
CustomerID,
OrderID,
count(OrderID) over(Partition By CustomerID)
from Sales.Orders

-- FInd total number of customers and provide details ??

select
*,
count(CustomerID) Over() as COunt
from Sales.Customers


--Find total number of scores for customers ??

select
*,
count(*) Over() Total_customers,
count(1) Over() Total_Scor,
count(Score) Over() Total_Score,
count(Country) Over() Total_Country
from Sales.Customers


--Check order table contains any duplicate ??

select
orderID,
count(*) Over(Partition By OrderID) CheckPK
from Sales.Orders



--To check duplicates
select *
from
	(select
	count(*) Over(Partition By OrderID) CheckPK
	From Sales.OrdersArchive)t
where CheckPK>1


-- 2. SUM()

-- FInd total sales for each product ??

select
*,
sum(Sales) Over() as Total_Sales,
sum(Sales) Over(Partition By ProductID) as Total_Sales_Prod
from Sales.Orders


-- Find the percentage contribution of each product's  sales to the total sales??

select
OrderID,
ProductID,
sum(Sales) Over() TotalSales,
Round(Cast (Sales as Float)/ sum(Sales) Over() * 100, 2) AS Percent_SAles
from Sales.Orders

--3. AVG()


--Find the average sales for each product with other details

select
*,
Avg(Sales) Over() AS Avg_SAles,
Avg(Sales) Over(Partition By ProductID) as Avg_Sales_Prod
from Sales.Orders

--How to deal with Nulls while finding avgerage.

select
CustomerID,
LastName,
Avg(Score) Over() Avg_Scorewith_Null,
Avg(Coalesce(Score, 0)) Over() Avg_score
from Sales.Customers

--Find all orders where sales are higher than the average sales across all orders

Select
*
from
(select
OrderID,
ProductID,
Sales,
Avg(Sales)  Over() as AvgSales
from Sales.Orders)t
where Sales > AvgSales



--4. MIN/MAX

--Find the highest and lowest sales across all orders
--Find the highest and lowest sales across all products

Select
OrderID,
OrderDate,
Sales,
Max(Sales) Over() MaxSales,
Min(Sales) Over() MinSales,
Max(Sales) Over(Partition By ProductID) MaxSales,
Min(Sales) Over(Partition By ProductID) MinSales
From Sales.Orders


-- Show the employees with highest salaries

Select
*
From
(Select *,
Max(Salary) Over() Max_Salary
from Sales.Employees)y
where Salary = Max_Salary


-- Calculate the deviation of each sale from both the min and max sales amount ??


Select
OrderID,
OrderDate,
Sales,
Max(Sales) Over() MaxSales,
Min(Sales) Over() MinSales,
Max(Sales) Over(Partition By ProductID) MaxSales,
Min(Sales) Over(Partition By ProductID) MinSales,
Sales -Min(Sales) Over() DeviationMin,
Max(Sales) Over() - Sales  DeviationMax
From Sales.Orders



-- Calculate the moving average of sales for each product over time ??

Select
OrderID,
ProductID,
OrderDate,
Sales,
Avg(sales)  Over(Partition By ProductID ) AvgByProduct,
Avg(sales)  Over(Partition By ProductID ORDER BY OrderDate Desc  ) MovingAvg
From Sales.Orders


-- Calculate the moving average of sales for each product over time, including only the next order ??


Select
OrderID,
OrderDate,
ProductID,
Sales,
Avg(Sales) Over() Avg_sales,
Avg(sales)  Over(Partition By ProductID ) AvgByProduct,
Avg(sales)  Over(Partition By ProductID ORDER BY OrderDate Desc  ) MovingAvg,
Avg(Sales) Over(Partition By ProductID Order By OrderDate Desc 
ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) as Rolling_Avg
from Sales.Orders












