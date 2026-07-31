--WHERE CLAUSE

--REtrieve customeres with score  not equal to zero

select *
from customers
where score!=0

--REtrieve customeres from Germany

select
	first_name,
	country,
	score
from customers
where country = 'UK'