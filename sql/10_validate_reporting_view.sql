--1. How many rows are in vw_sales_detail?

select count(*) as total_rows from vw_sales_detail;

--2. Does total quantity match the original sales table?

select sum(qty) as total_rows from vw_sales_detail;

--3. Does estimated revenue match the earlier revenue total?

select sum(estimated_revenue) as total_rows from vw_sales_detail;

--4. Are there any missing prices?

select count(*) from vw_sales_detail where price is null;

--5. Are there any missing publisher names?

select count(*) from vw_sales_detail where pub_name is null;

--6. Are there any missing store names?

select count(*) from vw_sales_detail where stor_name is null;

--7. Are there duplicate order-title-store rows?

SELECT 
    ord_num, 
    title_id, 
    stor_id, 
    COUNT(*) AS OccurrenceCount
FROM sales
GROUP BY ord_num, title_id, stor_id
HAVING COUNT(*) > 1;