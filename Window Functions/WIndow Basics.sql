--WINDOW FUNCTIONS --



--Task
-- Find the total sales across all orders

select
sum(Sales) Total_Sales
from sales.Orders


--Find total sales for each product

select
ProductID,
sum(Sales) as ProductwiseSales
from sales.Orders
Group by ProductID



-- PARTITION BY()

--Find total sales for each product additional provide details order id and date

select
ProductID,
OrderID,
OrderDate,
sum(Sales) OVER(PARTITION BY PRODUCTID) as Total_SalesbyProduct
from Sales.Orders

-- Find total sales details across all orders and provide details order ID & Order Date

select
OrderID,
OrderDate,
sum(Sales) Over() as TotalSales_byOrder
from sales.Orders

--Find total sales for each product

select
OrderID,
OrderDate,
ProductID,
sum(Sales) Over( Partition By ProductID) as Total_Sales_by_Product
from sales.Orders



-- Find total sales details across all orders and provide details order ID & Order Date
--Find total sales for each product

select
OrderID,
OrderDate,
ProductID,
Sales,
sum(Sales) Over () as Total_sales,
sum(Sales) Over( Partition By ProductID) as Total_Sales_by_Product
from sales.Orders


-- Find the total sales for each combination of product and order status


select
OrderID,
OrderStatus,
ProductID,
Sales,
sum(Sales) Over( Partition By OrderStatus, ProductID) as Combination_Sales
from Sales.Orders




-- ORDER BY() --

-- Rank each order based on their sales from highest to lowest


select
OrderID,
OrderDate,
Sales,
Rank() Over( Order by Sales Desc) RankSales
from Sales.Orders


select
OrderID,
OrderDate,
Sales,
Rank() Over(Order By Sales Desc) as OrderSales
from Sales.Orders

--  FRAME CLAUSE --


--1. Row Following

select
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between Current Row And  2 Following) TOtal_Sales
From Sales.Orders



-- 2. Row Preceding

--Normal Form

select
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between 2 Preceding And  Current Row) TOtal_Sales
From Sales.Orders


--Short FOrm

select
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows  2 Preceding) TOtal_Sales
From Sales.Orders


-- Default Fram with Order By

select
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between Unbounded Preceding and Current Row) TOtal_Sales
From Sales.Orders



-- WINDOW FUNCTIONS RULES

-- 1.Window FUction can also be used in Order Clause . WIndow Function only Used in either Select or Order By CLause


select
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between 2 Preceding And  Current Row) TOtal_Sales
From Sales.Orders
Order By Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between 2 Preceding And  Current Row) Desc

--2. Nesting Windows are not allowed

-- 3. Window Function is Executed after the Where Clause Filtering

select
ProductID,
OrderID,
OrderDate,
OrderStatus,
Sales,
Sum(Sales) Over(Partition By OrderStatus Order By OrderDate
Rows Between 2 Preceding And  Current Row) TOtal_Sales
From Sales.Orders
WHere ProductID In(101,102)

--4. Window Function can be used together with the Group By in the same query, only if the same columns are used in both WIndow Fn and Group By clause

-- Task = Rank the customers based on their total sales

select
CustomerID,
sum(Sales) CustWiseTOtalSales,
Rank() Over(Order By sum(Sales) Desc) as RankCust
from sales.Orders
Group By CustomerID


