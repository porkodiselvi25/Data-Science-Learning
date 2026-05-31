CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_date TEXT
);

INSERT INTO customers VALUES
(1, 'Ravi', 'Chennai'),
(2, 'Meena', 'Coimbatore'),
(3, 'Arun', 'Madurai');

INSERT INTO products VALUES
(1, 'Laptop', 55000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1200);

INSERT INTO orders VALUES
(1, 1, 1, 1, '2026-05-01'),
(2, 1, 2, 2, '2026-05-02'),
(3, 2, 3, 1, '2026-05-03'),
(4, 3, 2, 3, '2026-05-04');

SELECT * FROM customers;

SELECT * FROM customers WHERE city = "Chennai";

SELECT * FROM products ORDER BY price DESC;

SELECT customer_id, SUM(quantity) AS total_items
FROM orders
GROUP BY customer_id;

SELECT customer_id, SUM(quantity) AS total_items
FROM orders
GROUP BY customer_id
HAVING total_items > 1;

SELECT c.name, p.product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;