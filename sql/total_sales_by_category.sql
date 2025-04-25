SELECT 
    c.category,
    SUM(f.sales) AS total_sales
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_categories c ON p.sub_category = c.sub_category
GROUP BY c.category
ORDER BY total_sales DESC;
-- results:
-- category           total_sales
-- "Technology"	      836154.033
-- "Furniture"	      741999.7953
-- "Office Supplies"  719047.032