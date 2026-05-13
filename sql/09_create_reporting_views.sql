CREATE OR ALTER VIEW vw_sales_detail AS
SELECT 
    -- Sales Data
    s.ord_num,
    s.ord_date,
    s.qty,
    s.payterms,

    -- Title Data
    t.title_id,
    t.title,
    t.type AS book_category,
    t.price,
    t.ytd_sales,
    t.pubdate,

    -- Publisher Data
    p.pub_id,
    p.pub_name,
    p.city AS publisher_city,
    p.state AS publisher_state,
    p.country AS publisher_country,

    -- Store Data
    st.stor_id,
    st.stor_name,
    st.city AS store_city,
    st.state AS store_state,

    -- Calculated Column
    (s.qty * t.price) AS estimated_revenue

FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
JOIN stores st ON s.stor_id = st.stor_id;
