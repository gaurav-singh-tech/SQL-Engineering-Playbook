-- ** FUNCTIONS **--


-- ROW LEVEL FUNCTIONS--

--I. String Functions

--1. CONCAT

select
first_Name, country,
concat(first_name,' ', country) as name_country
from customers

--2. UPPPER


select
first_Name, country,
upper(concat(first_name, ' ', country)) as Name_Country_Upper
from customers


--3 LOWER

select
first_Name, country,
upper(concat(first_name, ' ', country)) as Name_Country_Upper
from customers

--4. TRIM

--Find the customers whose first name contains trailing spaces?

select
first_Name,
len(first_name) len_name,
len(trim(first_name))  len_trim_name,
len(first_name)-len(trim(first_name)) flag
from customers
where len(first_Name) != len(trim(first_name))


select
first_name
from customers
where len(first_name) != len(trim(first_name))


-- 5. REPLACE

select
'123-456-789' not_replaced,
replace('123-456-789', '-', '/ ') as replaced


select
'report.txt' as old_fileformat,
replace('report.txt', '.txt', '.csv') as new_fileformat


--II.  String Extraction--

--1. LEFT 

--Extract first two char of each forst name??

select
first_name,
left(trim(first_name), 2) as First_2_char
from customers

--2. RIGHT


--Extract last two char of each forst name??

select
first_name,
right(trim(first_name), 2) as First_2_char
from customers


--3. SUBSTRING
-- Extract list of customers first names removing the first character??


select
first_name,
substring(trim(first_name), 2, len(first_name)) as sub_name
from customers


-- III. NUMERIC FUNCTIONS

--1 ROUND

select
3.516,
round(3.514, 2) as round_2,
round(3.516, 1) as round_1,
round(3.516, 0) as round_0


--2. ABS

select
-10,
10,
abs(-10),
abs(10)






