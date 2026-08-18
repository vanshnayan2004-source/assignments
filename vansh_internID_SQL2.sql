create database joinsassessment
use joinsassessment

 create table Employee 
 (EID int,
EmpName  varchar (20), 
DeptID int, 
Salary money, 
DOJ date)

insert into Employee values
(1,'vansh',101,50000,'2020-12-02'),
(2,'sujal',102,45000,'2021-10-10'),
(3,'kush',103,50000,'2021-10-10'),
(4,'rudra',104,45000,'2023-10-18'),
(5,'jay',105,65000,'2020-10-19'),
(6,'vraj',106,35000,'2023-09-09')

create table Department 
(DeptID int, 
Deptname varchar(20), 
location varchar(20))

insert into Department values
(101,'IT','vadodara'),
(102,'AI','surat'),
(103,'finance','bharuch'),
(104,'HR','vapi'),
(105,'QA','navsari'),
(106,'DA','ahmedabad')

create table Manager 
(ManagerID int, 
EID int, 
DeptID int)

insert into manager values
(401,1,101),
(402,2,102),
(403,3,103),
(404,4,104),
(405,5,105),
(406,6,106)

 create table Project 
 (ProjectID int, 
 Pname varchar (20), 
 DeptID int, 
 Status varchar(20))

 drop table Project
 insert into project values
 (501,'data visual',101,'active'),
 (502,'data mining',102,'closed'),
 (503,'app develop',103,'active'),
 (504,'web develop',105,'active'),
 (505,'software develop',106,'active'),
 (506,'web develop',104,'active')

 select * from Employee
 select * from Department
 select * from Manager
 select * from project

--1.Retrieve every employee's name along with their department name.
select E.EmpName,E.EID,D.DeptiD,D.DEPtname
from Employee E
inner join Department D
on E.DeptID = D.DeptID
--2.Display the EmpName, Salary, and Location of all employees whose department is located in 'Vadodara'.
select e.EmpName,e.Salary,d.location 
from Employee e
inner join Department d
on e.DeptID = d.DeptID
where d.location = 'vadodara'
--3.Find employees who are not working on any Projects.
insert into Employee values
(7,'raj',107,35000,'2023-09-09')

select e.EID,e.EmpName,p.ProjectID
from Employee e
full join  Project p
on e.DeptID = p.DeptID
where p.projectID is null

--4.Retrieve the employee name (EmpName) of each manager and the department (DeptName) they manage.
select e.EID,e.EmpName,d.DeptName,m.ManagerID
from Employee e
inner join Department d
on e.DeptID = d.DeptID
inner join manager m 
on e.EID = m.EID
---5.Display the ProjectName, Status, and department location (Location) for all projects with a status of 'Active'.
select p.Pname,p.status,d.location
from project p
inner join Department d
on p.DeptID = d.DeptID
where p.status = 'active'
--6.Display each department name (DeptName) and the total number of employees working in it.
select d.DeptName,count(e.EID) as totalEMPs
from Department d
inner join Employee e
on d.DeptID = e.DeptID
group by d.Deptname
--7.Display all department names (DeptName) that do not have any projects assigned to them.
insert into Department values
(107,'sales','vadodara')

select d.DeptName,p.Pname
from Department d
left join project p
on d.DeptID = p.DeptID
--8.Display the employee name (EmpName), their department name (DeptName), and the name of the project (ProjectName) assigned to that department.
select e.EmpName,d.DeptName,p.pname 
from Employee e
inner join Department d
on e.DeptID = d.DeptID
inner join project p
on e.DeptID = p.DeptID 
--9.List the EmpName, Salary, and DeptName for employees earning a salary greater than ₹50,000. Sort the results by salary from highest to lowest.
select e.EmpName,e.Salary,d.DeptName
from Employee e
inner join Department d
on e.DeptID = d.DeptID
where e.Salary > 50000
order by e.Salary desc
