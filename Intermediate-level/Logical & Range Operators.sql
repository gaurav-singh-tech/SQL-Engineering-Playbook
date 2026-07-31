--** LOGICAL OPERATORES**--

--Retrieve all the customers who are from USA and have score >500

--AND

Select *
from customers
where country= 'USA'
and score >500


--OR

select *
from customers
where country = 'USA'
or score>500


-- NOT

select *
from customers
where not score  <500  -- Inoutput score will be >= 500





--** RANGE OPERATOR**--


select *
from customers
where score 
between 100 and 500


select *
from customers
where score>=100 and score <=500