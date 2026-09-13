create database sql_join_practise;
use sql_join_practise;

CREATE  table Department (department_id int primary key,department_name varchar(255)  not null,location varchar(255));


insert into Department (department_id,department_name,location) values 

(1, 'IT', 'Bangalore'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Chennai'),
(5, 'Operations', 'Hyderabad'),
(6, 'Sales', 'Pune');

select * from Department;

CREATE TABLE employees (emp_id int primary key ,first_name varchar(50) not null,
last_name varchar(50) not null,email varchar(45) unique,salary decimal(10,2),hire_date date,department_id int,manager_id int,status varchar(20) default 'Active',
  FOREIGN KEY (department_id)
        REFERENCES department(department_id)
        );
        
        
INSERT INTO employees
(emp_id, first_name, last_name, email, salary, hire_date, department_id, manager_id, status)
VALUES
(101, 'Arun', 'Kumar', 'arun@email.com', 55000, '2022-01-15', 1, NULL, 'Active'),
(102, 'Priya', 'Sharma', 'priya@email.com', 60000, '2022-03-10', 2, NULL, 'Active'),
(103, 'Rahul', 'Verma', 'rahul@email.com', 65000, '2023-08-20', 1, 101, 'Active'),
(104, 'Sneha', 'Patel', 'sneha@email.com', 70000, '2023-01-04', 3, NULL, 'Active'),
(105, 'Vikram', 'Singh', 'vikram@email.com', 48000, '2024-02-12', 4, NULL, 'Active'),
(106, 'Anjali', 'Rao', 'anjali@email.com', 52000, '2024-05-18', 1, 101, 'Active'),
(107, 'Kiran', 'Das', 'kiran@email.com', 45000, '2024-07-25', 5, NULL, 'Active'),
(108, 'Meena', 'Iyer', 'meena@email.com', 58000, '2025-01-10', NULL, NULL, 'Active'),
(109, 'Ravi', 'Nair', 'ravi@email.com', 62000, '2025-02-15', 6, NULL, 'Inactive'),
(110, 'Pooja', 'Menon', 'pooja@email.com', 50000, '2025-03-20', 1, 103, 'Active');

select * from employees;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects
(project_id, project_name, budget, start_date, end_date)
VALUES
(101, 'Employee Management System', 500000, '2026-01-10', '2026-06-30'),
(102, 'E-Commerce Platform', 750000, '2026-02-15', '2027-01-31'),
(103, 'Data Analytics Dashboard', 400000, '2025-08-01', '2026-03-31'),
(104, 'Mobile Banking Application', 900000, '2023-01-01', '2024-12-31'),
(105, 'AI Recommendation System', 850000, '2026-04-01', '2027-03-31');

select * from projects;


CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    assigned_date DATE,

    PRIMARY KEY (emp_id, project_id),

    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id),

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
);


INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(101, 101, '2026-01-15'),
(101, 102, '2026-02-20'),
(103, 101, '2026-01-20'),
(103, 103, '2025-08-10'),
(104, 104, '2023-01-15'),
(105, 102, '2026-03-01'),
(106, 103, '2025-09-01'),
(107, 105, '2026-04-05'),
(109, 104, '2023-02-01');



select * from employee_projects;


select first_name,last_name ,department_name from employees e inner join  Department d on e.department_id =d.department_id;

select first_name,last_name ,department_name  from employees e left join Department d on e.department_id =d.department_id;


-- 3. Display all departments and the employees working in each department.

select e.first_name,e.last_name,d.department_name from department d left join employees e on e.department_id=d.department_id;

-- 4. Display employees who work in the IT department.

select e.first_name,e.last_name from employees e left join Department d on e.department_id =d.department_id where d.department_name="IT";

-- 5. Display employees along with their department location.

select e.* ,d.location ,d.department_name from employees e inner join Department d on e.department_id=d.department_id;