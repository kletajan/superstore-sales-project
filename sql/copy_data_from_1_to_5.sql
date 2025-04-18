INSERT INTO customers (customer_id, customer_name, segment)
SELECT DISTINCT customer_id, customer_name, segment
FROM superstore_sales;

INSERT INTO orders (
    order_id, order_date, ship_date, ship_mode,
    customer_id, country, city, state, postal_code, region
)
SELECT DISTINCT
    order_id, 
    order_date,
    ship_date,
    ship_mode, customer_id,
    country, city, state, postal_code, region
FROM superstore_sales;

INSERT INTO categories (category, sub_category)
SELECT DISTINCT category, sub_category
FROM superstore_sales;

INSERT INTO products (product_id, product_name, category_id)
SELECT DISTINCT ON (s.product_id)
    s.product_id,
    s.product_name,
    c.category_id
FROM superstore_sales s
JOIN categories c
  ON s.category = c.category AND s.sub_category = c.sub_category;

INSERT INTO sales (row_id, order_id, product_id, sales, quantity, discount, profit)
SELECT
    row_id, order_id, product_id, sales::NUMERIC, quantity, discount::NUMERIC, profit::NUMERIC
FROM superstore_sales;