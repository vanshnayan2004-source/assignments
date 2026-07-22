create database assignment

create table employeee
(EID int,
Ename varchar(20),
Department varchar(20),
salary money)

insert into employeee values
(1,'vansh','AI',35000),
(2,'alex','AI',35000),
(3,'john','Cloud',35000),
(4,'herry','Cloud',40000),
(5,'henry','IT',45000)

select *from employeee

--1. Write a query to display each Department and the total number of employees
--working in that department from the Employee table.


select Department,count (EID) as totalemployes
from employeee
group by Department

--2. Write a query to find the Department, the highest salary (MAX), and the
--average salary (AVG) for each department.

Select department , max(salary) as highestsalary, avg (salary) as averagesalary
from employeee
group by department

--3. Write a query to count how many employees are in each Department.

select Department,count (EID) as totalemployes
from employeee
group by Department

--4. Write a query to find the minimum salary in each Department

select department , min (salary) as minimumsalary
from employeee
group by department

--5. Write a query to show departments that have more than 2 employees

select department , count(department) as moreemployes
from employeee
group by department
having count (department) > 1

--6. Write a query to show departments where the total salary payout is greater
--than 100,000.

insert into employeee values
(6,'vikram','full stack', 200000),
(7,'rolex','cybersecurity',300000),
(8,'karan','software dev',500000)

select * from employeee

select department, max (salary) as salarypayout
from employeee
group by department
having min(salary) >100000

--7. Write a query to find departments where the average salary is above 60,000

insert into employeee values
(9,'leo','mern stack', 70000),
(10,'parthiban','data science',80000),
(11,'harold','business analyst',75000)

select * from employeee
select department, avg (salary) as averagesalary
from employeee
group by department
having avg (salary) > 60000

--8. Write a query to show departments that have exactly 1 employee

select department, count(department) as oneemployee
from employeee
group by department
having count (department) = 1 

--9. Write a query to list all employees sorted by Salary from highest to lowest

select *from employeee
order by salary DESC

--10.Write a query to list all employees sorted by Ename in alphabetical order
select * from employeee
order by Ename


-- 11.Write a query to list all employees sorted by Department alphabetically, and
-- then by Ename alphabetically.

select  * from employeee
order by department,Ename


