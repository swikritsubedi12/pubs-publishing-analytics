import pandas as pd
from sqlalchemy import create_engine
from pathlib import Path

# ------------------------------------------------------------
# 1. SQL Server connection details
# ------------------------------------------------------------

SERVER = r"DESKTOP-SN21DMT\SQLEXPRESS"
DATABASE = "pubs"
DRIVER = "ODBC Driver 17 for SQL Server"

# ------------------------------------------------------------
# 2. Create connection string
# ------------------------------------------------------------

connection_string = (
    f"mssql+pyodbc://@{SERVER}/{DATABASE}"
    f"?driver={DRIVER.replace(' ', '+')}"
    "&trusted_connection=yes"
)

# ------------------------------------------------------------
# 3. Create SQLAlchemy engine
# ------------------------------------------------------------

engine = create_engine(connection_string)

# ------------------------------------------------------------
# 4. SQL query
# ------------------------------------------------------------

query = """
SELECT *
FROM vw_sales_detail;
"""
# ------------------------------------------------------------
# 5. Read SQL data into pandas DataFrame
# ------------------------------------------------------------

print("Connecting to SQL Server...")
df = pd.read_sql(query, engine)

print("Data extracted successfully.")

# ------------------------------------------------------------
# 6. Validate extracted data
# ------------------------------------------------------------

print("Rows:", df.shape[0])
print("Columns:", df.shape[1])
print("Total quantity sold:", df["qty"].sum())
print("Total estimated revenue:", round(df["estimated_revenue"].sum(), 2))

# ------------------------------------------------------------
# 7. Save data to CSV
# ------------------------------------------------------------

output_folder = Path("data/processed")
output_folder.mkdir(parents=True, exist_ok=True)

output_file = output_folder / "sales_detail.csv"

df.to_csv(output_file, index=False)

print(f"CSV file saved to: {output_file}")