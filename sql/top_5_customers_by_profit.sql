SELECT 
    c.customer_name,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY cu.customer_name
ORDER BY total_profit DESC
LIMIT 5;
--result
--customer_name   total_profit
--"Tamara Chand"	8981.3239
--"Raymond Buch"	6976.0959
--"Sanjit Chand"	5757.4119
--"Hunter Lopez"	5622.4292
--"Adrian Barton"	5444.8055