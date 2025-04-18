CREATE TABLE dim_customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    region TEXT
);

CREATE TABLE dim_products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    sub_category TEXT
);

CREATE TABLE dim_categories (
    sub_category TEXT PRIMARY KEY,
    category TEXT
);

CREATE TABLE dim_orders (
    order_id TEXT PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT
);

CREATE TABLE fact_sales (
    row_id INTEGER PRIMARY KEY,
    order_id TEXT REFERENCES dim_orders(order_id),
    customer_id TEXT REFERENCES dim_customers(customer_id),
    product_id TEXT REFERENCES dim_products(product_id),
    sales NUMERIC,
    quantity INTEGER,
    discount NUMERIC,
    profit NUMERIC,
    city TEXT,
    state TEXT,
    postal_code TEXT
);