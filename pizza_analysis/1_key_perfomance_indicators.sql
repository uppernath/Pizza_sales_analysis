/*1. TOTAL REVENUE
This calculates how much money the company made. This is one of the most important KPI's that determines how well the businessis doing
*/
SELECT
  sum(total_price) AS "Total Revenue"
FROM
  pizza_sales;


/*2. AVERAGE ORDER VALUE
This query calculates the average value of each order. By dividing the total revenue by the count of distinct order IDs, we obtain the average amount spent per order. This metric is crucial for understanding the typical spending behavior of customers and can help identify opportunities for increasing order values.
*/
SELECT
  sum(total_price) / COUNT(DISTINCT order_id) AS "Average"
FROM
  pizza_sales;


/*3. TOTAL PIZZA SOLD
This query calculates the total number of pizzas sold by summing the quantity of pizzas sold in all orders.
Understanding the total volume of pizzas sold provides insights into the demand for the company's products, which is essential for inventory management, production planning, and overall business performance assessment.
*/
SELECT
  sum(quantity) AS Total_pizza_sold
FROM
  pizza_sales;


/*4. TOTAL ORDERS
This query calculates the total number of orders by counting the distinct order IDs in the pizza_sales table.
Tracking the total number of orders provides a fundamental measure of customer activity and engagement with the company's products or services. It is a key performance indicator for assessing sales volume and customer demand.
*/
SELECT
  count(DISTINCT order_id) AS Total_orders
FROM
  pizza_sales;


/*5. AVERAGE PIZZA PER ORDER
This query calculates the average number of pizzas per order. It divides the total quantity of pizzas sold by the count of distinct order IDs. Understanding the average number of pizzas per order helps in assessing customer preferences and consumption patterns. It also aids in optimizing inventory levels and production planning to meet demand efficiently.
*/
SELECT
  CAST(CAST(sum(quantity) AS numeric (10, 2))/ count(DISTINCT order_id) AS numeric(10,2))AS Avg_pizza_per_order 
FROM
   pizza_sales;
