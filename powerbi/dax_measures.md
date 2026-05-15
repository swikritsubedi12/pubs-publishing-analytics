Total Estimated Revenue = SUM(sales_detail[estimated_revenue])

Total Quantity Sold = SUM(sales_detail[qty])

Total Orders = DISTINCTCOUNT(sales_detail[ord_num])

Number of Titles Sold = DISTINCTCOUNT(sales_detail[title_id])

Number of Stores = DISTINCTCOUNT(sales_detail[stor_id])

Average Book Price = AVERAGE(sales_detail[price])

Revenue per Order = DIVIDE([Total Estimated Revenue], [Total Orders])

Revenue Share = 
DIVIDE(
    [Total Estimated Revenue],
    CALCULATE([Total Estimated Revenue], ALL(sales_detail))
)