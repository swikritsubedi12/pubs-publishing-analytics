--1. Which publisher generated the highest estimated revenue?

select top 1
	p.pub_id,
	p.pub_name,
	p.city,
	p.country,
	sum(s.qty) as total_quantity_sold,
	sum(s.qty * t.price) as total_estimated_revenue
from publishers p
join titles t
on p.pub_id = t.pub_id
join sales s
on s.title_id = t.title_id
group by 	
	p.pub_id,
	p.pub_name,
	p.city,
	p.country
order by total_estimated_revenue desc;

--2. What is the total quantity sold by each publisher?

select
	p.pub_id,
	p.pub_name,
	p.city,
	p.country,
	sum(s.qty) as total_quantity_sold
from publishers p
join titles t
on p.pub_id = t.pub_id
join sales s
on s.title_id = t.title_id
group by 	
	p.pub_id,
	p.pub_name,
	p.city,
	p.country;

--3. What is the average book price by publisher?

select
	p.pub_id,
	p.pub_name,
	avg(t.price) as average_book_price
from publishers p
join titles t
on p.pub_id = t.pub_id
group by 	
	p.pub_id,
	p.pub_name;

--4. How many titles does each publisher have?

select
	p.pub_id,
	p.pub_name,
	COUNT(t.title_id) as title_count
from publishers p
join titles t
on p.pub_id = t.pub_id
group by 	
	p.pub_id,
	p.pub_name;

--5. Which publisher has high title count but low sales revenue?

select
	p.pub_id,
	p.pub_name,
	COUNT(t.title_id) as title_count,
	sum(s.qty * t.price) as total_estimated_revenue
from publishers p
join titles t
on p.pub_id = t.pub_id
join sales s
on s.title_id = t.title_id
group by 	
	p.pub_id,
	p.pub_name;    --"New Moon Books"

--1. Top publisher by estimated revenue - "Algodata Infosystems"
--2. Publisher with the most titles - "Binnet & Hardley"
--3. Publisher with the highest average book price - "Algodata Infosystems"
--4. One business insight in your own words - Algodata Infosystems should receive leadership attention because it generates the highest estimated revenue and has the highest average book price. This suggests that its catalog may include higher-value titles that contribute strongly to revenue. 