# full_analysis.py

import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

# DB connection setup
engine = create_engine("postgresql+psycopg2://postgres:12345@localhost:5432/superstore_db")

# Monthly Sales Trend
monthly_query = """
SELECT 
    to_char(o.order_date, 'YYYY/MM') AS converted_date,
    SUM(f.sales) AS total_sales
FROM fact_sales f
JOIN dim_orders o ON f.order_id = o.order_id
GROUP BY converted_date
ORDER BY converted_date;
"""
df_month = pd.read_sql(monthly_query, engine)
df_month.plot(x='converted_date', y='total_sales', kind='line', title='Monthly Sales Trend')
plt.show()

# Top 10 Customers by Profit
top_customers = """
SELECT
    cu.customer_name,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_customers cu ON f.customer_id = cu.customer_id
GROUP BY cu.customer_name
ORDER BY total_profit DESC
LIMIT 10;
"""
df_customers = pd.read_sql(top_customers, engine)
print("\nTop 10 Customers by Profit:")
print(df_customers)

# Sales by Category
category_sales = """
SELECT 
    c.category,
    SUM(f.sales) AS total_sales
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_categories c ON p.sub_category = c.sub_category
GROUP BY c.category
ORDER BY total_sales DESC;
"""
df_cat = pd.read_sql(category_sales, engine)
df_cat.plot(x='category', y='total_sales', kind='bar', title='Sales by Category')
plt.show()

# Export full dataset for Power BI
export_query = """
SELECT 
    f.*,
    cu.customer_name,
    cu.segment,
    cu.region,
    p.product_name,
    c.category,
    o.order_date
FROM fact_sales f
JOIN dim_customers cu ON f.customer_id = cu.customer_id
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_categories c ON p.sub_category = c.sub_category
JOIN dim_orders o ON f.order_id = o.order_id;
"""
df_full = pd.read_sql(export_query, engine)
df_full.to_csv('data/fact_sales_export.csv', index=False)
print("\n✅ Exported clean dataset for Power BI.")