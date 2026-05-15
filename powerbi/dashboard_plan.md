# Pubs Publishing Power BI Dashboard Plan

## Dashboard Audience

Primary audience:
- CEO
- Board Members

Secondary audience:
- Sales Manager
- Marketing Manager
- Publishing Manager

## Dashboard Goal

Help leadership understand sales performance across titles, categories, publishers, and stores so they can make better sales and marketing decisions.

## Page 1: Executive Summary

### KPI Cards
- Total Estimated Revenue
- Total Quantity Sold
- Total Orders
- Number of Titles Sold
- Number of Stores

### Visuals
- Revenue by Book Category
- Revenue by Publisher
- Revenue by Store
- Top Titles by Revenue

### Filters
- Book Category
- Publisher
- Store State
- Order Date

## Key Business Metric

Estimated Revenue = Quantity Sold × Book Price

## Notes

The dataset comes from the SQL reporting view `vw_sales_detail`, exported through Python to `data/processed/sales_detail.csv`.