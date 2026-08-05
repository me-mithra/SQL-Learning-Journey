-- =============================================================
-- Day 02 - Combining Tables with SQL JOINs
-- Database : sql_learning (PostgreSQL)
-- =============================================================

--===============================
--  1.Create the Practice Tables
--===============================

--customer Table

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

--Inserting values into customer table

INSERT INTO customers
VALUES
('C001', 'Rahul', 'Chennai'),
('C002', 'Priya', 'Bangalore'),
('C003', 'Arjun', 'Hyderabad'),
('C004', 'Sneha', 'Chennai'),
('C005', 'Kiran', 'Pune');

--products Table

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price NUMERIC(10,2)
);

--Inserting values into products table

INSERT INTO products
VALUES
('P101', 'Laptop', 'Electronics', 55000),
('P102', 'T-Shirt', 'Clothing', 800),
('P103', 'Face Cream', 'Beauty', 500),
('P104', 'Headphones', 'Electronics', 2000),
('P105', 'Jeans', 'Clothing', 1500);

--sales Table

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--Inserting values into sales table

INSERT INTO sales
VALUES
(1, 'C001', 'P101', 1, '2026-06-01'),
(2, 'C002', 'P102', 2, '2026-06-02'),
(3, 'C001', 'P104', 1, '2026-06-03'),
(4, 'C003', 'P103', 3, '2026-06-04'),
(5, 'C004', 'P105', 2, '2026-06-05'),
(6, 'C002', 'P104', 1, '2026-06-06');

--==============================
--  2. Checking Tables
--==============================

  --customer table
SELECT * FROM customers;

--products tabe
SELECT * FROM products;

--sales table
SELECT * FROM sales;

--========================================================================
-- 3. Primary Key 
-- A primary key uniquely identifies every row
-- Example : In the customers table , customer_id is the primary key
--========================================================================

--==============================================================================
-- 4. Foreign Key
-- A foreign key is a column that refers to the primary key of another table
-- Example : In the sales table , customer_id is a foreign key 
--==============================================================================

--=============================================================================
-- 5.INNER JOIN
-- INNER JOIN returns only records that have a match in both tables
--=============================================================================
  
-- Only customers who have sales will appear
  
SELECT
    sales.sale_id,
    customers.customer_name,
    sales.sale_date
FROM sales
INNER JOIN customers
ON sales.customer_id = customers.customer_id;

--=================================================================================================
-- 6.Table Aliases
-- Table aliases make SQL queries shorter, cleaner, and easier to read.
-- Example : sales AS s / sales s
--==================================================================================================

SELECT
    s.sale_id,
    c.customer_name,
    s.sale_date
FROM sales AS s
INNER JOIN customers AS c
ON s.customer_id = c.customer_id;

--=======================================
-- 7.Joining Sales and Products
--=======================================

SELECT
    s.sale_id,
    p.product_name,
    p.category,
    s.quantity
FROM sales s
INNER JOIN products p
ON s.product_id = p.product_id;

--========================================
-- 8. Joining Three Tables
--========================================

SELECT
    s.sale_id,
    c.customer_name,
    p.product_name,
    p.category,
    s.quantity,
    s.sale_date
FROM sales s
INNER JOIN customers c
ON s.customer_id = c.customer_id
INNER JOIN products p
ON s.product_id = p.product_id;

--===========================================
-- 9.  Calculating the Sale Amount
--===========================================

SELECT
    s.sale_id,
    c.customer_name,
    p.product_name,
    s.quantity,
    p.price,
    s.quantity * p.price AS total_amount
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id;

--===========================================================================
-- 10.  LEFT JOIN
-- All records from the left table + matching records from the right table
--===========================================================================

-- In our data, Kiran has not purchased anything .With INNER JOIN, Kiran will not appear.

-- With LEFT JOIN, Kiran will appear, but sale_id will be NULL.

SELECT
    c.customer_id,
    c.customer_name,
    s.sale_id
FROM customers c
LEFT JOIN sales s
ON c.customer_id = s.customer_id;

--=====================================================
-- 11.Finding Customers Without Sales
--=====================================================

-- Return ony kiran

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN sales s
ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;


--============================================================
-- 12. Filtering After a Join
--============================================================

-- Retrieving all customers who purchased an electronics product

SELECT
    c.customer_name,
    p.product_name,
    p.category
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id
WHERE p.category = 'Electronics';

--  Retrieving all Chennai customers who purchased electronics products

SELECT
    c.customer_name,
    c.city,
    p.product_name,
    s.quantity,
    s.sale_date
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id
WHERE c.city = 'Chennai'
AND p.category = 'Electronics';

-- =========================================================================================
-- 13.RIGHT JOIN
-- Returns all records from the right table and the matching records from the left table.
-- =========================================================================================

SELECT
    c.customer_name,
    s.sale_id
FROM sales s
RIGHT JOIN customers c
ON s.customer_id = c.customer_id;

-- =========================================================================
-- 14.FULL OUTER JOIN
-- Returns all matching records + non-matching records from both tables.
-- =========================================================================

SELECT
    c.customer_name,
    s.sale_id
FROM customers c
FULL OUTER JOIN sales s
ON c.customer_id = s.customer_id;










