import pandas as pd
from sqlalchemy import create_engine

# Replace with your real PostgreSQL credentials
db_config = {
    'user': 'postgres',
    'password': '12345',
    'host': 'localhost',
    'port': '5432',
    'database': 'superstore_db'
}

# Build the connection string
conn_str = f"postgresql+psycopg2://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['database']}"

# Create SQLAlchemy engine
engine = create_engine(conn_str)

# Example query: total sales by category
query = """
SELECT 
    c.category,
    SUM(f.sales) AS total_sales
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_categories c ON p.sub_category = c.sub_category
GROUP BY c.category
ORDER BY total_sales DESC;
"""

# Load data into a pandas DataFrame
df = pd.read_sql(query, engine)

# Show results
print(df)
