CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_name VARCHAR,
    segment VARCHAR
);
CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR,
    customer_id VARCHAR REFERENCES customers(customer_id),
    country VARCHAR,
    city VARCHAR,
    state VARCHAR,
    postal_code VARCHAR,
    region VARCHAR
);
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category VARCHAR,
    sub_category VARCHAR,
    UNIQUE (category, sub_category)
);
CREATE TABLE products (
    product_id VARCHAR PRIMARY KEY,
    product_name VARCHAR,
    category_id INTEGER REFERENCES categories(category_id)
);
CREATE TABLE sales (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR REFERENCES orders(order_id),
    product_id VARCHAR REFERENCES products(product_id),
    sales NUMERIC,
    quantity INTEGER,
    discount NUMERIC,
    profit NUMERIC
);