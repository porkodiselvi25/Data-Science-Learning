SELECT c.name, o.order_id 
FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id;

SELECT
    c.name,
    o.order_id,
    o.product_id,
    o.quantity,
    o.order_date
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;

SELECT
    c.name,
    p.product_name,
    o.quantity,
    o.order_date
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Products p
ON o.product_id = p.product_id;

SELECT
    c.name,
    SUM(o.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY c.name;

SELECT
    strftime('%Y-%m', o.order_date) AS month,
    SUM(o.quantity * p.price) AS revenue
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY month;


SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS revenue
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

SELECT c.name,SUM(o.quantity * p.price) AS revenue
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Products p
ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY revenue DESC;

SELECT
    AVG(order_value) AS avg_order_value
FROM (
    SELECT
        o.order_id,
        (o.quantity * p.price) AS order_value
    FROM Orders o
    JOIN Products p
    ON o.product_id = p.product_id
);

SELECT
    c.name,
    SUM(o.quantity * p.price) AS revenue,
    RANK() OVER (
        ORDER BY SUM(o.quantity * p.price) DESC
    ) AS customer_rank
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Products p
ON o.product_id = p.product_id
GROUP BY c.name;

SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(o.quantity * p.price) DESC
    ) AS product_rank
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

SELECT
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS running_total
FROM (
    SELECT
        o.order_date,
        SUM(o.quantity * p.price) AS daily_revenue
    FROM Orders o
    JOIN Products p
    ON o.product_id = p.product_id
    GROUP BY o.order_date
);


SELECT *
FROM (
    SELECT
        c.name,
        SUM(o.quantity * p.price) AS revenue
    FROM Customers c
    JOIN Orders o
    ON c.customer_id = o.customer_id
    JOIN Products p
    ON o.product_id = p.product_id
    GROUP BY c.name
)


WITH CustomerMonths AS (
    SELECT
        customer_id,
        strftime('%Y-%m', order_date) AS month
    FROM Orders
    GROUP BY customer_id, month
)
SELECT *
FROM CustomerMonths;


SELECT *
FROM (
    SELECT
        c.name,
        SUM(o.quantity * p.price) AS revenue
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Products p ON o.product_id = p.product_id
    GROUP BY c.name
)
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM (
        SELECT
            SUM(o.quantity * p.price) AS revenue
        FROM Orders o
        JOIN Products p ON o.product_id = p.product_id
        GROUP BY o.customer_id
    )
);