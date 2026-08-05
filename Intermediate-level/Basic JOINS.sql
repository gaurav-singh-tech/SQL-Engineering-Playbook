--** JOINS**--

--BASIC JOINS--

--1. NO JOIN

--Retrieve all data from customers and orders in twio differennt results

select *
from customers

select *
from orders



--Get all customers along with their orders

--2. INNER JOIN

select c.id, 
		c.first_name, 
		c.country, 
		o.order_id, 
		order_date, 
		sales
from customers as c
inner join
orders as o
on c.id = o.customer_id


--3. LEFT JOIN

--Get all customers aalongwith their orders including those woth without orders

select *
from customers as c
left join
orders as o
on c.id= o.customer_id


--4.RIGHT JOIN

select *
from customers as c
right join
orders as o
on c.id= o.customer_id


--Get all customers along with therir orders including orders wothouit matching customers(USE LEFT JOIN)

select *
from orders as o
left join
customers as c
on c.id= o.customer_id



--5 FULL JOIN





