--1. Create a database for the college records.
CREATE DATABASE CollegeDB
USE CollegeDB
--2. Create the Department table.
CREATE TABLE Department
(DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50))

-- 3. Create the Student table with all required columns.
CREATE TABLE Student
(  RollNo INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Course VARCHAR(50),
    Marks INT,
    City VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    AdmissionDate DATE,
    Fee DECIMAL(10,2),
    DepartmentID INT)
--4. Add a new column to the Student table to store the student's email address.
ALTER TABLE Student
ADD Email VARCHAR(50)
--5. Modify the data type/size of the email column you just added.
ALTER TABLE Student
ALTER COLUMN Email VARCHAR(100)
--6. Rename the newly added email column to something more suitable.
 sp_rename 'Student.Email', 'StudentEmail', 'COLUMN'

--7. Drop the email column from the Student table.
ALTER TABLE Student
DROP COLUMN StudentEmail
--8. Rename the Student table to StudentRecords and then rename it back to Student.
 sp_rename 'Student', 'StudentRecords'
 sp_rename 'StudentRecords', 'Student'

--9. Write a query to view the complete structure of the Student table.
 sp_help Student

 --10. Write a query to view the complete structure of the Department table.
  sp_help Department

 --11. Truncate all the data from the Department table and recreate it.
 TRUNCATE TABLE Department
 --12.Drop the Department table and create it again with the same structure.
 DROP TABLE Department
 --13. Set the primary key on the Department table.
 CREATE TABLE Department
(DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50))

 ALTER TABLE Department
ADD CONSTRAINT PK_Department
PRIMARY KEY(DepartmentID)
--14. Set the primary key on the Student table.
CREATE TABLE Student
(  RollNo INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Course VARCHAR(50),
    Marks INT,
    City VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    AdmissionDate DATE,
    Fee DECIMAL(10,2),
    DepartmentID INT)

   --15. Add a foreign key on the Student table that references the Department table.
   ALTER TABLE Student
ADD CONSTRAINT FK_Department
FOREIGN KEY(DepartmentID)
REFERENCES Department(DepartmentID)

 --16. Try inserting a student record with a department value that does not exist in the
--Department table and observe the result.
INSERT INTO Student
VALUES
(101,'Rahul','Computer Science',80,'Delhi','M',19,'2024-06-10',25000,10)
--Error because DepartmentID 10 does not exist.

--17. Apply a NOT NULL constraint on the student's name column.
ALTER TABLE Student
ALTER COLUMN StudentName VARCHAR(100) NOT NULL
--18. Apply a NOT NULL constraint on the course column.
ALTER TABLE Student
ALTER COLUMN Course VARCHAR(50) NOT NULL
--19. Apply a UNIQUE constraint on a column that stores each student's roll number.
ALTER TABLE Student
ADD CONSTRAINT UQ_RollNo
UNIQUE(RollNo)
--20. Apply a UNIQUE constraint on the email column (add the column again if you had
--dropped it earlier).
ALTER TABLE Student
ADD Email VARCHAR(100)
--21. Apply a DEFAULT constraint on the city column with a default value of your choice.
ALTER TABLE Student
ADD CONSTRAINT DF_City
DEFAULT 'Ahmedabad'
FOR City
--22. Apply a DEFAULT constraint on the fee column with a default value.
ALTER TABLE Student
ADD CONSTRAINT DF_Fee
DEFAULT 15000
FOR Fee
--23. Apply a CHECK constraint on the marks column so that marks cannot be negative or
--greater than 100.
ALTER TABLE Student
ADD CONSTRAINT CHK_Marks
CHECK(Marks BETWEEN 0 AND 100)
--24. Apply a CHECK constraint on the age column so that age must be greater than or
--equal to 15.
ALTER TABLE Student
ADD CONSTRAINT CHK_Age
CHECK(Age>=15)
--25. Apply a CHECK constraint on the gender column so that only 'M' or 'F' can be
--entered.
ALTER TABLE Student
ADD CONSTRAINT CHK_Gender
CHECK(Gender IN('M','F'))
--26. Remove the CHECK constraint applied on the age column.
ALTER TABLE Student
DROP CONSTRAINT CHK_Age
--27. Remove the UNIQUE constraint applied on the roll number column.
ALTER TABLE Student
DROP CONSTRAINT UQ_RollNo
--28. Remove the DEFAULT constraint applied on the fee column.
ALTER TABLE Student
DROP CONSTRAINT DF_Fee
--29. Remove the foreign key constraint from the Student table.
ALTER TABLE Student
DROP CONSTRAINT FK_Department
--30. Add the foreign key constraint back to the Student table.
ALTER TABLE Student
ADD CONSTRAINT FK_Department
FOREIGN KEY(DepartmentID)
REFERENCES Department(DepartmentID)
--31. Remove the primary key from the Department table and then reapply it.
ALTER TABLE Department
DROP CONSTRAINT PK_Department

