CREATE DATABASE Ecommerce;

show databases;

use Ecommerce;

-- =========================================
-- 1. CUSTOMERS TABLE
-- =========================================

create table customers (
customer_id int primary key,
customer_name varchar(255),
city varchar(255),
country varchar(100)
);

insert into customers values
(1, 'Arjun', 'Bangalore', 'India'),
(2, 'Priya', 'Mumbai', 'India'),
(3, 'Rahul', 'Delhi', 'India'),
(4, 'Sneha', 'Hyderabad', 'India'),
(5, 'John', 'London', 'UK');


select * from customers;



-- =========================================
-- 2. PRODUCTS TABLE
-- =========================================

create table products ( 
product_id int primary key,
product_name varchar(100),
categorey varchar(200),
price decimal(10,2));

insert into products values
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mouse', 'Electronics', 1000),
(103, 'Keyboard', 'Electronics', 2000),
(104, 'Chair', 'Furniture', 8000),
(105, 'Desk', 'Furniture', 12000);

select * from products;

-- =========================================
-- 3. ORDERS TABLE
-- =========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


-- Insert Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(1001, 1, '2025-01-10', 61000),
(1002, 2, '2025-01-15', 1000),
(1003, 1, '2025-02-05', 12000),
(1004, 3, '2025-02-10', 8000),
(1005, 4, '2025-03-01', 62000);
select * from orders;


-- =========================================
-- 4. ORDER_ITEMS TABLE
-- =========================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- Insert Order Items
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 1),
(3, 1002, 102, 1),
(4, 1003, 105, 1),
(5, 1004, 104, 1),
(6, 1005, 101, 1);

select * from order_items;


-- =========================================
-- 5. EMPLOYEES TABLE
-- =========================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);


-- Insert Employees
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(1, 'Amit', 'IT', 70000),
(2, 'Neha', 'HR', 50000),
(3, 'Ravi', 'IT', 80000),
(4, 'Pooja', 'Finance', 65000),
(5, 'Kiran', 'IT', 75000);


select * from employees;
#1. Display all customers

select * from customers;

#2. Find all Electronics products
select * from products where categorey="Electronics";

#3. Find employees earning more than 60,000
select * from employees where Salary > 60000;
#4. Find the average salary
select AVG(salary) as avg_salary from employees;
#5. Find the highest salary

select MAX(salary) as highest_salary from employees;

#6. Find number of customers by country

select country, count(*) as no_of_customers from customers group by country;

