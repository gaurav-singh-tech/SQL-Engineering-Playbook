-- ** WINDOWS RANKING FUNCTIONS** --


-- 1. Row_Number()

--  Rank  the orders based on their sales froom highest to lowest ??

select
OrderID,
OrderDate,
Sales,
Row_Number() Over(Order By Sales Desc) as RankSales
from Sales.Orders


--2. RANK() 

--  Rank  the orders based on their sales froom highest to lowest ??

select
OrderID,
OrderDate,
Sales,
Rank() Over(Order By Sales Desc) as RankSales
from Sales.Orders

--3. DENSE_RANK()

--  Rank  the orders based on their sales froom highest to lowest ??

select
OrderID,
OrderDate,
Sales,
DENSE_RANK() Over(Order By Sales Desc) as RankSales
from Sales.Orders



select
OrderID,
OrderDate,
Sales,
Row_Number() Over(Order By Sales Desc)  as Row_NUM_Rank_Sales,
RANK() Over(Order By Sales Desc)  as Rank_Sales,
DENSE_RANK() Over(Order By Sales Desc) as Dense_RankSales
from Sales.Orders



-- USE CASES OF RANK  FUNCTIONS

--1. TOP N ANALYSIS
-- FInd the top highest sales for each product

Select
*
From(
select
OrderID,
ProductID,
Sales,
Row_Number() Over (Partition By ProductID Order By Sales Desc) AS Top_sales
from Sales.Orders)t
Where Top_Sales = 1


--1. BOTTOM- N ANALYSIS
-- FInd the lowest 2 customers based on thir sales

select *
from
(select
CustomerID,
Sum(Sales) Total_Sales,
Row_Number() Over(Order By Sum(Sales)) as Rank_Cust
from Sales.Orders
Group By CustomerID)t

where Rank_Cust IN(1,2)


-- Assign unique Ids to the rows  of the 'Orders Archive' table ??

select * from (select
count(*) over(Partition By OrderID) CheckPK
from Sales.OrdersArchive)t
where CheckPK>1

select
Row_Number() Over(Order By OrderID, OrderDate) Unique_ID
,*
from Sales.OrdersArchive


-- Identify duplicate rows in table 'Orders Archive' and return a clean result without any duplicate ??

select * from(select
Row_Number() Over(Partition By OrderID Order By CreationTime Desc) rn,
*
from Sales.OrdersArchive)t
where rn=1


--4. NTILE()

Select
OrderID,
Sales,
NTile(1) Over(Order By Sales Desc) OneBucket
From Sales.Orders


Select
OrderID,
Sales,
NTile(2) Over(Order By Sales Desc) TwoBucket
From Sales.Orders


Select
OrderID,
Sales,
NTile(3) Over(Order By Sales Desc) ThreeBucket
From Sales.Orders


Select
OrderID,
Sales,
NTile(4) Over(Order By Sales Desc) FourBucket
From Sales.Orders


-- NTILE() Use Cases

-- Data Segmentation : Segment all orders into 3 categories: high, med, low

Select
*,
CASE
WHEN Buckets =1 Then 'HIGH'
WHEN Buckets =2 Then'Medium'
ELSE 'low'
END SalesSegment
From(
Select
OrderID,
Sales,
NTile(3) Over(Order By Sales Desc) Buckets
From Sales.Orders)t

-- Load Balancing : In order to export the data, divide orders into two groups ??

Select
Ntile(2) Over(Order By OrderID) Buckets,
*
From Sales.Orders


-- 5.  CUME_DIST()

-- Find the products that fall within highest 40 % of the prices ??

Select
*,
Concat(DISTrANK * 1000, '%') dISTrANK
From
(Select
Product,
Price,
Cume_Dist() Over(Order By Price Desc) DistRank
From Sales.Products)t

Where DistRank <= 0.4



-- 6. PERCENT_RANK()

Select
*,
Concat(DISTrANK * 1000, '%') dISTrANK
From
(Select
Product,
Price,
pERCENT_rANK() Over(Order By Price Desc) DistRank
From Sales.Products)t

Where DistRank <= 0.4















