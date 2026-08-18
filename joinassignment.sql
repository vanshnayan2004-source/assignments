create database joinsassignment
use joinsassignment

create table employee
(EID int primary key,
Ename varchar(20),
DID int ,
ManagerName varchar (20))




drop table employee

insert into employee values
(01,'suresh',101,'mahesh'),
(02,'ramesh',102,'tarun'),
(03,'kamlesh',103,'keshav'),
(04,'kush',102,'sujal'),
(05,'jay',104,'rudra')

create table department
(DID int primary key ,
Dname varchar(20),
doj date,
location varchar(20))
drop table department

insert into department values
(101,'IT','2022-10-10','vadodara'),
(102,'AI','2023-08-09','surat'),
(103,'Finance','2024-09-09','mumbai'),
(104,'BA','2020-12-04','delhi')

drop table salary

create table salary
(EID int foreign key references employee (EID),
DID int foreign key references department (DID),
basesalary decimal(10,2),
bonus decimal(10,2))

insert into salary values 
(01,101,20000,2500),
(02,102,25000,2000),
(03,103,30000,3000),
(04,104,35000,4000)

select * from employee
select * from department
select * from salary

--Question 1
--Write a query to calculate the total compensation paid (BasicSalary + Bonus) across all
--payouts for each department. Display the DeptName, Location, and the total expenditure
--aliased as TotalExpenditure.
select d.Dname,d.location,sum(basesalary + bonus) as totalexpenditure
from department d
join employee e
 on d.DID = e.DID
 join salary s
 on s.DID = d.DID
 group by d.Dname,
 d.location
--Question 2
--Write a query to display all employee names (EName), their date of joining (DOJ), and their
--deptName. Ensure that employees who are not assigned to any department are included in
--the result, displaying 'Unassigned' for their department name.
select e.Ename,d.doj,isnull (d.Dname,'Unassigned') as Dname 
from employee e
left join department d
on e.DID = d.DID
  
--Question 3
--Write a query to display every employee's name (EmployeeName), their assigned
--department's name (DeptName), and their manager's name (ManagerName). Exclude
--employees who do not have a manager.
SELECT 
    e.EName,
    d.Dname,
    e.Managername
FROM Employee e
INNER JOIN Department d
    ON e.DID = d.DID
--Question 4
--Find all departments where the average total compensation (BasicSalary + Bonus) exceeds
--₹60,000. Display DeptName, Location
select d.Dname,d.location,sum(s.basesalary + s.bonus) as totalcompensation
from department d
inner join salary s
on d.DID = s.DID
group by d.DName,s.DID,d.location
having avg (s.basesalary + s.bonus) > 60000
  
--Question 5
--Write a query to display the DeptID, DeptName, and Location of all departments that
--currently have no employees assigned to them.
select d.DID,d.Dname,d.Location
from department d
left join employee e
on d.DID = e.DID
where e.EID is null
--Question 6
--Retrieve the EName, DeptName, BasicSalary, and Bonus of all employees whose
--department is located in either 'Vadodara' or 'Mumbai' and whose BasicSalary is greater
--than ₹40,000. Sort the results by BasicSalary in descending order.
select e.Ename,d.Dname,s.basesalary,s.bonus
from employee e
inner join department d
on e.DID = d.DID
inner join salary s
on e.DID = s.DID
where d.location IN ('vadodara','Mumbai')
and s.basesalary > 40000
order by s.basesalary desc

--Question 7
--Find all pairs of employees who belong to the exact same department. Display DeptName,
--Employee_1, and Employee_2. Ensure an employee is not paired with themselves and
--eliminate duplicate reverse pairs.
select e1.Ename , e2.Ename,d.Dname
from employee e1
inner join employee e2
on e1.DID = e2.DID
inner join department d
on e1.DID = d.DID
--Question 8
--Write a query using a full reconciliation approach to list all EName, DeptName, and
--BasicSalary. The output must include employees without departments, departments
--without employees, and employees without salary records.
select e.Ename,d.Dname,s.basesalary
from employee e
full outer join department d
on e.DID = d.DID
left join salary s
on e.DID = s.DID
--Question 9
--Write a query to find all employees who earn a higher BasicSalary than the average
--BasicSalary of their own department. Display EName, DeptName, and BasicSalary.
select 
    e1.Ename,
    d.DName,
    s1.basesalary
    from employee e1
inner join department d
    on e1.DID = d.DID
inner join  salary s1
    on e1.EID = s1.EID
inner join  employee e2
    on e1.DID = e2.DID
inner join salary s2
    on e2.EID = s2.EID
group by 
    e1.EID,
    e1.EName,
    d.DName,
    s1.basesalary
having s1.basesalary > AVG(s2.basesalary)


