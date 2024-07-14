show databases;
use mysql;
show tables;
select * from engine_cost;
describe engine_cost;
create database sql_intro;
show databases;
use sql_intro;
show databases;
use sys;

create table emp_details (Name varchar(25), Age int, sex char(1), doj date, city varchar(15), salary float);

describe emp_details;  # display the structure of the table

insert into emp_details values("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
("Marry", 28, "F", "2009-03-10", "Boston", 62000),
("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
("Sara", 32, "F", "2017-10-27", "New York", 72000),
("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

select * from emp_details;  # * means all columns from table

# To print only unique values
select distinct city from emp_details;


# to count total number of employees
select count(name) from emp_details;

# we did not give name to the new colum which is showing count of emp which is 6. hence we can use alias name whichever we want
select count(name) as count_name from emp_details;

# want to find sum of the salary 
select sum(salary) from emp_details;

# avarage salary
select avg(salary) as avg_salary from emp_details;

# select specific columns from the table by using the column name in the select statement
select name, age, city from emp_details;

# "where" clause to filter rows based on the perticular condition
# if we want to find the emps whose age is greater than 30
select * from emp_details where age > 30;

# if we want to find only female emps from the table
select name, sex, city from emp_details where sex = 'F';

# want to find the details of the empl who belongs to chicago and austin
# or - display the record if any of the condition become true
select * from emp_details where city = 'chicago' or city = 'Austin';

# another way to write same sql query
# we can use 'in' operator to specify multiple conditions
select * from emp_details where city in ('Chicago', 'Austin');

# 'between' operator that selects values within the given range, values can be numbers, texts or dates
# if you want to find the emp whose date of joining is between the
select * from emp_details where doj between '2000-01-01' and '2010-12-31';


# in where clause we can use the 'and' operator to specify the conditions, 'and' operator displays the record if all the confitions seperated by 'and' are true
select * from emp_details where age>30 and sex='M';

# groupby statement :- it groups rows that have same values in summary roles 
# e.g:- we wnat to find the average salary of customers in each department
# groupby statement is often used with the agreegate functions like count, sum and avg to group the result stat into one or more columns
# if we want to find the total salary of empl based on the gender
select sex, sum(salary) as total_salary from emp_details group by sex;

# order by keyword to sort the result set in ascending and decending order
# this keyword sort the records in ascending order by default
# to sort the record in decending order use 'desc' keyword
# if want to sort the table in terms of salary
select * from emp_details order by salary;

# basic operations
select (10+30) as addition;
 
 select (10-20) as substraction;
 
 # some inbuild functions
 select length('India') as total_len;
 
 select repeat('@', 10);   # it will print @ for 10 times
 
 # to convert the string in uppercase or lowercase
 select upper('india');
 
 select lower('INDIA');
 
 #date and time function
 select curdate();  # display year,month and date
 
 select day(curdate());   # display only day from the date in numeric form
 
 select now();  # display current date and time
 
 # string functions:
 # to convert the string into uppercase
 select upper('India') as upper_case;
 select lower('INDIA') as lower_case;
 select lcase('INDIA') as lower_case;  # lcase is similar to lower 
 
 #  character_length function :- to find the lenghth of the string 
 select character_length('India') as total_length;
 
 # we can apply this functions on the tables
  select set_time, character_length(set_time) as total_len from sys_config;
  # we can also use function char_length in the same way
  
  # concat function:-
  select concat("India", " is", " in Asia") as merged;
  
  # perfom this on table 
  select set_by, set_time, concat(set_by, " ", variable) as abc from sys_config;
  
  # reverse function :- 
  select reverse("India");
  
  select reverse(set_time) from sys_config;
  
  # replace function :- it replaces all occurrences of substrings within a string within a new substring
  select replace("orange is a vegetable", "vegetable", "Fruit"); # it will replace the word vegetable with the word fruit
  
  # trim function
  # 1. left trim or ltrim:
  select length("      India      ");  # output:- 17
  select length(ltrim("      India      ")); # output:-11 ,It deleted the extra spaces from left side only i.e leading spaces
  # rtrim :- trailingspaces
  select length(rtrim("      India "));
  select length(trim("    India   "));  # it will delete both leading and trailing spaces
  
  # position function:- returns the position of the first occurrence of the substring in a string. if substring is not found in original string then the substring will return 0
  select position("fruit" in "orange is a fruit") as name;
  
  # ascii() function :- returns the ascii value for the specific character
  select ascii('a');
  select ascii('4');
  
 
 
 
 