ALTER TABLE Department
ADD CONSTRAINT PK_Department
PRIMARY KEY(DepartmentID)
--32. Try deleting a department from the Department table that is still referenced by a
--student and observe the result.
DELETE FROM Department
WHERE DepartmentID=1
--33. Insert 5 records into the Department table.
INSERT INTO Department
VALUES
(1,'Computer Science'),
(2,'Commerce'),
(3,'Arts'),
(4,'Mechanical'),
(5,'Civil')

--34. Insert 20 records into the Student table with varied courses, cities, marks, and fees.
INSERT INTO Student
(RollNo,StudentName,Course,Marks,City,Gender,Age,AdmissionDate,Fee,DepartmentID,Email)
VALUES
(1,'Aarav','Computer Science',85,'Ahmedabad','M',18,'2024-06-01',25000,1,'aarav@gmail.com'),
(2,'Riya','Commerce',72,'Delhi','F',19,'2024-06-03',22000,2,'riya@gmail.com'),
(3,'Sohan','Arts',65,'Jaipur','M',20,'2024-06-04',18000,3,'sohan@gmail.com'),
(4,'Neha','Computer Science',92,'Surat','F',18,'2024-06-05',26000,1,'neha@gmail.com'),
(5,'Karan','Mechanical',74,'Mumbai','M',21,'2024-06-06',30000,4,'karan@gmail.com'),
(6,'Sneha','Civil',89,'Ahmedabad','F',19,'2024-06-07',27000,5,'sneha@gmail.com'),
(7,'Rahul','Commerce',58,'Delhi','M',18,'2024-06-08',20000,2,'rahul@gmail.com'),
(8,'Priya','Computer Science',97,'Pune','F',19,'2024-06-09',29000,1,'priya@gmail.com'),
(9,'Aman','Mechanical',45,'Rajkot','M',20,'2024-06-10',28000,4,'aman@gmail.com'),
(10,'Simran','Arts',76,'Jaipur','F',18,'2024-06-11',17000,3,'simran@gmail.com'),
(11,'Yash','Computer Science',81,'Ahmedabad','M',19,'2024-06-12',26000,1,'yash@gmail.com'),
(12,'Anjali','Commerce',69,'Delhi','F',20,'2024-06-13',21000,2,'anjali@gmail.com'),
(13,'Manan','Civil',87,'Surat','M',21,'2024-06-14',25000,5,'manan@gmail.com'),
(14,'Rohan','Mechanical',54,'Mumbai','M',22,'2024-06-15',30000,4,'rohan@gmail.com'),
(15,'Siya','Computer Science',90,'Ahmedabad','F',18,'2024-06-16',28000,1,'siya@gmail.com'),
(16,'Dev','Commerce',63,'Vadodara','M',19,'2024-06-17',23000,2,'dev@gmail.com'),
(17,'Pooja','Arts',79,'Jaipur','F',20,'2024-06-18',18000,3,'pooja@gmail.com'),
(18,'Harsh','Civil',82,'Delhi','M',18,'2024-06-19',24000,5,'harsh@gmail.com'),
(19,'Tanvi','Computer Science',95,'Ahmedabad','F',19,'2024-06-20',30000,1,'tanvi@gmail.com'),
(20,'Vivek','Mechanical',68,'Surat','M',20,'2024-06-21',27000,4,'vivek@gmail.com')

--35. Insert a record into the Student table without providing a value for the city column,
--to check the DEFAULT constraint.
INSERT INTO Student
(RollNo, StudentName, Course, Marks, Gender, Age, AdmissionDate, Fee, DepartmentID, Email)
VALUES
(21, 'Nikhil', 'Computer Science', 78, 'M', 19, '2024-06-22', 25000, 1, 'nikhil@gmail.com')

--36. Insert a record into the Student table without providing a value for the fee column, to
--check the DEFAULT constraint.
INSERT INTO Student
(RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, DepartmentID, Email)
VALUES
(22, 'Meera', 'Commerce', 84, 'Delhi', 'F', 20, '2024-06-23', 2, 'meera@gmail.com')

