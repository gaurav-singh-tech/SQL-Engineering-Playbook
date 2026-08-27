---** DATE AND TIME FUNCTIONS**--

--II. Formatting & Casting


-- FROMAT


select
orderID,
CreationTime,
Format(CreationTime, 'dd') dd,
Format(CreationTime, 'ddd') ddd,
Format(CreationTime, 'dddd') dddd
from Sales.Orders


select
orderID,
CreationTime,
Format(CreationTime, 'MM') MM,
Format(CreationTime, 'MMM') MMM,
Format(CreationTime, 'MMMM') MMMM
from Sales.Orders

select
orderID,
CreationTime,
Format(CreationTime,'MM-dd-yyyy') USA_Format,
Format(CreationTime,'dd-MM-yyyy') Europe_Format
from Sales.Orders

--Task

--Show creation time using following format ??
-- Day Wed -Jan Q1 2025 12:34:56 PM 

select
OrderID,
CreationTime,
'Day ' + Format(CreationTime, 'ddd -MMM')
 + ' Q' + DateName(Quarter, CreationTime) + ' ' +
format(CreationTime, 'yyyy hh:mm:ss tt') Custom_Format
from sales.Orders



-- Extractiong a part of date with group by

select
format(orderDate, 'yyyy MMM') as Order_Date,
count(orderID)
from sales.Orders
group by format(orderDate, 'yyyy MMM')


-- CONVERT 

select
convert(INT, '123') as [String to Int Convert],
convert(DATE, '2026-08-07') as [String to Date],
CreationTime,
convert(DATE, CreationTime) as [DateTime to Date Convert],
convert(varchar, CreationTime, 32) as    [USA_Std_Format: 32]
from Sales.Orders


-- CAST

select
cast('123' as INT) as [String to Int],
cast(123 as Varchar) as [Int to String],
cast ('2025-08-07' as Date) as [String to Date],
cast ('2025-08-07' as DateTime) as [String to DateTime]


select
CreationTime,
cast(CreationTime as Date) as [DateTime to Date]
from sales.Orders
