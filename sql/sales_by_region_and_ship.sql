SELECT 
    cu.region,
    o.ship_mode,
    SUM(f.sales) AS total_sales
FROM fact_sales f
JOIN dim_customers cu ON f.customer_id = cu.customer_id
JOIN dim_orders o ON f.order_id = o.order_id
GROUP BY cu.region, o.ship_mode
ORDER BY total_sales DESC;
--results
--region    ship_mode           total_sales
--"Central"	"Standard Class"	368313.6174
--"East"	"Standard Class"	354046.7749
--"West"	"Standard Class"	351613.5502
--"South"	"Standard Class"	284241.8005
--"Central"	"Second Class"	    128869.4054
--"West"	"Second Class"	    116574.273
--"East"	"Second Class"		113834.0140
--"West"	"First Class"		112266.5152
--"South"	"Second Class"		 99915.8770
--"East"	"First Class"		 88601.7630
--"Central"	"First Class"		 82908.7083
--"South"	"First Class"		 67651.4364
--"West"	"Same Day"			 36354.578
--"Central"	"Same Day"			 35508.619
--"South"	"Same Day"			 31700.456
--"East"	"Same Day"			 24799.472