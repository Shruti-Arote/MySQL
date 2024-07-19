show databases;
use sql_intro;
show tables;

create table employees (Emp_Id int primary key, Emp_name varchar(25), Age int, Gender char(1), Doj date, 
Dept varchar(20), City varchar(15), Salary float);

describe employees;

insert into employees values
(101, "Jimmy", 35, "M", "2005-05-30", "Sales", "Chicago", 7000),
(102, "Shruti", 32, "F", "2001-06-23", "Marketing", "Pune", 20000),
(103, "Snehal", 37, "F", "1999-09-17", "HR", "Mumbai", 25000),
(104, "Saurabh", 29, "M", "2009-07-19", "Finance", "Mumbai", 30000),
(105, "Sahil", 25, "M", "2010-05-27", "Tech", "Bangalore", 15000),
(106, "Varun", 34, "M", "1995-12-11", "IT", "Pune", 35000),
(107, "Vedant", 40, "M", "1994-04-23", "Product", "Delhi", 40000),
(108, "Shivangi", 28, "F", "2012-03-09", "Sales", "UP", 30000),
(109, "Arpita", 32, "F", "1998-02-07", "HR", "UP", 24000),
(110, "Sudhanshu", 36, "M", "2004-07-05", "Marketing", "Pune", 60000),
(111, "Siddhesh", 40, "M", "2000-08-29", "Fianance", "Mumbai", 17000),
(112, "Jatin", 29, "M", "1997-03-21", "Tech", "Bangalore", 26000),
(113, "Vaishnavi", 34, "F", "2014-09-06", "Finance", "UP", 17000);

select * from employees;

select distinct Dept from employees;

select avg(Age) from employees; # avg age of all employees

# avg age of employees in each department
select dept, round(avg(Age)) as avg_age from employees 
group by dept;

# total salary of employees in each department
select dept, sum(salary) as total_salary from employees group by dept;

# order by clause along with the group by clause
# to find the number of employees in each city and group it in order of employee id
select count(Emp_Id), City from employees 
group by City 
order by count(Emp_Id) desc;

# we want to find the number of employees that joins the company each year
# year functions:-
select year(doj) as year, count(emp_id)
from employees
group by year(doj);

# use group by to join the one or more tables together
create table sales (product_id int, sell_price float,quantity int, stat varchar(20));

# insert values to the sales table
insert into sales values 
(121, 320.0, 3, 'Califormia'),
(121, 320.0, 6, 'Texas'),
(121, 320.0, 4, 'Alaska'),
(123, 290.0, 2, 'Texas'),
(123, 290.0, 7, 'Calfornia'),
(123, 290.0, 4, 'Washington'),
(121, 320.0, 7, 'Ohio'),
(121, 320.0, 2, 'Arizona'),
(123, 290.00, 8, 'Colorado');

select * from sales;   # to see the all columns from the table

# suppose we want to find the revenue for both the product ids
# revenue = sell_price * quantity
select product_id, sum(sell_price * quantity) as revenue
from sales group by product_id;

# want to find the total profit that was made from both products
# create another table that have the cost price of both the products
create table c_product (product_id int, cost_price float);

insert into c_product values
(121, 270.0),
(123, 250.0);

# join sales table and product cost table
# here c and s are alias name
select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit
from sales as s inner join c_product as c
where s.product_id = c.product_id
group by c.product_id;

# Having Clause in SQL :-
# The having clause in sql operates on grouped records and returns rows where aggregate function results 
# matched with given conditions only
# syntax:- select col_name
#          from table_name
#          where cond
#          group by col_name
#          having cond
#          order by col_name
# note :-  hwre claue and having clause are similar but where clause cannot be used with aggregate function

# Find the cities where there are more than 2 employees from employee table
select count(emp_id), city
from employees group by city
having count(emp_id) > 2;

# suppose we want to find the departments where avg salary is greater than 25000 
select  * from employees;

select dept, avg(salary) as avg_salary
from employees
group by dept
having avg(salary) > 25000;

# find the cities where the total salary is greater than 70000
select city, sum(salary) as total
from employees
group by city
having sum(salary) > 70000;

# suppose want to find the department having more than 1 employees
select dept, count(*) as emp_count
from employees
group by dept
having count(*) > 1;

# we can also use the where clause along with the having clause in sql
# suppose we want to find out the cities that having more than 2 employees apart from Delhi
select city, count(*) as emp_count
from employees 
where city != "Delhi"
group by city
having count(*)>1;

# we can also use aggregate function in having clause that does not appear in the select clause
# if we want to find the total number of employees in each department that have the avg salary greater than 20000
select dept, count(*) as emp_count
from employees
group by dept
having avg(salary) > 20000;


