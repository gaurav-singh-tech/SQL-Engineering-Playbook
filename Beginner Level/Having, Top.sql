
--HAVING--

select * from customers

select country, sum(score), count(id)
from customers
where score>300
group by country
having sum(score) > 800


select country, sum(score) as Total_score, count(id) as Count
from customers
where score>300
group by country
having count(id)>1



/* FInd the average score for each country 
considering only customers with score not equal to 0 
and return only those with an average score grater than 430*/

select country, avg(score) as Avg_score
from customers
where score !=0
group by country
having avg(score)>430



--DISTINCT--

--REturn uniue list of all countries

select distinct country
from customers



--TOP/ LIMIT--


--Get top 3 customers with highest score

select top 3 *
from customers
order by score desc


-- GEt lowest score

select top 2 *
from customers
order by score asc

select * from orders

--Get 3 more recent orders

select top 3*
from orders
order by order_date desc