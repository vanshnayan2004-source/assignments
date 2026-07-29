 create database jointedassignment

 use jointedassignment
 
--1. Create the two tables shown above and complete the queries listed below.
CREATE TABLE Departments
( department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL,
    budget DECIMAL(12,2) CHECK (budget >= 0))
--2. Also add appropriate constraints to both tables.
CREATE TABLE Employee
( emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department_id INT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    join_date DATE NOT NULL,
    manager_id INT NULL,

    CONSTRAINT FK_Employee_Department
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id),

    CONSTRAINT FK_Employee_Manager
    FOREIGN KEY (manager_id)
    REFERENCES Employee(emp_id))

    INSERT INTO Departments VALUES
(1,'HR','Delhi',2000000),
(2,'IT','Mumbai',3500000),
(3,'Finance','Pune',2500000),
(4,'Sales','Ahmedabad',1800000),
(5,'AI','Bangalore',5000000)

INSERT INTO Employee VALUES
(101,'Amit',1,'HR Executive',30000,'2022-01-15',NULL),
(102,'Neha',2,'Developer',60000,'2021-05-10',101),
(103,'Rahul',2,'Tester',45000,'2023-03-12',102),
(104,'Priya',3,'Accountant',50000,'2020-11-20',101),
(105,'Rohan',NULL,'Intern',20000,'2024-01-10',102),
(106,'Sneha',5,'AI Engineer',80000,'2021-09-25',101)

select * from Employee
select * from Departments
--1. Display the employee name along with the name of the department they belong to.
SELECT e.emp_name,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--2. List all employees along with their department, including employees who are not
--currently assigned to any department.
SELECT e.emp_name,d.department_name
from Employee e
left join Departments d
on e.department_id = d.department_id
--3. Show all department names along with the names of employees working in them,
--including departments that currently have no employees.
SELECT d.department_name,e.emp_name
FROM Employee e
RIGHT JOIN Departments d
ON e.department_id=d.department_id
--4. Display emp_name, designation, and department_name for employees who are
--assigned to a valid department.
SELECT e.emp_name,e.designation,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--5. Show the department_name, location, and emp_name for every department, even if no
--employee currently works there.
SELECT d.department_name,d.location,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--6. Display emp_name and department_name for every employee, even those without a
--department (show department as blank/null in that case).
SELECT e.emp_name, d.department_name
from Employee e
left join Departments d 
ON e.department_id = d.department_id 
 --7. List emp_name, salary, and department_name only for employees whose department
--actually exists in the Departments table.
SELECT e.emp_name,e.salary,d.department_name
from Employee e
inner join Departments d
ON e.department_id = d.department_id
--8. Show department_name and budget along with emp_name and salary, ensuring all
--departments are shown even the ones without staff.
    SELECT d.department_name,d.budget,e.emp_name,e.salary
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id

