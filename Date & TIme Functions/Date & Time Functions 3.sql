-- ** DATE CALCULATION FUNCTIONS**


-- DATEADD

select
orderID,
orderDate,
DateAdd(year, 2, OrderDate) as TwoYearsLater,
DateAdd(month, 3, OrderDate) as ThreeMonthsLater,
DateAdd(day, -10, OrderDate) as TenDaysBefore
from Sales.Orders


-- DATEDIFF

--Task : Calculate the age of all employees??

select
EmployeeID,
BirthDate,
DateDiff(year, BirthDate, GetDate()) as Age
from Sales.Employees

-- Tak: Find the average shipping duration in days for each month??

select
Month(OrderDate) as Order_Date,
Avg(DateDiff(day, OrderDate, ShipDate)) as Avg_Ship_Duration
from
Sales.Orders
group by Month(OrderDate)


-- Task 
--Time Gap Analysis
-- Find the number of days between each order and previous order ??

select
orderID,
OrderDate as Current_Order_Date,
Lag(OrderDate) over (order By OrderDate) PreviousOrderDate,
DateDiff(day, Lag(OrderDate) over (order By OrderDate), OrderDate) as No_of_Days
from sales.Orders


-- DATE VALIDATION

-- ISDATE()


select
isdate('123') dateCheck1,
isdate('2025-08-02')datecheck2,
isdate('20-08-2025') datecheck3,
isdate('2025') datecheck4
