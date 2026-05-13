--1. Which book category generated the highest estimated revenue?

select top 1
	t.type as book_category,
	SUM(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from titles t
join sales s
on s.title_id = t.title_id
group by t.type
order by total_estimated_revenue desc;

--2. What is the total quantity sold by each category?

select
	t.type as book_category,
	SUM(s.qty) as total_quantity_sold
from titles t
join sales s
on s.title_id = t.title_id
group by t.type;

--3. What is the average price by category?

select
	t.type as book_category,
	avg(t.price) as average_price
from titles t
group by t.type;

--4. How many distinct titles are in each category?

select
	t.type as book_category,
	count(distinct t.title_id) as distinct_titles
from titles t
group by t.type;

--5. Which category has high quantity sold but low estimated revenue?
-- High quantity sold + low average price = lower revenue efficiency

--1. Top category by estimated revenue - "psychology"
--2. Top category by quantity sold - "psychology"
--3. Category with highest average price - "popular_comp"
--4. One business insight - "Psychology is the strongest category because it leads both estimated revenue and quantity sold. However, popular computer books have the highest average price, which may make them valuable even if they sell fewer units. Marketing should continue supporting psychology titles while also exploring premium-positioning opportunities for popular computer books."