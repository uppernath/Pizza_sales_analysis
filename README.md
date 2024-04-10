# Overview

This project focuses on analyzing pizza sales data to derive valuable insights as regards the company's performance and customer behavior. The queries in this project helps stakeholders see meaningful information from the dataset to inform decision-making processes and strategic planning.

The project encompasses several aspects of analysis, including:

KPI Calculation: Queries to compute important metrics such as total revenue, average order value, total pizzas sold, total orders, and average pizzas per order.
Sales Trend Analysis: Queries to analyze sales trends on a daily, monthly, and hourly basis, providing insights into customer purchasing patterns and peak sales periods.
Product Analysis: Queries to determine the percentage of sales contributed by pizza category and pizza size, helping to identify popular products and optimize product offerings.

# Tools

- Microsoft Excel
- SQL (Postgres)
- VS Code
- Github

# Analysis

TOTAL REVENUE

This calculates how much money the company made. This is one of the most important KPI's that determines how well the businessis doing

```sql
SELECT
  sum(total_price) AS "Total Revenue"
FROM
  pizza_sales;
```

![Total Revenue](assets/Total%20Revenue.png)

AVERAGE ORDER VALUE

This query calculates the average value of each order. By dividing the total revenue by the count of distinct order IDs, we obtain the average amount spent per order. This metric is crucial for understanding the typical spending behavior of customers and can help identify opportunities for increasing order values.

```sql
SELECT
    sum(total_price) /
    COUNT(DISTINCT order_id)
    AS "Avg_order_value"
FROM
  pizza_sales;
```

![Average Order Value](/assets/Average%20Order%20Value.png)

TOTAL PIZZAS SOLD

This query calculates the total number of pizzas sold by summing the quantity of pizzas sold in all orders.
Understanding the total volume of pizzas sold provides insights into the demand for the company's products, which is essential for inventory management, production planning, and overall business performance assessment.

```sql
SELECT
  sum(quantity) AS Total_pizza_sold
FROM
  pizza_sales;
```

![Total Pizzas Sold](assets/Total%20Pizzas%20Sold.png)

TOTAL ORDERS

This query calculates the total number of orders by counting the distinct order IDs in the pizza_sales table.
Tracking the total number of orders provides a fundamental measure of customer activity and engagement with the company's products or services. It is a key performance indicator for assessing sales volume and customer demand.

```sql
SELECT
  count(DISTINCT order_id) AS Total_orders
FROM
  pizza_sales;
```

![Total Orders](assets/Total%20Orders.png)

AVERAGE PIZZA PER ORDER

This query calculates the average number of pizzas per order. It divides the total quantity of pizzas sold by the count of distinct order IDs. Understanding the average number of pizzas per order helps in assessing customer preferences and consumption patterns. It also aids in optimizing inventory levels and production planning to meet demand efficiently.

```sql
SELECT
  CAST(CAST(sum(quantity) AS numeric (10, 2))/
  count(DISTINCT order_id) AS numeric(10,2))
  AS Avg_pizza_per_order
FROM
   pizza_sales;
```

![Average Pizza Per Order](assets/Average%20Pizza%20Per%20Order.png)
