create database assignement 2


create table employ
(empID int,
name varchar(30),
Department varchar(30),
Salary money,
bonus money,
experience varchar (20),
city varchar (20))

insert into employ values
(01,'vansh','full stack',55000,5000,'4 years','Bharuch'),
(02,'mihir','cloud',40000,5000,'3 years','Surat'),
(03,'varun','AI',60000,5000,'5 years','Vadodara'),
(04,'neel','data analytics',35000,5000,'4 years','Bharuch'),
(05,'Jay','QA testing',40000,5000,'4 years','baroda'),
(06,'sujal','IT',60000,5000,'4 years','padra')

--1. Write a query to display all employees whose salary is greater than 50,000.
select * from employ
where salary > 50000

--2.Retrieve employees who work in the IT department and have more than 5 years of
--experience.
 select * from employ
 where experience = '5 years'

 --3. Write a query to display employees whose salary is between 45,000 and 60,000.
 select * from employ
 where salary between 45000 and 60000

 --4. Display employees whose city is either Mumbai or Delhi.
 update employ
 set city = 'mumbai'
 where name = 'Vansh'

 select * from employ
 where city = 'mumbai'

 --5. Write a query to display employee name along with their annual income

 select Name as 'Name',(salary * 12) as 'Annunal income' from employ
 
 
 --6.Find employees whose name starts with the letter 'A'.
 
 select * from employ
 where name like 'A%'

--7.Find the highest salary among all employees.

select Max (salary) from employ

--8. Find the total bonus paid to employees in the IT department.

insert into employ values
(07,'alex','IT',60000,5000,'4 years','delhi'),
(08,'john','IT',60000,5000,'4 years','daman'),
(09,'lucas','IT',60000,5000,'5 years','new york')

select sum(bonus) as 'total bonus' from employ
where department = 'IT'

--9. Display the minimum and maximum experience of employees.
select max (experience) as maximum, min (experience) as minimum from employ

--10.Count the number of employees in each department.
select  department , count(*) as employ_count from employ
group by department


--11. Find the total bonus paid to employees in the IT department.
select sum(bonus) as 'total bonus' from employ
where department = 'IT'

--12. Write an SQL statement to add a new column named Email of type VARCHAR(100)
--to the Employees table.

alter table employ
add emailID varchar(100)

select * from employ

--13. Write an SQL statement to modify the Salary column so that it becomes
--DECIMAL(10,2).
alter table employ
alter column salary decimal(10,2)
sp_help employ

--14. Write an SQL statement to drop the Bonus column from the Employees table.

alter table employ
drop column bonus