--9. Display the full list of employees with their department_name, making sure no employee
--is left out of the result even without a department.
SELECT e.*,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--10. List emp_name, designation, and location of the department for employees who have a
--department assigned.
SELECT e.emp_name,e.designation,d.location
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--11. Show all departments and the count-relevant employee names in them, keeping every
--department visible even if empty.
SELECT d.department_name,
COUNT(e.emp_id) AS TotalEmployees
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
GROUP BY d.department_name
--12. Display emp_name, join_date, and department_name for employees who joined a
--department.
SELECT e.emp_name,e.join_date,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--13. List every department along with emp_name and salary, ensuring departments with
--zero employees still appear with blank employee details.
SELECT d.department_name,e.emp_name,e.salary
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--14. Show emp_name and department_name for employees, and make sure every
--employee appears in the output regardless of department status.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--15. Display emp_name, department_name, and budget for employees working in
--departments with a budget greater than 2,000,000.
SELECT e.emp_name,d.department_name,d.budget
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
WHERE d.budget>2000000
--16. List department_name and location for every department, along with emp_name of
--employees there, keeping all departments visible.
SELECT d.department_name,d.location,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--17. Show emp_name, designation, and department_name for employees, excluding those
--without an assigned department.
SELECT e.emp_name,e.designation,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--18. Display all employees and their respective department location, including employees
--without a department.
SELECT e.emp_name,d.location
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--19. List department_name for all departments and emp_name of employees, ensuring
--unmatched departments (no staff) are still shown.
SELECT d.department_name,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--20. Show emp_name and salary for employees along with their department_name, only
--where a genuine department match exists.
SELECT e.emp_name,e.salary,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--21. Display emp_name, manager_id, and department_name for employees who belong to
--some department.
SELECT e.emp_name,e.manager_id,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--22. List all departments with their budget and emp_name of any employees, keeping
--departments with no staff visible in the result.
SELECT d.department_name,d.budget,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--23. Show emp_name for every employee together with department_name, ensuring the full
--employee list is retained even without a department match.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--24. Display department_name, location, and emp_name only where the employee record
--is properly linked to a department.
SELECT d.department_name,d.location,e.emp_name
FROM Departments d
INNER JOIN Employee e
ON d.department_id=e.department_id
--25. List every department along with emp_name and designation, so that departments
--without employees still show up with empty employee fields.
SELECT d.department_name,e.emp_name,e.designation
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--26. Show emp_name, department_name, and join_date only for employees who have valid
--department information.
SELECT e.emp_name,d.department_name,e.join_date
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--27. Display all employees with department_name, and ensure employees having a NULL
--department are still part of the result.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--28. List department_name and budget for all departments and the emp_name working
--there, making sure departments without employees are not excluded.
SELECT d.department_name,d.budget,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--29. Show emp_name and salary for employees who are linked to a department that has a
--budget above 3,000,000.
SELECT e.emp_name,e.salary
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
WHERE d.budget>3000000
--30. Display the full employee list along with department_name, location, so no employee is
--missing from the output.
SELECT e.*,d.department_name,d.location
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--31. List all departments and emp_name of staff, ensuring departments like ones with no
--current employees still show in the result.
SELECT d.department_name,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id;
--32. Show emp_name, designation, and department_name where the department
--information genuinely matches between both tables.
SELECT e.emp_name,e.designation,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--33. Display department_name, budget, and emp_name for departments, keeping every
--department in the output even without matching employees.
SELECT d.department_name,d.budget,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--34. List emp_name and department_name for employees, retaining every single employee
--row even if their department is missing.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--35. Show emp_name, salary, and department_name only for employees whose
--department_id correctly matches a department record.
SELECT e.emp_name,e.salary,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--36. Display all department details along with any assigned employees, so unmatched
--departments (no employees) still appear.
SELECT d.*,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--37. List emp_name and department_name for employees who have a proper, existing
--department assigned to them.
SELECT e.emp_name,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--38. Show every employee's emp_name and department_name, ensuring the complete
--employee list shows up regardless of department availability.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--39. Display department_name, location, and emp_name, keeping all departments in the
--result even those without any employee.
SELECT d.department_name,d.location,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--40. List emp_name, designation, and department_name for employees, only including
--cases with a genuine department match.
SELECT e.emp_name,e.designation,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--41. Show all employees with emp_name and department_name, including those
--employees whose department_id is missing.
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--42. Display department_name and emp_name for all departments, retaining every
--department row even if there's no employee to match.
SELECT d.department_name,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--43. List emp_name, salary, and department_name for employees, only when both
--employee and department data align.
SELECT e.emp_name,e.salary,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--44. Show the complete list of employees along with department_name, so that unmatched
--employees (no department) are not dropped.
SELECT e.*,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--45. Display all departments along with emp_name, location, and budget, ensuring
--departments with no employees are still listed.
SELECT d.department_name,d.location,d.budget,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--46. List emp_name and department_name only for employees who are properly linked to
--an existing department record.
SELECT e.emp_name,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--47. Show emp_name, designation, and department_name for every employee, keeping the
--full employee list intact even without department data.
SELECT e.emp_name,e.designation,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id;
--48. Display department_name, budget, and emp_name for every department, making sure
--departments without any employee still appear in the output.
SELECT d.department_name,d.budget,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
--49. List emp_name and department_name for employees where the department match is
--valid on both sides.
SELECT e.emp_name,d.department_name
FROM Employee e
INNER JOIN Departments d
ON e.department_id=d.department_id
--50. Show all employees and all departments together with emp_name and
--department_name, keeping every department visible even without staff, and every
--employee visible even without a department (attempt this with two separate queries: one
--keeping all employees, another keeping all departments).
--a)
SELECT e.emp_name,d.department_name
FROM Employee e
LEFT JOIN Departments d
ON e.department_id=d.department_id
--b)
SELECT d.department_name,e.emp_name
FROM Departments d
LEFT JOIN Employee e
ON d.department_id=e.department_id