--37.Update the marks of a student whose roll number is a specific value, increasing it by 5.
UPDATE Student
SET Marks = Marks + 5
WHERE RollNo = 5
--38.Update the fee amount of all students belonging to a particular course.
UPDATE Student
SET Fee = Fee + 2000
WHERE Course = 'Computer Science'
--39.Update the city of a student from one city to another.
UPDATE Student
SET City = 'Vadodara'
WHERE City = 'Ahmedabad'
--40.Update the department of a student to a different valid department.
UPDATE Student
SET DepartmentID = 2
WHERE RollNo = 8
--41.Delete the record of a student with a specific roll number.
DELETE FROM Student
WHERE RollNo = 20
--42.Delete all students whose marks are less than 35.
DELETE FROM Student
WHERE Marks < 35
--43.Delete all students belonging to a particular city.
DELETE FROM Student
WHERE City = 'Jaipur'
--44. Insert a record leaving the student name blank and check whether the NOT NULL
--constraint blocks it.
INSERT INTO Student
(RollNo, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID, Email)
VALUES
(23, 'Arts', 70, 'Delhi', 'M', 18, '2024-06-24', 20000, 3, 'test@gmail.com')
--Error because StudentName is NOT NULL.

--45. Insert a record with a duplicate roll number and check whether the UNIQUE
--constraint blocks it.
INSERT INTO Student
VALUES
(1, 'Duplicate', 'Commerce', 60, 'Delhi', 'M', 19, '2024-06-25', 22000, 2, 'duplicate@gmail.com')
--Error because RollNo already exists.

--46. Insert a record with age less than the allowed minimum and check whether the
--CHECK constraint blocks it.
INSERT INTO Student
VALUES
(24, 'Child', 'Arts', 75, 'Delhi', 'M', 13, '2024-06-26', 18000, 3, 'child@gmail.com')

--47.Update the marks of a student to a value greater than 100 and check whether the
--CHECK constraint blocks it.
UPDATE Student
SET Marks = 110
WHERE RollNo = 2
--Error because Marks must be between 0 and 100.

--48.Display all students whose marks are greater than 75.
SELECT *
FROM Student
WHERE Marks > 75

--49.Display all students whose fee is less than or equal to 20,000.
SELECT *
FROM Student
WHERE Fee <= 20000

--50.Display all students whose age is not equal to 18.
SELECT *
FROM Student
WHERE Age <> 18

--51.Display all students belonging to the 'Computer Science' course AND having marks
--greater than 60.
SELECT *
FROM Student
WHERE Course = 'Computer Science'
AND Marks > 60
--52.Display all students belonging to the 'Computer Science' course OR the 'Commerce'
--course.
SELECT *
FROM Student
WHERE Course = 'Computer Science'
OR Course = 'Commerce'
--53.Display all students whose marks are BETWEEN 50 and 90.
SELECT *
FROM Student
WHERE Marks BETWEEN 50 AND 90
--54.Display all students whose fee is BETWEEN 10,000 and 30,000.
SELECT *
FROM Student
WHERE Fee BETWEEN 10000 AND 30000
-
--55.Display all students whose city is IN ('Delhi', 'Jaipur', 'Ahmedabad').
SELECT *
FROM Student
WHERE City IN ('Delhi','Jaipur','Ahmedabad')

--56.Display all students whose course is NOT IN ('Arts', 'Commerce').
SELECT *
FROM Student
WHERE Course NOT IN ('Arts','Commerce')

--57.Display all students whose name starts with the letter 'S' using the LIKE operator.
SELECT *
FROM Student
WHERE StudentName LIKE 'S%'

--58.Display all students whose name ends with the letter 'n' using the LIKE operator.
SELECT *
FROM Student
WHERE StudentName LIKE '%n'

--59.Display all students whose name contains the substring 'an' anywhere in it.
SELECT *
FROM Student
WHERE StudentName LIKE '%an%'

--60.Display all students whose gender is 'F' and marks are greater than 80.
SELECT *
FROM Student
WHERE Gender='F'
AND Marks>80

--61.Display all students whose department value IS NULL (if any).
SELECT *
FROM Student
WHERE DepartmentID IS NULL

