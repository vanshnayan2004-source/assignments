--question-1) Execute a literal select statement that returns your name.
select 'vansh' as name
-- Question-2) Write the literal select statement that evaluates the product of 7 and 4.
select  
product (7*4)
--Question-3) Write the literal select statement that takes the difference of 7 and 4 then multiplies
--that difference by 8.
select
product(7-4)*8
--question-4) Write a literal select statement that returns the phrase “Brewster’s SQL Training
--Class”. (Hint: note the single apostrophe in the string).
select 
'Brewster`s SQL Training Class' as statement
--question-5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one
--column and the result of 5*3 in another column.
select 'Day 1 of Training'as statement,
5*3 as product
--question-6)Insert a new employee record with all details provided directly.
create database assignment
 
 use assignment

 create table employee
 (EID Int,
 EName varchar(20),
 Eage Int,
 Edepartment varchar(20),
 Esalary money)

 select * from employee

 insert into employee values
 (01,'Rajesh',28,'AI',35000)

 --question-7)Add multiple new team members to the HR department at once.
 insert into employee values
 (02,'Ramesh',35,'HR',30000),
 (03,'Suresh',34,'HR',30000),
 (04,'Raju',35,'HR',300000),
 (05,'Kamlesh',34,'HR',30000)

--question-8)Register an employee who hasn't been assigned a salary yet.
insert into employee (EID,EName,Eage,Edepartment)  values
(06,'vansh',23,'intern')

select * from employee


--question-9)Update the salary to 85,000 for everyone working in the 'Cloud' department.
insert into employee values
(07,'mihir',23,'cloud',25000),
(08,'jay',24,'cloud',24000)

update employee 
set Esalary = 85000
WHERE Edepartment = 'cloud'

--question-10)Change both the department and salary for a specific employee by name.

update employee
set Edepartment = 'developer',
Esalary = 25000
where EName = 'vansh'

--question-11)Give a flat 10% appraisal boost to employee working in AI department.
update employee
set Esalary = Esalary * 0.10
Where Edepartment = 'AI'

select * from employee

--question-12)Assign an initial entry-level salary of 30,000 to anyone whose salary column is
--completely blank (NULL).
insert into employee(EID,EName,Eage,Edepartment) values
(09,'Varun',23,'data analytics')

update employee
set Esalary = 30000
Where Esalary is NULL

--question-13)Remove a specific employee from the system using their unique ID.

delete  from employee
Where EID = 07

--question-14)Remove all records belonging to a department that has been completely shut down.

delete from employee
where Edepartment = 'Cloud'

--question-15).Drop records of any employee earning less than 20,000 in the Finance division.

insert employee values
(10,'neel',23,'Finance',20000),
(11,'aryan',23,'Finance',18000)

delete from employee
where Edepartment = 'finance'
AND Esalary < 20000