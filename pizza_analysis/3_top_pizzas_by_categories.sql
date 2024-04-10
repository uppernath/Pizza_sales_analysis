/*Top 5 pizzas by Revenue*/
SELECT pizza_name, SUM(total_price) AS  "Total Revenue"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 5;

/*Top 5 pizzas by Quantity*/
SELECT pizza_name, SUM(quantity) AS "Total Quantity"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;

/*Top 5 pizzas by Orders*/
SELECT pizza_name, count(distinct order_id) AS "Total Quantity"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total Quantity" DESC
LIMIT 5;