--62.Display all students whose department value IS NOT NULL.
SELECT *
FROM Student
WHERE DepartmentID IS NOT NULL
--63. Find the total number of students using COUNT.
SELECT COUNT(*) AS TotalStudents
FROM Student
--64. Find the total number of students who belong to the 'Computer Science' course.
SELECT COUNT(*) AS ComputerScienceStudents
FROM Student
WHERE Course='Computer Science'
--65. Find the total fee collected from all students using SUM.
SELECT SUM(Fee) AS TotalFee
FROM Student
--66. Find the total fee collected from students of a specific course.
SELECT SUM(Fee) AS TotalFee
FROM Student
WHERE Course='Computer Science'
--67. Find the average marks of all students using AVG.
SELECT AVG(Marks) AS AverageMarks
FROM Student
--68. Find the average fee paid by students belonging to a specific city.
SELECT AVG(Fee) AS AverageFee
FROM Student
WHERE City = 'Ahmedabad'
--69. Find the highest marks scored by any student using MAX.
SELECT MAX(Marks) AS HighestMarks
FROM Student
--70. Find the lowest marks scored by any student using MIN.
SELECT MIN(Marks) AS LowestMarks
FROM Student
--71. Find the highest fee paid by any student.
SELECT MAX(Fee) AS HighestFee
FROM Student
--72. Find the lowest fee paid by any student.
SELECT MIN(Fee) AS LowestFee
FROM Student
--73. Find the average age of all students.
SELECT AVG(Age) AS AverageAge
FROM Student
--74. Find the total number of distinct courses offered, using COUNT with DISTINCT.
SELECT COUNT(DISTINCT Course) AS TotalCourses
FROM Student
--75. Find the total number of distinct cities the students belong to.
SELECT COUNT(DISTINCT City) AS TotalCities
FROM Student
--76. Find the maximum age among all students.
SELECT MAX(Age) AS MaximumAge
FROM Student
--77. Find the minimum age among all students.
SELECT MIN(Age) AS MinimumAge
FROM Student
--78. Find the sum of marks of all students combined.
SELECT SUM(Marks) AS TotalMarks
FROM Student
--79. Find the average marks of only the female students.
SELECT AVG(Marks) AS AverageFemaleMarks
FROM Student
WHERE Gender = 'F'
--80. Find the count of students who scored more than 90 marks.
SELECT COUNT(*) AS StudentsAbove90
FROM Student
WHERE Marks > 90
--81.Display the total number of students in each course, using GROUP BY.
SELECT Course,
COUNT(*) AS TotalStudents
FROM Student
GROUP BY Course
--82.Display the average marks of students, grouped by course.
SELECT Course,
AVG(Marks) AS AverageMarks
FROM Student
GROUP BY Course
--83.Display the total fee collected, grouped by department.
SELECT DepartmentID,
SUM(Fee) AS TotalFee
FROM Student
GROUP BY DepartmentID
--84.Display the maximum marks scored, grouped by city.
SELECT City,
MAX(Marks) AS HighestMarks
FROM Student
GROUP BY City
--85.Display the minimum age, grouped by gender.
SELECT Gender,
MIN(Age) AS MinimumAge
FROM Student
GROUP BY Gender
--86.Display the count of students, grouped by city.
SELECT City,
COUNT(*) AS StudentCount
FROM Student
GROUP BY City
--87.Display the average fee, grouped by course and city together.
SELECT Course,
City,
AVG(Fee) AS AverageFee
FROM Student
GROUP BY Course, City
--88.Display the sum of marks, grouped by department.
SELECT DepartmentID,
SUM(Marks) AS TotalMarks
FROM Student
GROUP BY DepartmentID
--89.Display courses having more than 5 students enrolled, using HAVING.
SELECT Course,
COUNT(*) AS TotalStudents
FROM Student
GROUP BY Course
HAVING COUNT(*) > 5
--90.Display cities having an average fee greater than 15,000, using HAVING.
SELECT City,
AVG(Fee) AS AverageFee
FROM Student
GROUP BY City
HAVING AVG(Fee) > 15000
--91.Display departments having a total student count greater than 3, using HAVING.
SELECT DepartmentID,
COUNT(*) AS StudentCount
FROM Student
GROUP BY DepartmentID
HAVING COUNT(*) > 3
--92.Display courses having an average marks greater than 70, using HAVING.
SELECT Course,
AVG(Marks) AS AverageMarks
FROM Student
GROUP BY Course
HAVING AVG(Marks) > 70
--93.Display genders having a maximum marks value greater than 95, using HAVING.
SELECT Gender,
MAX(Marks) AS MaximumMarks
FROM Student
GROUP BY Gender
HAVING MAX(Marks) > 95
--94.Display all student records sorted by marks in descending order, using ORDER BY.
SELECT *
FROM Student
ORDER BY Marks DESC
--95.Display all student records sorted by fee in ascending order.
SELECT *
FROM Student
ORDER BY Fee ASC
--96.Display all student records sorted by course (ascending) and then marks
--(descending).
SELECT *
FROM Student
ORDER BY Course ASC,
Marks DESC
--97.Display all student records sorted by admission date, showing the most recently
--admitted students first.
SELECT *
FROM Student
ORDER BY AdmissionDate DESC
--98.Display the top 10 students with the highest marks, using ORDER BY along with a
--row-limiting clause.
SELECT TOP 10 *
FROM Student
ORDER BY Marks DESC
--99.Display all distinct courses sorted alphabetically.
SELECT DISTINCT Course
FROM Student
ORDER BY Course ASC
--100. Display department-wise student count sorted from highest to lowest count,
--combining GROUP BY and ORDER BY.
SELECT DepartmentID,
COUNT(*) AS StudentCount
FROM Student
GROUP BY DepartmentID
ORDER BY StudentCount DESC




