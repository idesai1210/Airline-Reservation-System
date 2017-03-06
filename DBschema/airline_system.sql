
create database airline_system1;

use airline_system1;

create table Airport (
Airport_code VARCHAR(20) Not Null, 
Name VARCHAR(100) NOT Null,
City VARCHAR(50) NOT Null,
State VARCHAR(20) NOT Null,
Primary key(Airport_code));

create table Flight (
Flight_number VARCHAR(20) NOT Null, 
Airline VARCHAR(50) NOT Null,
Weekdays VARCHAR(100) NOT Null,
Departure_airport_code varchar(20) Not null,
Sheduled_departure_time time not null,
Arrival_airport_code varchar(20) not null,
Sheduled_arrival_time time not null,
Primary key(Flight_number));


create table Flight_instance (
Flight_number VARCHAR(20) NOT Null, 
Date date Not null,
Number_of_available_seats int default 0,
Airplane_id varchar(20) Not Null,
Departure_time time NOT Null,
Arrival_time time NOT Null,
Primary key(Flight_number,Date));


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
Date date Not null,
Seat_number varchar(10) not null,
Customer_name varchar(100) not null,
Customer_phone varchar(11) not null, 
Primary key(Flight_number,Date,Seat_number));


ALTER TABLE `airline_system1`.`flight` 
ADD INDEX `FK1_Flight_Airport_idx` (`Departure_airport_code` ASC),
ADD INDEX `FK1_Flight_Airport_idx1` (`Arrival_airport_code` ASC);
ALTER TABLE `airline_system1`.`flight` 
ADD CONSTRAINT `FK1_Flight_Airport`
  FOREIGN KEY (`Departure_airport_code`)
  REFERENCES `airline_system1`.`airport` (`Airport_code`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  ALTER TABLE `airline_system1`.`flight` 
ADD CONSTRAINT `FK2_Flight_Airport`
  FOREIGN KEY (`Arrival_airport_code`)
  REFERENCES `airline_system1`.`airport` (`Airport_code`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE Flight_instance
Add constraint FK2_FlighInst_Airplane
foreign key (Airplane_id) REFERENCES Airplane(Airplane_id) on update cascade on delete cascade,
Add constraint FK5_FlighInst_Flight
foreign key (flight_number) REFERENCES Flight(flight_number) on update cascade on delete cascade;

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
Foreign key (Flight_number,Date) REFERENCES Flight_instance(Flight_number,Date) on update cascade on delete cascade;


-- trigger for counting available seats
DELIMITER $$
CREATE TRIGGER available_seats AFTER INSERT 
ON SEAT_RESERVATION FOR EACH ROW
BEGIN
DECLARE tot_seats int;
DECLARE booked_seats int;
SELECT DISTINCT Total_number_of_seats INTO tot_seats FROM AIRPLANE a,FLIGHT_INSTANCE b 
where a.Airplane_id = b.Airplane_id AND b.Flight_number = NEW.Flight_number and b.Date = NEW.Date;
SELECT COUNT(*) INTO booked_seats FROM SEAT_RESERVATION s WHERE s.Flight_number = NEW.Flight_number 
AND s.Date = NEW.Date GROUP BY s.Flight_number;
IF (tot_seats - booked_seats) < 0 THEN 
  SIGNAL SQLSTATE '12345'
     SET MESSAGE_TEXT = 'Sorry..Flight is full.';
ELSE
UPDATE FLIGHT_INSTANCE f SET Number_of_available_seats = tot_seats - booked_seats
WHERE f.Flight_number = NEW.Flight_number AND f.Date = NEW.Date;
END IF; 
END $$



-- TRIGGER IF SEAT RESERVATOIN IS CANCELLED, UPDATE IN SEAT_RESERVATION.TOTAL_NUMBER_OF_SEATS
DELIMITER $$
CREATE TRIGGER seat_res_delete_trigger AFTER DELETE 
ON SEAT_RESERVATION FOR EACH ROW
BEGIN
UPDATE FLIGHT_INSTANCE f SET Number_of_available_seats = Number_of_available_seats + 1
WHERE f.Flight_number = OLD.Flight_number AND f.Date = OLD.Date;
END $$

-- TRIGGER BEFORE INSERT TO CHECK WHETHER THE FLIGHT_NO CAN_LAND ON THE DEFINED ARRIVAL AIRPORT CODE
DELIMITER $$
CREATE TRIGGER can_land_flight_inst BEFORE INSERT 
ON FLIGHT_INSTANCE FOR EACH ROW
BEGIN
DECLARE cnt int;
DECLARE arr_code varchar(20);
Select Arrival_airport_code into arr_code from flight  where flight_number=new.flight_number; 
SELECT count(1) into cnt FROM CAN_LAND 
WHERE Airplane_type_name in (SELECT Airplane_type FROM AIRPLANE WHERE Airplane_id = NEW.Airplane_id) AND Airport_code = arr_code;
IF ( cnt = 0) THEN 
  SIGNAL SQLSTATE '12345'
     SET MESSAGE_TEXT = 'The Airplane cannot land at the defined arrival airport code';
END IF;
END $$