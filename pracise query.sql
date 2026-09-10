create database ArshTravels;

Use ArshTravels;

create  table Departments (
department_id int primary key,
department_name varchar(20) not null,
location varchar(25));

create table employees (
emp_id int primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) unique,
salary decimal(10,2) check(salary > 0),
hire_date date,
department_id int,
Status varchar(20) default 'Active',

foreign key (department_id) references
 Departments (department_id)

);

insert into Departments(department_id,department_name,location) values 
(1,'IT','Banglore'),
(2,'HR','Mumbai'),
(3,'Finance','Delhi'),
(4,'Marketing','Chennai');

alter table Departments modify column department_name varchar(100);

select * from Departments;

insert into employees (emp_id,first_name,last_name,email,salary) 
values 
(101,'Rahul','Kumar','rahul@gmail.com',60000),
(102,'Priya','Sharma','priya@gmail.com',75000),
(103,'Amit','Singh','amit@gmail.com',45000),
(104,'Sneha','Rao','sneha@gmail.com',85000),
(105,'Arjun','Das','arjun@gmail.com',55000);


alter table employees add column phone_number int;

alter table employees modify column first_name varchar(100);

update  employees set  salary =70000 where emp_id=101;

update employees set salary =salary *1.10 where  department_id=1;

SET SQL_SAFE_UPDATES = 0;

delete  from Departments where department_name='HR';

select * from employees;

alter table employees rename column phone_number to mobile_number;
delete  from employees where emp_id=105;


create table projects (project_id int primary key,project_name varchar(200) not null,budget decimal(10,2) check (budget > 0),start_date date,end_date date)

select * from projects;



