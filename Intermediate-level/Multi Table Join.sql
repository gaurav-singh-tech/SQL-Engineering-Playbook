--** MULTI TABLE JOIN

-- Using Sales DB , retrieve list of all orders, alongwith the related customers , product and employee table ??

USE SalesDB



-- As this database has SCHEMA so we have to use Sales.TableName. We cant directly write table name

select 
	o.OrderID,
	o.Sales,
	c.FirstName as Customers_FirstName,
	c.LastName as Customers_LastName,
	p.Product as Product_Name,
	p.Price,
	e.FirstName as Employye_FirstName,
	e.LastName as Employye_LastName

from sales.Orders as o
left join
sales.Customers as c
on o.CustomerID =c.CustomerID

left join
sales.Products as p
on o.ProductID = p.ProductID

left join
sales.Employees as e
on o.SalesPersonID = e.EmployeeID
