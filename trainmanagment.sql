create database trainmanagement

use trainmanagement


create table Trains (
train_id int primary key ,
train_name varchar (50),
source varchar(20),
destination varchar(20),
departure_time time,
arrival_time time,
distance_km int check (distance_km > 0))

drop table trains
INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500);

create table Passengers (
passenger_id int primary key,
name varchar (20),
age int check(age > 0),
gender char (1) check (gender IN ('M','F')),
city varchar(20))
 
 drop table passengers
INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum')

select * from passengers
create table Reservations (
res_id int primary key,
passenger_id int,
train_id int,
travel_date date,
class varchar(20) check (class IN ('Sleeper', 'AC1', 'AC2', 'AC3')),
fare money check  (fare >= 0),
status varchar (20) check (status IN('Confirmed', 'Waiting', 'Cancelled'))
foreign key(passenger_id)references passengers(passenger_id), 
foreign key (train_id)references trains (train_id) 
)

drop table Reservations
INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled');

select* from trains
select * from passengers
select * from Reservations



• --List all trains running from Delhi as source station.
select * from trains 
where source = 'delhi'
• --Find all passengers who are above 40 years of age.
select * from passengers
where age = 40
• --Get the total number of reservations made.
select COUNT (Res_id) as totalreservation 
from Reservations 
• --Count how many reservations are in 'Confirmed' status.
select count (Res_id) 
from Reservations
where status = 'Confirmed'
• --Show the average fare paid for each train.
select train_id,avg (fare) as avgfare
from Reservations
group by train_id
• --List reservations ordered by fare in descending order.
select * from Reservations
order by fare DESC
• --Find passengers who booked AC classes (AC2, AC3).
select P.passenger_id,P.name,R.class
from Passengers P
join Reservations R
on P.passenger_id = R.passenger_id
where R.class In ('AC2','AC3') 
• --Get total revenue collected per train (only Confirmed reservations).
select sum(fare) as totalrevenue
from Reservations
where status = 'confirmed'
• --Find the train with the maximum distance_km.
SELECT *
FROM Trains
WHERE distance_km = (
    SELECT MAX(distance_km)
    FROM Trains)
• --Show number of male and female passengers.
select count(gender) as totalpassengers
from Passengers
group by gender
• --Get the passenger names who have booked tickets in Sleeper class.
select r.passenger_id,r.class,p.name
from reservations r
inner join passengers p
on r.passenger_id = p.passenger_id
where r.class = 'Sleeper'
• --Find total number of reservations made from each city (JOIN with Passengers).
select p.city, count(r.res_id) as totalreserv
from passengers p 
inner join reservations r
on p.passenger_id = r.passenger_id
group by p.city
• --Show train name and total passengers booked for it, ordered by passenger count
--descending.
select t.train_name,count(r.passenger_id) as totalpassenger
from trains t
inner join reservations r
on t.train_id = r.train_id
group by t.train_name
order by totalpassenger desc
• --Find the average age of passengers who booked 'Confirmed' tickets.
select p.passenger_id,p.age,r.status
from passengers p
inner join reservations r
on p.passenger_id = r.passenger_id
where r.status = 'confirmed'
• --Display travel_date and number of reservations made on that date.
• --Show all reservations where fare is greater than 1000.
• --List all passengers who live in Delhi or Mumbai.

•--Show all trains whose distance is more than 1200 km.
•--Find reservations which are not "Cancelled".
•--Show the details of trains that have "Exp" in their name.
•--List all passengers ordered by their age in descending order.
•--Display reservations sorted by travel_date (earliest first).
•--Find all trains ordered by distance (longest route first).
•--Show passengers ordered by name alphabetically.
•--List reservations ordered by class and then by fare.
•--Count how many passengers are from each city.
•--Find the total fare collected from all Confirmed reservations.
•--show the minimum, maximum, and average age of passengers.
•--Find the highest fare paid in Sleeper class.
•--Get the average fare per travel_date.
•--Show each class and the total number of reservations in it.
•--Find trains that have more than 1 reservation.
•--List cities where more than 1 passenger lives.
•--Show gender-wise average age of passengers.
•--Find passengers who booked more than 1 ticket.
•--Show passenger name, train name, and fare for each reservation.

•--List all passengers and the train name they booked (if any).
•--Show all trains and the number of passengers booked in each.
•--Find all passengers who booked Rajdhani Exp.
•--List passenger names with their travel_date and status.
•--Find the top 2 highest fare reservations.
•--Find the train with the lowest average fare.
•--Show the train(s) where total distance travelled by all passengers > 1000 km.
•--Find passengers whose reservation status is "Waiting".
•--Show the passenger(s) who paid the maximum fare overall.
•--Show all passengers whose age is between 20 and 40.
•--Find trains that start from Kolkata or Chennai.
•--Show all reservations made after 2025-09-05.
•--Display passengers whose name starts with 'A'.
•--List passengers whose city is NOT Delhi.
•--Show the 3 youngest passengers.
•--Show the 2 longest-distance trains.
•--Display the 5 most expensive reservations (highest fare).
•--List trains in alphabetical order of train_name.

•--Show passengers sorted by age (youngest first).
•--Find the average fare of all reservations.
•--Count the total number of male passengers.
•--Show the maximum distance among all trains.
•--Find the total number of Sleeper class reservations.
•--Find the total fare paid by passengers from Mumbai.
•--Count the number of reservations per status (Confirmed/Waiting/Cancelled).
•--Find the total number of passengers per gender.
•--Show the average fare for each class.
•--Display the number of trains starting from each source city.
•--Show total reservations grouped by travel_date.
•--Show passenger name, city, and train_name they booked.
•--List all reservations with passenger name and status.
•--Show train_name and number of confirmed passengers on it.
•--Display all passengers with train_name (if booked, else show NULL).
•--Find which passengers booked Garib Rath train.
•--Show train_id and total fare collected, but only where fare > 1000.
•--List source cities that have more than 1 train.
•--Find passengers grouped by city where count > 1.

•--Show classes that earned more than 2000 fare in total.
•--List trains that have at least 2 passengers booked.
•--Find the passenger(s) with the highest age.
•--Show the train(s) with the shortest distance.
•--Find the reservation(s) with the lowest fare.
•--List passengers who paid above the average fare.
•--Find trains whose distance is above the average train distance.
•--Show all reservations in September 2025.
•--Find the earliest travel_date booked.
•--Find the latest travel_date booked.
•--Count how many reservations are made per day.
•--List passengers who booked tickets on the same date.
•--Show passenger name, train_name, and distance travelled.
• Find the city that contributed the highest number of passengers.
• Display each train and its average fare (confirmed only).
• Show passengers who booked tickets in more than one class.
• Find train_name with maximum number of reservations.


