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

## Key Performance Indicators

**1.Total Revenue**

This calculates how much money the company made. This is one of the most important KPI's that determines how well the businessis doing

```sql
SELECT
  sum(total_price) AS "Total Revenue"
FROM
  pizza_sales;
```

![Total Revenue](assets/Total%20Revenue.png)

**2. Average Order Value**

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

**3. Total Pizzas Sold**

This query calculates the total number of pizzas sold by summing the quantity of pizzas sold in all orders.
Understanding the total volume of pizzas sold provides insights into the demand for the company's products, which is essential for inventory management, production planning, and overall business performance assessment.

```sql
SELECT
  sum(quantity) AS Total_pizza_sold
FROM
  pizza_sales;
```

![Total Pizzas Sold](assets/Total%20Pizzas%20Sold.png)

**4. Total Orders**

This query calculates the total number of orders by counting the distinct order IDs in the pizza_sales table.
Tracking the total number of orders provides a fundamental measure of customer activity and engagement with the company's products or services. It is a key performance indicator for assessing sales volume and customer demand.

```sql
SELECT
  count(DISTINCT order_id) AS Total_orders
FROM
  pizza_sales;
```

![Total Orders](assets/Total%20Orders.png)

**5. Average Pizza Per Order**

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

## Sales Trend

**1. Daily Trend for Orders**

This query provides a breakdown of total orders by day of the week, allowing us to analyze the daily sales trend.

It selects the day name using the TO_CHAR function applied to the order_date column, and counts the distinct order IDs grouped by the day of the week.
Sorting the result by total orders in descending order allows for easy identification of the busiest days in terms of order volume.

Understanding the daily trend for orders is essential for identifying peak sales days and optimizing operational and marketing strategies accordingly.

```sql
SELECT
    TO_CHAR(order_date, 'Day') AS day_name,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Day')
ORDER BY Total_orders DESC;
```

![Daily Trend for Orders](assets/Daily%20Trend%20for%20Orders.png)

**2. Monthly Trend for Orders**

This query provides a breakdown of total orders by month, sorted in descending order of total orders.
It selects the month name using the TO_CHAR function applied to the order_date column, and counts the distinct order IDs grouped by the month.

Sorting the result by total orders in descending order enables easy identification of the busiest months in terms of order volume.

Understanding the monthly trend for orders is essential for identifying seasonal
patterns, planning promotions or marketing campaigns, and allocating resources effectively.

```sql
SELECT
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY Total_orders DESC;
```

![Monthly Trend for Orders](assets/Monthly%20Trend%20for%20Orders.png)

**3. Hourly Trend for Orders**

This query provides a breakdown of total orders by hour of the day, sorted by the hour.
It selects the hour of the order time using the TO_CHAR function applied to the order_time column,
and counts the distinct order IDs grouped by the hour. Sorting the result by hour allows for easy
visualization of the order trends throughout the day. Understanding the hourly trend for orders
helps in optimizing staffing schedules, production planning, and delivery logistics to meet
customer demand efficiently.

```sql
SELECT
    TO_CHAR(order_time, 'HH24') AS order_hour,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_time, 'HH24')
ORDER BY TO_CHAR(order_time, 'HH24');
```

![Hourly Trend for Orders](assets/Hourly%20Trend%20for%20Orders.png)

**4. Percentage of Sales by Pizza Category**

This query calculates the percentage of total sales contributed by each pizza category.
It selects the pizza category, calculates the total sales for each category, and computes
the percentage of total sales represented by each category. The percentage is calculated
by dividing the total sales of each category by the overall total sales across all categories.
Understanding the percentage of sales by pizza category helps in identifying the most
popular pizza types and their contribution to overall sales, which can inform marketing
strategies and product offerings.

```sql
SELECT
  pizza_category,
  sum(total_price) AS Total_sales,
  sum(total_price) AS 100/(SELECT sum(total_price) from pizza_sales)
  AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT DESC;
```

![Pizza Category by Percentage](assets/Pizza%20category%20percentage.png)

**5. Percentage of Sales by Pizza Size**

This query calculates the percentage of total sales contributed by each pizza size.
It selects the pizza size, calculates the total sales for each size, and computes
the percentage of total sales represented by each size. The percentage is calculated
by dividing the total sales of each size by the overall total sales across all sizes.
Understanding the percentage of sales by pizza size helps in identifying the popularity
of different pizza sizes among customers and their impact on overall sales revenue.
This information can guide pricing strategies, inventory management, and product
offerings to optimize sales performance.

```sql
SELECT
    pizza_size,
    sum(total_price) as Total_sales,
    sum(total_price) * 100/
    (SELECT sum(total_price) from pizza_sales)
    AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC;
```

![Pizza Category by Size](assets/Pizza%20Category%20by%20Size.png)
