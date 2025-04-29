- Cleaned table creation
CREATE TABLE orders AS
SELECT 
    CAST(c1 AS INTEGER) AS order_id,
    DATE(c2) AS order_date,
    CAST(c3 AS REAL) AS amount,
    CAST(c4 AS INTEGER) AS product_id
FROM OnlineSalesData;

- Monthly Revenue & Volume
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY month
ORDER BY month;

- Top 3 Months by Revenue
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 3;

-Total Orders and Revenue
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM orders;
