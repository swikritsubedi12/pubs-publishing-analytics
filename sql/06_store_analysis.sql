--1. Which store generated the highest estimated revenue?

select top 1
	st.stor_id,
	st.stor_name,
	st.city,
	st.state,
	SUM(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from stores st
join sales s
on st.stor_id = s.stor_id
join titles t
on s.title_id = t.title_id
group by st.stor_id,
		st.stor_name,
		st.city,
		st.state
order by total_estimated_revenue desc;

--2. What is the total quantity sold by each store?

select
	st.stor_id,
	st.stor_name,
	st.city,
	st.state,
	SUM(s.qty) as total_quantity_sold
from stores st
join sales s
on st.stor_id = s.stor_id
group by st.stor_id,
		st.stor_name,
		st.city,
		st.state;

--3. What is the total estimated revenue by each store?

select
	st.stor_id,
	st.stor_name,
	st.city,
	st.state,
	SUM(s.qty * t.price) as total_estimated_revenue
from stores st
join sales s
on st.stor_id = s.stor_id
join titles t
on s.title_id = t.title_id
group by st.stor_id,
		st.stor_name,
		st.city,
		st.state;

--4. Which state generated the highest estimated revenue?

select top 1
	st.state as store_state,
    SUM(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from stores st
join sales s
on st.stor_id = s.stor_id
join titles t
on s.title_id = t.title_id
group by st.state
order by total_estimated_revenue DESC;

--5. Which store sold the most distinct book titles?

select
	st.stor_id,
	st.stor_name,
	count(distinct s.title_id) as distinct_titles_sold
from stores st
join sales s
on st.stor_id = s.stor_id
join titles t
on s.title_id = t.title_id
group by st.stor_id, st.stor_name;


--1. Top store by estimated revenue - "Barnum's"
--2. Top state by estimated revenue - "CA"
--3. Store with most distinct titles sold - "Doc-U-Mat: Quality Laundry and Books"
--4. One business insight - "California is the strongest sales region by estimated revenue, so leadership should investigate whether CA stores can receive more inventory, marketing support, or promotional campaigns. However, the team should also review whether CA performs well because it has more stores, better titles, or larger order quantities"