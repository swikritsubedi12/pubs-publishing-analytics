--1. What is the total quantity of books sold?

select
	SUM(qty) as total_qty_books_sold
from sales;

--2. What is the total estimated revenue?

select
	SUM(t.price * s.qty) as total_estimated_revenue
from titles t
join sales s
on t.title_id = s.title_id;

--3. What is the estimated revenue for each order?

select 
	s.ord_num,
	s.ord_date,
	t.title_id,
	t.title,
	t.type,
	s.qty,
	t.price,
	SUM(s.qty * t.price) as estimated_revenue
from sales s
join titles t
on s.title_id = t.title_id
group by s.ord_num,
	s.ord_date,
	t.title_id,
	t.title,
	t.type,
	s.qty,
	t.price
order by estimated_revenue desc;

--4. Which book title generated the highest estimated revenue?

select top 1
	t.title,
	t.type,
	sum(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from sales s
join titles t
on s.title_id = t.title_id
group by t.title,
	t.type
order by total_estimated_revenue desc;

--5. Which book category generated the highest estimated revenue?

select top 1
	t.type,
	sum(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from sales s
join titles t
on s.title_id = t.title_id
group by t.type
order by total_estimated_revenue desc;


--1. Total quantity sold - 493
--2. Total estimated revenue - 6676.9
--3. Top title by estimated revenue - "Is Anger the Enemy?"
--4. Top category by estimated revenue - psychology