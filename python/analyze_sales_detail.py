import pandas as pd

df = pd.read_csv("data/processed/sales_detail.csv")

#1. Number of rows and columns
print("The number of rows and columns are: ",df.shape)

#2. Column names
print("The number of columns are: ", df.columns)

#3. Missing values by column
print("The missing values by columns are: ", df.isna().sum())

#4. Total quantity sold
print("The total quantity sold is: ",df["qty"].sum())

#5. Total estimated revenue
print("The total estimated revenue is: ",df["estimated_revenue"].sum())

#6. Revenue by book category
print("The revenue of book by category: ",df.groupby("book_category")["estimated_revenue"].sum())

#7. Revenue by publisher
print("The revenue of book by publisher is: ",df.groupby("pub_name")["estimated_revenue"].sum())

#8. Revenue by store
print("The revenue of book by store: ",df.groupby("stor_name")["estimated_revenue"].sum())
