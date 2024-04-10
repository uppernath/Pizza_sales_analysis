
/*1. DAILY TREND FOR ORDERS
This query provides a breakdown of total orders by day of the week, allowing us to analyze the daily sales trend.
It selects the day name using the TO_CHAR function applied to the order_date column, and counts the distinct order IDs grouped by the day of the week.
Sorting the result by total orders in descending order allows for easy identification of the busiest days in terms of order volume.
Understanding the daily trend for orders is essential for identifying peak sales days and optimizing operational and marketing strategies accordingly.
*/
SELECT 
    TO_CHAR(order_date, 'Day') AS day_name,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Day')
ORDER BY Total_orders DESC;


/*2. MONTHLY TREND FOR ORDERS (Sorted by Total Orders)
This query provides a breakdown of total orders by month, sorted in descending order of total orders.
It selects the month name using the TO_CHAR function applied to the order_date column, and counts the distinct order IDs grouped by the month. Sorting the result by total orders in descending order enables easy identification of the busiest months in terms of order volume. 
Understanding the monthly trend for orders is essential for identifying seasonal
patterns, planning promotions or marketing campaigns, and allocating resources effectively.
*/
SELECT
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Month');
ORDER BY Total_orders DESC;


/*3. HOURLY TREND FOR ORDERS (Sorted by Hour)
This query provides a breakdown of total orders by hour of the day, sorted by the hour.
It selects the hour of the order time using the TO_CHAR function applied to the order_time column,
and counts the distinct order IDs grouped by the hour. Sorting the result by hour allows for easy
visualization of the order trends throughout the day. Understanding the hourly trend for orders
helps in optimizing staffing schedules, production planning, and delivery logistics to meet
customer demand efficiently.
*/
SELECT
    TO_CHAR(order_time, 'HH24') AS order_hour,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_time, 'HH24')
ORDER BY TO_CHAR(order_time, 'HH24');


/*4. PERCENTAGE OF SALES BY PIZZA CATEGORY
This query calculates the percentage of total sales contributed by each pizza category.
It selects the pizza category, calculates the total sales for each category, and computes
the percentage of total sales represented by each category. The percentage is calculated
by dividing the total sales of each category by the overall total sales across all categories.
Understanding the percentage of sales by pizza category helps in identifying the most
popular pizza types and their contribution to overall sales, which can inform marketing
strategies and product offerings.
*/
SELECT
   pizza_caregory, sum(total_price) as Total_sales, sum(total_price) * 100/(SELECT sum(total_price) from pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY DESC;



/*5. PERCENTAGE OF SALES BY PIZZA SIZE
This query calculates the percentage of total sales contributed by each pizza size.
It selects the pizza size, calculates the total sales for each size, and computes
the percentage of total sales represented by each size. The percentage is calculated
by dividing the total sales of each size by the overall total sales across all sizes.
Understanding the percentage of sales by pizza size helps in identifying the popularity
of different pizza sizes among customers and their impact on overall sales revenue.
This information can guide pricing strategies, inventory management, and product
offerings to optimize sales performance.
*/
SELECT 
    pizza_size, sum(total_price) as Total_sales, sum(total_price) * 100/
    (SELECT sum(total_price) from pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC;




