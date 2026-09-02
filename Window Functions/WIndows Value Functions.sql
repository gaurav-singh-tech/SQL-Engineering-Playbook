-- ** WINDOW VALUE FUNCTIONS **--

-- 1. LAG()

-- Task
--Analyze the month over month (MoM) performnace by finding the percentaage change in sales??

select
OrderID,
OrderDate,
Month(OrderDate),
Sales
from Sales.Orders