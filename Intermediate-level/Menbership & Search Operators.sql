--** MEMBERSHIP OPERATORS**--

--Retrieve all customers from either Germany or USA


--IN--

select *
from customers
where country IN ('Germany', 'USA')   -- 

 -- Or it can be done by also :-
select *
from customers
where country= 'Germany' or country ='USA'



--Retrieve all customers from nither Germany nor USA


--NOT  IN--

select *
from customers
where country NOT IN ('Germany', 'USA')



--** SEARCH OPERATORS**--

--LIKE--


--Find Name starts with M--?

select *
from customers
where first_name like 'M%'


--Find customers naem ends with 'n'

select *
from customers
where first_name like '%n'


--Find customers name contain 'r'

select *
from customers
where first_name like '%r%'

--Find customers name have 'r' third position

select *
from customers
where first_name like '__r%'
