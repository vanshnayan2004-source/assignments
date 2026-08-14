create database airlineflightmanagementsystem

use airlineflightmanagementsystem


create table airports (
    airport_id int primary key identity(1,1),
    airport_name varchar(150) not null unique,
    airport_code char(3) not null unique,
    city varchar(100) not null,
    country varchar(100) not null,
    timezone varchar(50) not null
)

create table airlines (
    airline_id int primary key identity(1,1),
    airline_name varchar(100) not null unique,
    iata_code char(2) not null unique,
    country varchar(100) not null,
    contact_email varchar(100) not null unique,
    status varchar(20) check (status in ('Active', 'Suspended'))
)

create table aircrafts (
    aircraft_id int primary key identity(1,1),
    aircraft_code varchar(20) not null unique,
    model varchar(100) not null,
    airline_id int,
    total_seats int not null,
    manufacture_year int not null,
    foreign key (airline_id) references airlines(airline_id)
)

create table flights (
    flight_id int primary key identity(1,1),
    flight_number varchar(10) not null unique,
    airline_id int,
    aircraft_id int,
    origin_id int,
    destination_id int,
    departure_time datetime not null,
    arrival_time datetime not null,
    fare decimal(8,2) not null,
    status varchar(20) check (status in ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    foreign key (airline_id) references airlines(airline_id),
    foreign key (aircraft_id) references aircrafts(aircraft_id),
    foreign key (origin_id) references airports(airport_id),
    foreign key (destination_id) references airports(airport_id)
)

create table passengers (
    passenger_id int primary key identity(1,1),
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    phone varchar(15) unique,
    passport_no varchar(20) unique,
    nationality varchar(50) not null,
    dob date not null
)

create table bookings (
    booking_id int primary key identity(1,1),
    passenger_id int,
    flight_id int,
    booking_date date default getdate(),
    seat_number varchar(5) not null,
    seat_class varchar(20) check (seat_class in ('Economy', 'Business', 'First')),
    amount_paid decimal(8,2) not null,
    booking_status varchar(20) check (booking_status in ('Confirmed', 'Cancelled', 'Pending')),
    foreign key (passenger_id) references passengers(passenger_id),
    foreign key (flight_id) references flights(flight_id)
    )


set identity_insert airports on

INSERT INTO airports (airport_id, airport_name, airport_code, city, country, timezone) VALUES
(1,  'Indira Gandhi International Airport',    'DEL', 'New Delhi',    'India',          'Asia/Kolkata'),
(2,  'Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India',    'Asia/Kolkata'),
(3,  'Kempegowda International Airport',       'BLR', 'Bangalore',    'India',          'Asia/Kolkata'),
(4,  'Chennai International Airport',          'MAA', 'Chennai',      'India',          'Asia/Kolkata'),
(5,  'Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India',     'Asia/Kolkata'),
(6,  'Rajiv Gandhi International Airport',     'HYD', 'Hyderabad',    'India',          'Asia/Kolkata'),
(7,  'Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'India',     'Asia/Kolkata'),
(8,  'Dubai International Airport',            'DXB', 'Dubai',        'UAE',            'Asia/Dubai'),
(9,  'Heathrow Airport',                       'LHR', 'London',       'United Kingdom', 'Europe/London'),
(10, 'John F. Kennedy International Airport',  'JFK', 'New York',     'USA',            'America/New_York'),
(11, 'Singapore Changi Airport',               'SIN', 'Singapore',    'Singapore',      'Asia/Singapore'),
(12, 'Sydney Kingsford Smith Airport',         'SYD', 'Sydney',       'Australia',      'Australia/Sydney'),
(13, 'Frankfurt Airport',                      'FRA', 'Frankfurt',    'Germany',        'Europe/Berlin'),
(14, 'Bangkok Suvarnabhumi Airport',           'BKK', 'Bangkok',      'Thailand',       'Asia/Bangkok'),
(15, 'Kuala Lumpur International Airport',     'KUL', 'Kuala Lumpur', 'Malaysia',       'Asia/Kuala_Lumpur');

set identity_insert airports off

set identity_insert airlines on

INSERT INTO airlines (airline_id, airline_name, iata_code, country, contact_email, status) VALUES
(1, 'Air India',           'AI', 'India',          'support@airindia.in',       'Active'),
(2, 'IndiGo',              '6E', 'India',          'care@goindigo.in',          'Active'),
(3, 'SpiceJet',            'SG', 'India',          'support@spicejet.com',      'Active'),
(4, 'Vistara',             'UK', 'India',          'customercare@airvistara.com','Active'),
(5, 'Emirates',            'EK', 'UAE',            'support@emirates.com',      'Active'),
(6, 'British Airways',     'BA', 'United Kingdom', 'help@britishairways.com',   'Active'),
(7, 'Singapore Airlines',  'SQ', 'Singapore',      'customercare@singaporeair.com','Active'),
(8, 'AirAsia',             'AK', 'Malaysia',       'support@airasia.com',       'Suspended');

set identity_insert airlines off

set identity_insert aircrafts on

INSERT INTO aircrafts (aircraft_id, aircraft_code, model, airline_id, total_seats, manufacture_year) VALUES
(1,  'VT-PPB', 'Boeing 787-8 Dreamliner',  1, 256, 2015),
(2,  'VT-IGL', 'Airbus A320neo',            2, 186, 2018),
(3,  'VT-IGM', 'Airbus A320neo',            2, 186, 2019),
(4,  'VT-SGF', 'Boeing 737-800',            3, 189, 2016),
(5,  'VT-SGG', 'Boeing 737-800',            3, 189, 2017),
(6,  'VT-TTB', 'Airbus A320',               4, 158, 2020),
(7,  'VT-TTC', 'Boeing 787-9 Dreamliner',   4, 268, 2021),
(8,  'A6-ENA', 'Boeing 777-300ER',          5, 354, 2014),
(9,  'A6-ENB', 'Airbus A380-800',           5, 489, 2013),
(10, 'G-XWBA', 'Airbus A350-1000',          6, 331, 2019),
(11, '9V-SKA', 'Boeing 777-300ER',          7, 299, 2016),
(12, '9M-AQA', 'Airbus A320',               8, 180, 2017);

set identity_insert aircrafts off

set identity_insert flights on

INSERT INTO flights (flight_id, flight_number, airline_id, aircraft_id, origin_id, destination_id, departure_time, arrival_time, fare, status) VALUES
(1,  'AI-101',  1, 1,  1,  2,  '2024-03-01 06:00:00', '2024-03-01 08:10:00',  4500.00,  'Completed'),
(2,  'AI-202',  1, 1,  2,  9,  '2024-03-02 22:00:00', '2024-03-03 04:30:00', 32000.00,  'Completed'),
(3,  '6E-301',  2, 2,  1,  3,  '2024-03-03 07:30:00', '2024-03-03 09:45:00',  3200.00,  'Completed'),
(4,  '6E-402',  2, 3,  3,  6,  '2024-03-04 11:00:00', '2024-03-04 12:30:00',  2800.00,  'Completed'),
(5,  'SG-501',  3, 4,  1,  4,  '2024-03-05 08:00:00', '2024-03-05 10:15:00',  3500.00,  'Completed'),
(6,  'SG-602',  3, 5,  4,  7,  '2024-03-06 14:00:00', '2024-03-06 15:45:00',  2600.00,  'Delayed'),
(7,  'UK-701',  4, 6,  1,  5,  '2024-03-07 09:30:00', '2024-03-07 13:00:00',  5200.00,  'Scheduled'),
(8,  'UK-802',  4, 7,  2,  8,  '2024-03-08 18:00:00', '2024-03-08 21:30:00', 18000.00,  'Scheduled'),
(9,  'EK-901',  5, 8,  8, 10,  '2024-03-09 02:00:00', '2024-03-09 14:00:00', 55000.00,  'Completed'),
(10, 'EK-1002', 5, 9,  8,  9,  '2024-03-10 08:30:00', '2024-03-10 13:00:00', 42000.00,  'Completed'),
(11, 'BA-201',  6, 10, 9,  1,  '2024-03-11 10:00:00', '2024-03-11 23:30:00', 48000.00,  'Completed'),
(12, 'BA-302',  6, 10, 9, 13,  '2024-03-12 12:00:00', '2024-03-12 14:30:00', 22000.00,  'Cancelled'),
(13, 'SQ-401',  7, 11, 11,  1, '2024-03-13 00:30:00', '2024-03-13 05:00:00', 36000.00,  'Completed'),
(14, 'SQ-502',  7, 11, 11, 12, '2024-03-14 09:00:00', '2024-03-14 18:30:00', 41000.00,  'Scheduled'),
(15, 'AI-303',  1, 1,  2,  4,  '2024-03-15 07:00:00', '2024-03-15 09:30:00',  3800.00,  'Completed'),
(16, '6E-503',  2, 2,  1,  2,  '2024-03-16 06:30:00', '2024-03-16 08:40:00',  3100.00,  'Scheduled'),
(17, 'SG-703',  3, 4,  4,  1,  '2024-03-17 16:00:00', '2024-03-17 18:15:00',  3300.00,  'Delayed'),
(18, 'UK-903',  4, 6,  1,  3,  '2024-03-18 13:00:00', '2024-03-18 15:10:00',  4100.00,  'Scheduled'),
(19, 'EK-1103', 5, 8,  8, 14,  '2024-03-19 03:00:00', '2024-03-19 07:30:00', 28000.00,  'Completed'),
(20, 'AK-101',  8, 12, 15, 11,  '2024-03-20 10:00:00', '2024-03-20 12:00:00',  8500.00,  'Cancelled');

set identity_insert flights off

set identity_insert passengers on

INSERT INTO passengers (passenger_id, full_name, email, phone, passport_no, nationality, dob) VALUES
(1,  'Aarav Sharma',      'aarav.sharma@gmail.com',      '9876543210', 'P1234567', 'Indian',      '1990-04-15'),
(2,  'Priya Mehta',       'priya.mehta@yahoo.com',       '9823456781', 'P2345678', 'Indian',      '1992-07-22'),
(3,  'Rahul Verma',       'rahul.verma@outlook.com',     '9712345682', 'P3456789', 'Indian',      '1988-11-05'),
(4,  'Sneha Patel',       'sneha.patel@gmail.com',       '9634567893', 'P4567890', 'Indian',      '1995-02-18'),
(5,  'Vikram Singh',      'vikram.singh@hotmail.com',    '9545678904', 'P5678901', 'Indian',      '1985-09-30'),
(6,  'Ananya Iyer',       'ananya.iyer@gmail.com',       '9456789015', 'P6789012', 'Indian',      '1998-06-12'),
(7,  'Karan Kapoor',      'karan.kapoor@gmail.com',      '9367890126', 'P7890123', 'Indian',      '1993-03-25'),
(8,  'Divya Nair',        'divya.nair@rediffmail.com',   '9278901237', 'P8901234', 'Indian',      '1991-12-08'),
(9,  'Mohammed Al Farsi', 'mohammed.alfarsi@email.ae',   '0551234568', 'UAE123456','Emirati',     '1987-08-14'),
(10, 'Sarah Johnson',     'sarah.j@gmail.com',           '07911123459','GB123456', 'British',     '1989-05-20'),
(11, 'Liu Wei',           'liu.wei@163.com',             '13812345670','CN123456', 'Chinese',     '1994-01-17'),
(12, 'Emily Watson',      'emily.watson@yahoo.com',      '21298765431','US123456', 'American',    '1996-10-03'),
(13, 'Rohan Desai',       'rohan.desai@gmail.com',       '9189012342', 'P9012345', 'Indian',      '1990-07-29'),
(14, 'Meera Krishnan',    'meera.k@gmail.com',           '9090123453', 'P0123456', 'Indian',      '1997-04-11'),
(15, 'Arjun Reddy',       'arjun.reddy@gmail.com',       '9901234564', 'P1122334', 'Indian',      '1986-02-28'),
(16, 'Fatima Sheikh',     'fatima.sheikh@email.ae',      '0559876545', 'UAE654321','Emirati',     '1993-09-19'),
(17, 'James Miller',      'james.miller@gmail.com',      '07922334456','GB654321', 'British',     '1984-12-31'),
(18, 'Nisha Agarwal',     'nisha.agarwal@gmail.com',     '9812345677', 'P2233445', 'Indian',      '1999-08-05'),
(19, 'Chen Jing',         'chen.jing@qq.com',            '13987654328','CN654321', 'Chinese',     '1991-03-16'),
(20, 'Siddharth Joshi',   'siddharth.j@gmail.com',       '9723456789', 'P3344556', 'Indian',      '1988-06-22');

set identity_insert passengers off

set identity_insert bookings on

INSERT INTO bookings (booking_id, passenger_id, flight_id, booking_date, seat_number, seat_class, amount_paid, booking_status) VALUES
(1,  1,  1,  '2024-02-15', '12A', 'Economy',  4500.00,  'Confirmed'),
(2,  2,  1,  '2024-02-16', '14B', 'Economy',  4500.00,  'Confirmed'),
(3,  3,  2,  '2024-02-10', '3A',  'Business', 64000.00, 'Confirmed'),
(4,  4,  3,  '2024-02-20', '22C', 'Economy',  3200.00,  'Confirmed'),
(5,  5,  4,  '2024-02-22', '8D',  'Economy',  2800.00,  'Confirmed'),
(6,  6,  5,  '2024-02-25', '18E', 'Economy',  3500.00,  'Confirmed'),
(7,  7,  6,  '2024-02-26', '5A',  'Business', 7800.00,  'Confirmed'),
(8,  8,  7,  '2024-02-28', '11B', 'Economy',  5200.00,  'Pending'),
(9,  9,  9,  '2024-02-05', '2A',  'First',    110000.00,'Confirmed'),
(10, 10, 10, '2024-02-08', '1B',  'First',    84000.00, 'Confirmed'),
(11, 11, 13, '2024-02-12', '20C', 'Economy',  36000.00, 'Confirmed'),
(12, 12, 11, '2024-02-14', '4A',  'Business', 96000.00, 'Confirmed'),
(13, 13, 15, '2024-03-01', '9C',  'Economy',  3800.00,  'Confirmed'),
(14, 14, 3,  '2024-02-21', '25D', 'Economy',  3200.00,  'Confirmed'),
(15, 15, 4,  '2024-02-23', '7E',  'Business', 8400.00,  'Confirmed'),
(16, 16, 8,  '2024-02-27', '6B',  'Business', 36000.00, 'Pending'),
(17, 17, 10, '2024-02-09', '10A', 'Economy',  42000.00, 'Confirmed'),
(18, 18, 16, '2024-03-05', '30F', 'Economy',  3100.00,  'Confirmed'),
(19, 19, 14, '2024-03-02', '15C', 'Economy',  41000.00, 'Pending'),
(20, 20, 7,  '2024-02-28', '2B',  'Business', 15600.00, 'Confirmed'),
(21, 1,  15, '2024-03-03', '19A', 'Economy',  3800.00,  'Confirmed'),
(22, 2,  5,  '2024-02-24', '13B', 'Economy',  3500.00,  'Cancelled'),
(23, 3,  9,  '2024-02-06', '1A',  'First',    110000.00,'Confirmed'),
(24, 5,  11, '2024-02-13', '22D', 'Economy',  48000.00, 'Confirmed'),
(25, 6,  19, '2024-03-08', '17E', 'Economy',  28000.00, 'Confirmed'),
(26, 7,  13, '2024-02-11', '5C',  'Business', 72000.00, 'Confirmed'),
(27, 8,  16, '2024-03-06', '28F', 'Economy',  3100.00,  'Cancelled'),
(28, 10, 2,  '2024-02-11', '6A',  'Economy',  32000.00, 'Confirmed'),
(29, 13, 17, '2024-03-10', '14D', 'Economy',  3300.00,  'Pending'),
(30, 15, 19, '2024-03-09', '3B',  'Business', 56000.00, 'Confirmed');

set identity_insert bookings off

-- Q1. Write a CREATE TABLE statement for the passengers table with all constraints as defined in the schema.
create table passengers (
passenger_id int primary key identity(1,1),
full_name varchar(100) not null,
email varchar(100) not null unique,
phone varchar(15) unique,
passport_no varchar(20) unique,
nationality varchar(50) not null,
dob date not null
)

-- Q2. Write a CREATE TABLE statement for the bookings table. Include all FOREIGN KEY references and CHECK constraints on seat_class and booking_status.
create table bookings (
booking_id int primary key identity(1,1),
passenger_id int,
flight_id int,
booking_date date default getdate(),
seat_number varchar(5) not null,
seat_class varchar(20) check (seat_class in ('Economy', 'Business', 'First')),
amount_paid decimal(8,2) not null,
booking_status varchar(20) check (booking_status in ('Confirmed', 'Cancelled', 'Pending')),
foreign key (passenger_id) references passengers(passenger_id),
foreign key (flight_id) references flights(flight_id)
)

-- Q3. Insert 3 records into the airports table with realistic values for airport_name, airport_code, city, country, and timezone.
insert into airports (airport_name, airport_code, city, country, timezone) values
('Vadodara Airport', 'BDQ', 'Vadodara', 'India', 'Asia/Kolkata'),
('Rajkot International Airport', 'HSR', 'Rajkot', 'India', 'Asia/Kolkata'),
('Surat Airport', 'STV', 'Surat', 'India', 'Asia/Kolkata')

-- Q4. Insert 2 records into the flights table. Set the status of one flight as 'Delayed' and the other as 'Scheduled'.
insert into flights (flight_number, airline_id, aircraft_id, origin_id, destination_id, departure_time, arrival_time, fare, status) values
('SG-804', 3, 4, 16, 17, '2024-04-01 09:00:00', '2024-04-01 10:30:00', 3000.00, 'Delayed'),
('SG-805', 3, 5, 17, 18, '2024-04-02 14:00:00', '2024-04-02 15:30:00', 3200.00, 'Scheduled')

-- Q5. Write an UPDATE query to change the status of all flights operated by airline_id = 3 from 'Scheduled' to 'Cancelled'.
update flights
set status = 'Cancelled'
where airline_id = 3 and status = 'Scheduled'

-- Q6. Delete all booking records where booking_status = 'Cancelled' and booking_date is older than '2023-06-01'.
delete from bookings
where booking_status = 'Cancelled' and booking_date < '2023-06-01'

-- Add a CHECK constraint on the fare column of the flights table to ensure fare is always greater than 0.
alter table flights
add constraint chk_fare check (fare > 0)

-- Q8. Add a UNIQUE constraint on the passport_no column of the passengers table using ALTER TABLE.
alter table passengers
add constraint uq_passport_no unique (passport_no)

-- Q9. Write a query that attempts to insert a duplicate iata_code into the airlines table. Explain in a comment why it will be rejected.
-- It will be rejected because iata_code has a UNIQUE constraint and the value 'AI' already exists.
--Violation of UNIQUE KEY constraint 'UQ__airlines__1B78975CD4DBBC9B'. Cannot insert duplicate key in object 'dbo.airlines'. The duplicate key value is (AI)
insert into airlines (airline_name, iata_code, country, contact_email, status)
values ('Air India pro max','AI', 'India', 'support@airindiapromax.in', 'Active')

-- Q10. Add a NOT NULL constraint to the seat_number column in the bookings table using ALTER TABLE.
alter table bookings
alter column seat_number varchar(5) not null

-- Q11. Set a DEFAULT value of 'Scheduled' for the status column of the flights table using ALTER TABLE.
alter table flights
add constraint df_flight_status default 'Scheduled' for status

-- Q12. Drop the existing CHECK constraint on booking_status and re-add it to also allow the value 'Waitlisted'.
alter table bookings
drop constraint booking_status

alter table bookings
add constraint chk_booking_status check (booking_status in ('Confirmed', 'Cancelled', 'Pending', 'Waitlisted'))

-- Q13. List all flights along with the name of the operating airline. Display flight_number, airline_name, departure_time, and status.
select flight_number, airline_name, departure_time,f.status from flights f
join airlines on f.airline_id = airlines.airline_id

-- Q14. Display all bookings with passenger full names and their corresponding flight numbers. Show full_name, flight_number, seat_class, and amount_paid.
select full_name, flight_number, seat_class, amount_paid from bookings b
join passengers p
on b.passenger_id = p.passenger_id
join flights on b.flight_id = flights.flight_id

-- Q15. Show each flight's origin and destination city names. Use INNER JOIN on airports twice (aliased separately for origin and destination). Display flight_number, origin_city, and destination_city.
select flight_number, a.city as origin_city, a1.city as destination_city from flights f
join airports a 
on f.origin_id = a.airport_id
join airports as a1
on f.destination_id = a1.airport_id

-- Q16. List all passengers who have made at least one booking, along with the flight they booked and the fare paid. Show full_name, flight_number, and amount_paid.
select full_name, flight_number, amount_paid from passengers p
join bookings b 
on p.passenger_id = b.passenger_id
join flights f 
on b.flight_id = f.flight_id

-- Q17. Display aircraft details for every scheduled flight. Show flight_number, model, total_seats, and departure_time.
select flight_number, model, total_seats, departure_time from flights f
join aircrafts a
on f.aircraft_id = a.aircraft_id
where status = 'Scheduled'

-- Q18. Join airlines and aircrafts to list each aircraft along with its airline name, aircraft model, and manufacture year.
select airline_name, model, manufacture_year from airlines a
join aircrafts ac
on a.airline_id = ac.airline_id

-- Find all passengers who have NOT made any booking yet. Use LEFT JOIN between passengers and bookings. Display full_name and email.
select full_name, email from passengers p
left join bookings  b
on p.passenger_id = b.passenger_id
where b.booking_id is null

-- Q20. List all flights along with their total booking count, including flights with zero bookings. Use LEFT JOIN and GROUP BY.
select f.flight_number, count(b.booking_id) as total_bookings from flights f
left join bookings b 
on f.flight_id = b.flight_id
group by f.flight_number

-- Q21. Find all airlines that currently have NO aircrafts registered under them. Use LEFT JOIN between airlines and aircrafts.
select airline_name from airlines a
left join aircrafts ac
on a.airline_id = ac.airline_id
where ac.aircraft_id is null

-- Q22. Display all airports along with the number of flights departing from each airport. Include airports with no departing flights. Use LEFT JOIN.
select airport_name, count(f.flight_id) as total_departing_flights from airports a
left join flights f
on a.airport_id = f.origin_id
group by airport_name

-- Q23. List all aircrafts with their assigned flights. Include aircrafts that have not been assigned to any flight yet. Use LEFT JOIN.
select ac.aircraft_code, ac.model, f.flight_number from aircrafts ac
left join flights f
on ac.aircraft_id = f.aircraft_id

-- Q24. Using RIGHT JOIN, display all flights with their booking records, showing flights that have no bookings on the right side.
select f.flight_number, b.booking_id, b.booking_date, b.seat_number, b.seat_class, b.amount_paid, b.booking_status
from bookings b
right join flights f
on b.flight_id = f.flight_id

-- Q25. Write a query joining passengers, bookings, and flights to display: full_name, flight_number, seat_class, departure_time, and booking_status.
select p.full_name, f.flight_number, b.seat_class, f.departure_time, b.booking_status
from passengers p
join bookings b
on p.passenger_id = b.passenger_id
join flights f
on b.flight_id = f.flight_id

-- Q26. Show complete flight route details for each booking: full_name, flight_number, origin city, destination city, and amount_paid. Join bookings, passengers, flights, and airports (twice).
select p.full_name, f.flight_number, a1.city as origin_city, a2.city as destination_city, b.amount_paid
from bookings b
join passengers p
on b.passenger_id = p.passenger_id
join flights f
on b.flight_id = f.flight_id
join airports a1
on f.origin_id = a1.airport_id
join airports a2
on f.destination_id = a2.airport_id

-- Q27. Generate a full flight manifest: passenger full_name, passport_no, flight_number, airline_name, seat_number, seat_class, and departure_time. Use all 6 tables.
select p.full_name, p.passport_no, f.flight_number, al.airline_name, b.seat_number, b.seat_class, f.departure_time
from bookings b
join passengers p
on b.passenger_id = p.passenger_id
join flights f
on b.flight_id = f.flight_id
join airlines al
on f.airline_id = al.airline_id
join aircrafts ac
on f.aircraft_id = ac.aircraft_id
join airports a
on f.origin_id = a.airport_id

-- Q28. List all passengers who travelled in Business or First class, along with the airline name and aircraft model of their flight.
select p.full_name, al.airline_name, ac.model
from passengers p
join bookings b
on p.passenger_id = b.passenger_id
join flights f
on b.flight_id = f.flight_id
join airlines al
on f.airline_id = al.airline_id
join aircrafts ac
on f.aircraft_id = ac.aircraft_id
where b.seat_class in ('Business', 'First')

-- Q29. Find all flights that are 'Delayed' and display: flight_number, airline_name, aircraft model, origin city, and destination city.
select f.flight_number, al.airline_name, ac.model, a1.city as origin_city, a2.city as destination_city
from flights f
join airlines al
on f.airline_id = al.airline_id
join aircrafts ac
on f.aircraft_id = ac.aircraft_id
join airports a1
on f.origin_id = a1.airport_id
join airports a2
on f.destination_id = a2.airport_id
where f.status = 'Delayed'

-- Q30. Find the airport from which the highest number of passenger bookings have originated. Join airports, flights, and bookings. Use GROUP BY and ORDER BY.
select a.airport_name, count(b.booking_id) as total_bookings
from airports a
join flights f
on a.airport_id = f.origin_id
join bookings b
on f.flight_id = b.flight_id
group by a.airport_name
order by total_bookings desc

-- Q31. Find pairs of passengers who share the same nationality. Use a SELF JOIN on the passengers table. Show passenger1_name, passenger2_name, and nationality.
select p1.full_name as passenger1_name, p2.full_name as passenger2_name, p1.nationality
from passengers p1
join passengers p2
on p1.nationality = p2.nationality
and p1.passenger_id < p2.passenger_id

-- Q32. Find pairs of flights that share the same origin airport and the same destination airport (i.e., duplicate routes). Use SELF JOIN on the flights table. Display both flight numbers and the shared route.
select f1.flight_number as flight1, f2.flight_number as flight2, f1.origin_id, f1.destination_id
from flights f1
join flights f2
on f1.origin_id = f2.origin_id
and f1.destination_id = f2.destination_id
and f1.flight_id < f2.flight_id

-- Q33. Write a FULL OUTER JOIN between passengers and bookings to display all passengers (with or without bookings) and all bookings (matched or unmatched).
select p.full_name, p.email, b.booking_id, b.booking_date, b.seat_number, b.booking_status
from passengers p
full outer join bookings b
on p.passenger_id = b.passenger_id

-- Q34. Write a CROSS JOIN between airlines and seat classes (create a small derived table with values: 'Economy', 'Business', 'First') to generate all possible airline-seat class combinations.
select al.airline_name, sc.seat_class
from airlines al
cross join (values ('Economy'), ('Business'), ('First')) sc(seat_class)

-- Q35. Count the total number of flights operated by each airline. Display airline_name and total_flights. Order by total_flights descending.
select al.airline_name, count(f.flight_id) as total_flights
from airlines al
left join flights f
on al.airline_id = f.airline_id
group by al.airline_name
order by total_flights desc

-- Q36. Find the total revenue collected per flight (sum of amount_paid from bookings). Display flight_number and total_revenue. Order by total_revenue descending.
select f.flight_number, sum(b.amount_paid) as total_revenue
from flights f
join bookings b
on f.flight_id = b.flight_id
group by f.flight_number
order by total_revenue desc

-- Q37. Group bookings by seat_class and count how many bookings exist in each class. Display seat_class and booking_count.
select seat_class, count(booking_id) as booking_count
from bookings
group by seat_class

-- Q38. Find all destination airports that have received more than 10 arriving flights. Use GROUP BY on destination_id and HAVING.
select destination_id, count(flight_id) as total_flights
from flights
group by destination_id
having count(flight_id) > 10

-- Q39. List airlines that have more than 5 aircrafts registered. Display airline_name and aircraft_count. Use GROUP BY and HAVING.
select al.airline_name, count(ac.aircraft_id) as aircraft_count
from airlines al
join aircrafts ac
on al.airline_id = ac.airline_id
group by al.airline_name
having count(ac.aircraft_id) > 5

-- Q40. Display the number of bookings made each month (from booking_date). Group by YEAR and MONTH and order chronologically.
select year(booking_date) as booking_year, month(booking_date) as booking_month, count(booking_id) as booking_count
from bookings
group by year(booking_date), month(booking_date)
order by booking_year, booking_month

-- Q41. Find passengers who have made more than 3 bookings. Display full_name and total_bookings, ordered by total_bookings descending.
select p.full_name, count(b.booking_id) as total_bookings
from passengers p
join bookings b
on p.passenger_id = b.passenger_id
group by p.full_name
having count(b.booking_id) > 3
order by total_bookings desc

-- Q42. Group all flights by status and count how many flights exist in each status category. Display status and flight_count.
select status, count(flight_id) as flight_count
from flights
group by status

-- Q43. Find the average amount paid per seat_class across all bookings. Display seat_class and avg_amount. Round to 2 decimal places.
select seat_class, round(avg(amount_paid), 2) as avg_amount
from bookings
group by seat_class

-- Q44. List all routes (origin to destination) and how many flights operate on each route. Display origin airport code, destination airport code, and route_count. Show only routes with more than 2 flights.
select a1.airport_code as origin_airport_code, a2.airport_code as destination_airport_code, count(f.flight_id) as route_count
from flights f
join airports a1
on f.origin_id = a1.airport_id
join airports a2
on f.destination_id = a2.airport_id
group by a1.airport_code, a2.airport_code
having count(f.flight_id) > 2

-- Q45. Find the highest, lowest, and average fare across all flights. Use MAX, MIN, and AVG in a single query. Use meaningful column aliases.
select max(fare) as highest_fare, min(fare) as lowest_fare, avg(fare) as average_fare
from flights

-- Q46. Calculate the total revenue generated by each airline by joining flights, bookings, and airlines. Use SUM with GROUP BY.
select al.airline_name, sum(b.amount_paid) as total_revenue
from airlines al
join flights f
on al.airline_id = f.airline_id
join bookings b
on f.flight_id = b.flight_id
group by al.airline_name

-- Q47. Count the total number of confirmed bookings per passenger nationality. Join passengers and bookings. Use COUNT and GROUP BY.
select p.nationality, count(b.booking_id) as confirmed_bookings
from passengers p
join bookings b
on p.passenger_id = b.passenger_id
where b.booking_status = 'Confirmed'
group by p.nationality

-- Q48. Find the passenger who has spent the most total amount across all their bookings. Use SUM, GROUP BY, ORDER BY, and LIMIT 1.
select top 1 p.full_name, sum(b.amount_paid) as total_amount
from passengers p
join bookings b
on p.passenger_id = b.passenger_id
group by p.full_name
order by total_amount desc

-- Q49. Find the aircraft model that has been used for the most number of flights. Use COUNT with GROUP BY and ORDER BY. Join flights and aircrafts.
select top 1 ac.model, count(f.flight_id) as total_flights
from aircrafts ac
join flights f
on ac.aircraft_id = f.aircraft_id
group by ac.model
order by total_flights desc

-- Q50. Write a comprehensive summary query displaying: airline_name, total_flights, total_passengers, total_revenue, avg_fare, and max_fare. Group by airline and order by total_revenue descending.
select al.airline_name, count(distinct f.flight_id) as total_flights, count(b.booking_id) as total_passengers, sum(b.amount_paid) as total_revenue, avg(f.fare) as avg_fare, max(f.fare) as max_fare
from airlines al
join flights f
on al.airline_id = f.airline_id
left join bookings b
on f.flight_id = b.flight_id
group by al.airline_name
order by total_revenue desc