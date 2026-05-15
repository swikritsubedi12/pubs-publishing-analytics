import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

df = pd.read_csv("data/processed/sales_detail.csv")

#1. Revenue by book category
category_revenue = df.groupby("book_category")["estimated_revenue"].sum().sort_values(ascending=False)

category_revenue.plot(kind="bar")
plt.title("Revenue by Book Category")
plt.xlabel("Book Category")
plt.ylabel("Estimated Revenue")
plt.tight_layout()

output_folder = Path("images")
output_folder.mkdir(exist_ok=True)
plt.savefig(output_folder / "revenue_by_category.png", bbox_inches = "tight")
plt.close()

#2. Revenue by publisher
publisher_revenue = df.groupby("pub_name")["estimated_revenue"].sum().sort_values(ascending=False)

publisher_revenue.plot(kind= "bar")
plt.title("Revenue by Publisher")
plt.xlabel("Publisher Name")
plt.ylabel("Estimated Revenue")
plt.tight_layout()

output_folder = Path("images")
output_folder.mkdir(exist_ok=True)
plt.savefig(output_folder / "revenue_by_publisher.png", bbox_inches = "tight")
plt.close()


#3. Revenue by store
store_revenue = df.groupby("stor_name")["estimated_revenue"].sum().sort_values(ascending=False)

store_revenue.plot(kind= "barh")
plt.title("Revenue by Store")
plt.xlabel("Estimated Revenue")
plt.ylabel("Store Name")
plt.tight_layout()

output_folder = Path("images")
output_folder.mkdir(exist_ok=True)
plt.savefig(output_folder / "revenue_by_store.png", bbox_inches = "tight")
plt.close()

