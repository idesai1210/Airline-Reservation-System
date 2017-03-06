Drop database if exists airline_system;

create database airline_system;

use airline_system;

create table Airport (
Airport_code VARCHAR(20) Not Null, 
Name VARCHAR(50) NOT Null,
City VARCHAR(20) NOT Null,
State VARCHAR(20) NOT Null,
Primary key(Airport_code));

create table Flight (
Flight_number VARCHAR(20) NOT Null, 
Airline VARCHAR(50) NOT Null,
Weekdays VARCHAR(100) NOT Null,
Primary key(Flight_number));

create table Flight_Leg (
Flight_number VARCHAR(20) NOT Null, 
Leg_number tinyint NOT Null,
Departure_airport_code varchar(20) NOT Null,
Scheduled_departure_time time NOT Null,
Arrival_airport_code varchar(20) NOT Null,
Scheduled_arrival_time time NOT Null,
Primary key(Flight_number,Leg_number));

create table Leg_instance (
Flight_number VARCHAR(20) NOT Null, 
Leg_number tinyint NOT Null,
Date date Not null,
Numeber_of_available_seats int Not null,
Airplane_id varchar(20) Not Null,
Departure_airport_code varchar(20) NOT Null,
Departure_time time NOT Null,
Arrival_airport_code varchar(20) NOT Null,
Arrival_time time NOT Null,
Primary key(Flight_number,Leg_number,Date));

create table Fare (
Flight_number VARCHAR(20) NOT Null, 
Fare_code Varchar(20) Not Null,
Amount float Not null,
Restrictions varchar(200),
Primary key(Flight_number,Fare_code));

create table Airplane_type (
Airplane_type_name VARCHAR(100) NOT Null, 
Max_seats int NOT Null,
Company VARCHAR(500) NOT Null,
Primary key(Airplane_type_name));

create table Can_land(
Airplane_type_name VARCHAR(100) NOT Null,
Airport_code varchar(20) not null,
Primary key(Airplane_type_name,Airport_code));

create table Airplane(
Airplane_id varchar(20) Not null,
Total_number_of_seats int not null,
Airplane_type varchar(100) Not null,
Primary key(Airplane_id));

create table Seat_Reservation(
Flight_number VARCHAR(20) NOT Null, 
Leg_number tinyint NOT Null,
Date date Not null,
Seat_number varchar(10) not null,
Customer_name varchar(100) not null,
Customer_phone varchar(11) not null, 
Primary key(Flight_number,Leg_number,Date,Seat_number));
 
 
ALTER TABLE Flight_leg
Add constraint FK1_Flightleg_flight
foreign key (Flight_number) REFERENCES Flight(Flight_number) on update cascade on delete cascade,
Add constraint FK2_Flightleg_Airport
foreign key (Departure_airport_code) REFERENCES Airport(Airport_code) on update cascade on delete cascade,
Add constraint FK3_Flightleg_Airport
foreign key (Arrival_airport_code) REFERENCES Airport(Airport_code) on update cascade on delete cascade;

ALTER TABLE Leg_instance
Add constraint FK1_LegInst_Flightlg
foreign key (Flight_number,Leg_number) REFERENCES Flight_leg(Flight_number,Leg_number) on update cascade on delete cascade,
Add constraint FK2_LegInst_Airplane
foreign key (Airplane_id) REFERENCES Airplane(Airplane_id) on update cascade on delete cascade,
Add constraint FK3_LegInst_Airport
foreign key (Departure_airport_code) REFERENCES Airport(Airport_code) on update cascade on delete cascade,
Add constraint FK4_LegInst_Airport
foreign key (Arrival_airport_code) REFERENCES Airport(Airport_code) on update cascade on delete cascade;

Alter Table Fare 
Add constraint FK1_Fare_Flight
Foreign key (Flight_number) REFERENCES Flight(Flight_number) on update cascade on delete cascade;

Alter Table can_land 
Add constraint FK1_canLand_PlnType
Foreign key (Airplane_type_name) REFERENCES Airplane_type(Airplane_type_name) on update cascade on delete cascade,
Add constraint FK2_canLand_Airport
foreign key (Airport_code) REFERENCES Airport(Airport_code) on update cascade on delete cascade;

Alter Table Seat_reservation
Add constraint FK1_SeatRes_LegInst
Foreign key (Flight_number,Leg_number,Date) REFERENCES Leg_instance(Flight_number,Leg_number,Date) on update cascade on delete cascade;
