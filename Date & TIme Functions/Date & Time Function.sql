use SalesDB


select
orderID,
CreationTime,
'2026 - 08 -05' as Hardcoded_Date,
GETDATE() as Today
from sales.Orders


--I . PART EXTRACTION FUNCTIONS


--1. Day(), Month(), Year()

select
orderID,
CreationTime,
Year(CreationTime) as Year,
Month(CreationTime) as Month,
Day(CreationTime) as Day
from Sales.Orders


-- 2. DatePart()

select
OrderID,
CreationTime,
Datepart(year, CreationTime) as Datepart_Year,
Datepart(month, CreationTime) as Datepart_Month,
Datepart(hour, CreationTime) as Datepart_Hour,
Datepart(Quarter, CreationTime) as DatePart_Quarter,
Datepart(week, CreationTIme) as Datepart_WEek
from sales.Orders


-- 3. DateName()

select
orderID,
CreationTime,
DateName(month, CreationTIme) as MonthName,
DateName(weekday, CreationTime) as WeekDay,
DateName(day, CreationTime) as Day,
DateName(year, CreationTime) as Year
from sales.Orders


-- 4. DateTrunc()

select
orderID,
CreationTime,
DateTrunc(month, CreationTime) as MOnth_Trunc,
DateTrunc(year, CreationTime) as Year_Trunc,
DateTrunc(day, CreationTime) as Day_Trunc
from sales.Orders



select
Datetrunc(month, CreationTime) as Trunc_Month,
count(orderID)
from sales.Orders
Group by Datetrunc(month, CreationTime)


select
Datetrunc(year, CreationTime) as Trunc_Year,
count(orderID)
from sales.Orders
Group by Datetrunc(year, CreationTime)


-- 5. EOMONTH()

select
orderID,
CreationTime,
EOMONTH(CreationTime) as End_of_Month,
Cast(DateTrunc(month, CreationTime) as Date) as First_Day_Month
from sales.Orders


--Task :- How many orders placed each year??


select
DatePart(year,DateTrunc(year, OrderDate)) as Year,
count(OrderID)
from sales.Orders
group by DatePart(year,DateTrunc(year, OrderDate))



-- Task :- How many orders placed each month??

select
DateName(month, DateTrunc(month, orderDate)) as Month,
count(orderID)
from sales.Orders
group by DateName(month, DateTrunc(month, orderDate))


-- Task :- Show all orders that were placed during the month of Feb

select
DateName(month, Datetrunc(month, orderDate)) as Month,
count(orderID)
from sales.Orders
where DateName(month, Datetrunc(month, orderDate)) = 'February'
group by DateName(month, Datetrunc(month, orderDate))

-- or it can be done by

select *
from sales.Orders
where Month(orderDate) =2






