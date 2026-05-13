USE pubs;
GO

-- ============================================================
-- Project: Pubs Publishing Analytics
-- File: 02_data_discovery.sql
-- Purpose: Explore database tables, row counts, and key columns
-- ============================================================


-- 1. List all tables in the database
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;


-- 2. Count rows in each table
SELECT 'authors' AS table_name, COUNT(*) AS row_count FROM authors
UNION ALL
SELECT 'discounts', COUNT(*) FROM discounts
UNION ALL
SELECT 'employee', COUNT(*) FROM employee
UNION ALL
SELECT 'jobs', COUNT(*) FROM jobs
UNION ALL
SELECT 'pub_info', COUNT(*) FROM pub_info
UNION ALL
SELECT 'publishers', COUNT(*) FROM publishers
UNION ALL
SELECT 'roysched', COUNT(*) FROM roysched
UNION ALL
SELECT 'sales', COUNT(*) FROM sales
UNION ALL
SELECT 'stores', COUNT(*) FROM stores
UNION ALL
SELECT 'titleauthor', COUNT(*) FROM titleauthor
UNION ALL
SELECT 'titles', COUNT(*) FROM titles
ORDER BY table_name;


-- 3. View column details for key business tables
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'sales',
    'titles',
    'publishers',
    'stores',
    'authors',
    'titleauthor'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- 4. Preview sales table
SELECT TOP 10 *
FROM sales;


-- 5. Preview titles table
SELECT TOP 10 *
FROM titles;


-- 6. Preview publishers table
SELECT TOP 10 *
FROM publishers;


-- 7. Preview stores table
SELECT TOP 10 *
FROM stores;


-- 8. Preview authors table
SELECT TOP 10 *
FROM authors;


-- 9. Preview titleauthor bridge table
SELECT TOP 10 *
FROM titleauthor;