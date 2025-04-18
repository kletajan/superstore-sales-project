INSERT INTO dim_customers
SELECT DISTINCT customer_id, customer_name, segment, country, region
FROM superstore_sales;

INSERT INTO dim_products
SELECT DISTINCT product_id, product_name, sub_category
FROM superstore_sales;

INSERT INTO dim_categories
SELECT DISTINCT sub_category, category
FROM superstore_sales;

INSERT INTO dim_orders
SELECT DISTINCT order_id, order_date, ship_date, ship_mode
FROM superstore_sales;

INSERT INTO fact_sales
SELECT
    row_id,
    order_id,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit,
    city,
    state,
    postal_code
FROM superstore_sales;

INSERT INTO fact_sales
SELECT
    row_id,
    order_id,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit,
    city,
    state,
    postal_code
FROM superstore_sales;