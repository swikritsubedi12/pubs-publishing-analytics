USE pubs;
GO

-- ============================================================
-- Project: Pubs Publishing Analytics
-- File: 03_relationship_notes.sql
-- Purpose: Understand relationships between tables
-- ============================================================


-- Relationship 1:
-- sales.title_id connects to titles.title_id
-- This tells us which book was sold.

SELECT TOP 10
    s.ord_num,
    s.ord_date,
    s.qty,
    s.title_id,
    t.title,
    t.type,
    t.price
FROM sales s
JOIN titles t
    ON s.title_id = t.title_id;


-- Relationship 2:
-- titles.pub_id connects to publishers.pub_id
-- This tells us which publisher owns each book.

SELECT TOP 10
    t.title_id,
    t.title,
    t.type,
    t.price,
    p.pub_name,
    p.city AS publisher_city,
    p.country AS publisher_country
FROM titles t
LEFT JOIN publishers p
    ON t.pub_id = p.pub_id;


-- Relationship 3:
-- sales.stor_id connects to stores.stor_id
-- This tells us which store sold each book.

SELECT TOP 10
    s.ord_num,
    s.ord_date,
    s.qty,
    st.stor_name,
    st.city AS store_city,
    st.state AS store_state
FROM sales s
JOIN stores st
    ON s.stor_id = st.stor_id;


-- Relationship 4:
-- authors connect to titles through titleauthor
-- This is a many-to-many relationship.
-- One author can write many titles.
-- One title can have many authors.

SELECT TOP 20
    a.au_id,
    CONCAT(a.au_fname, ' ', a.au_lname) AS author_name,
    t.title_id,
    t.title,
    ta.royaltyper
FROM authors a
JOIN titleauthor ta
    ON a.au_id = ta.au_id
JOIN titles t
    ON ta.title_id = t.title_id
ORDER BY author_name, t.title;