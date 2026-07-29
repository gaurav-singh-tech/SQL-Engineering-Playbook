--ORDER BY

select
	first_name,
	score
from customers
order by score desc

select
	first_name,
	score
from customers
order by score asc


--NESTED ORDER BY

-- Retrieve all customers and sort the result by the country and then by highest score

select *
from customers
order by country asc,
         score desc



-- GROUP BY

--Find total score by each country

select
	country,
	avg(score) as Avg_score  --alias
from customers
group by country


select
	country,
	first_name,
	avg(score) as Avg_score  --alias
from customers
group by country, first_name


--FInd total score and total number of customers

select
country,
	sum(score) as total_score,
	count(id) as total_customers
from customers
group by country
