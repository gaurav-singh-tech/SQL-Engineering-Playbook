-- **ADVANCE  SQL JOINS**--

--1. LEFT ANTI JOIN

--Get all customers who have not placed any order?

select *
from customers as c
left join orders as o
on c.id=o.customer_id
where o.customer_id IS  NULL   -- This life make this query a left anti join, otherwise it will be a normal left join

--2. RIGHT ANTI JOIN

--Get all orders with out customers?

select  *
from customers as c
right join
orders as o
on c.id= o.customer_id
where c.id is null


--TASK

select *
from orders as o
left join
customers as c
on o.customer_id=c.id
where c.id is null


--3. FULL ANTI JOIN

--Find customers without order and customers without order?


select *
from customers as c
full join
orders as o
on c.id=o.customer_id
where c.id is null
or
o.customer_id is null



--Get all the customers along with their orders, but only for customers who have placed an order(Without inner join) ?


select *
from customers as c
left join
orders as o
on c.id=o.customer_id
where o.customer_id is not null


--4. CROSS JOIN

--Generate all possible combinations of customers and orders?

select *
from customers
cross join
orders


