--1. Which author is connected to the highest estimated revenue?

select top 1
	a.au_id as author_id,
	CONCAT(a.au_fname,' ',a.au_lname) as author_name,
	SUM(s.qty) as total_quantity_sold,
	SUM(s.qty * t.price) as total_estimated_revenue
from authors a
join titleauthor ta
on a.au_id = ta.au_id
join titles t
on ta.title_id = t.title_id
join sales s
on t.title_id = s.title_id
group by a.au_id, CONCAT(a.au_fname,' ',a.au_lname)
order by total_estimated_revenue desc ;

--2. What is the total quantity sold by author?

select
	a.au_id as author_id,
	CONCAT(a.au_fname,' ',a.au_lname) as author_name,
	SUM(s.qty) as total_quantity_sold
from authors a
join titleauthor ta
on a.au_id = ta.au_id
join titles t
on ta.title_id = t.title_id
join sales s
on t.title_id = s.title_id
group by a.au_id, CONCAT(a.au_fname,' ',a.au_lname)
order by total_quantity_sold desc ;     --"Albert Ringer"

--3. How many distinct titles does each author have?

select
	a.au_id as author_id,
	CONCAT(a.au_fname,' ',a.au_lname) as author_name,
	count(distinct ta.title_id) as distinct_titles
from authors a
join titleauthor ta
on a.au_id = ta.au_id
group by a.au_id, CONCAT(a.au_fname,' ',a.au_lname);

--4. Which authors have more than one title?

select
	a.au_id as author_id,
	CONCAT(a.au_fname,' ',a.au_lname) as author_name,
	count(distinct ta.title_id) as distinct_titles
from authors a
join titleauthor ta
on a.au_id = ta.au_id
group by a.au_id, CONCAT(a.au_fname,' ',a.au_lname)
having count(distinct ta.title_id) > 1;

--5. Which author has the highest royalty percentage on sold titles?

SELECT DISTINCT TOP 1
    a.au_id AS author_id,
    CONCAT(a.au_fname, ' ', a.au_lname) AS author_name,
    t.title,
    ta.royaltyper
FROM authors a
JOIN titleauthor ta
    ON a.au_id = ta.au_id
JOIN titles t
    ON ta.title_id = t.title_id
JOIN sales s
    ON s.title_id = t.title_id
ORDER BY ta.royaltyper DESC;



--1. Top author by estimated revenue - "Albert Ringer"
--2. Author(s) with more than one title - 6 authors
--3. Author with highest royalty percentage on sold titles - 
--4. One business insight - Albert Ringer is the top author by estimated revenue, while Johnson White has the highest royalty percentage on sold titles. This means revenue performance and royalty share are not always the same thing.