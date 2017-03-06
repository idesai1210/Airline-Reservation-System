
-- insering into airport
-- delete from airline_system.airport;
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('ALT', 'Hartsfield Jackson Atlanta Internation', 'Atlanta', 'GA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('ORD',	'Chicago O\'Hare International','Chicago', 'IL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('LAX',	'Los Angeles International', 'Los Angeles', 'CA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('DFW',	'Dallas Fort Worth International', 'Dallas-Fort Worth', 'TX');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('DEN',	'Denver International',	'Denver', 'CO');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('JFK',	'John F Kennedy International',	'New York', 'NY');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SFO',	'San Francisco International', 'San Francisco', 'CA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('CLT', 'Charlotte Douglas International', 'Charlotte',	'NC');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('LAS',	'McCarran International',	'Las Vegas',	'NV');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('PHX',	'Phoenix Sky Harbor International',	'Phoenix',	'AZ');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('IAH',	'George Bush Intercontinental Houston',	'Houston',	'TX');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('MIA',	'Miami International',	'Miami',	'FL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('MCO',	'Orlando International',	'Orlando',	'FL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('EWR',	'Newark Liberty International',	'Newark',	'NJ');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SEA',	'Seattle Tacoma International',	'Seattle',	'WA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('MSP',	'Minneapolis-St Paul International/Wold-Chamberlain',	'Minneapolis',	'MN');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('DTW',	'Detroit Metropolitan Wayne County',	'Detroit',	'MI');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('PHL',	'Philadelphia International',	'Philadelphia',	'PA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('BOS',	'General Edward Lawrence Logan International',	'Boston',	'MA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('LGA',	'La Guardia',	'New York',	'NY');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('FLL',	'Fort Lauderdale Hollywood International',	'Fort Lauderdale',	'FL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('BWI',	'Baltimore/Washington International Thurgood Marshall',	'Baltimore',	'MD');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('IAD',	'Washington Dulles International',	'Washington',	'MD');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SLC',	'Salt Lake City International',	'Salt Lake City',	'UT');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('DCA',	'Ronald Reagan Washington National',	'Washington',	'DC');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('MDW',	'Chicago Midway International',	'Chicago',	'IL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('HNL',	'Honolulu International',	'Honolulu', 'HI');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SAN',	'San Diego International',	'San Diego',	'CA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('TPA',	'Tampa International',	'Tampa',	'FL');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('CLE',	'Cleveland Hopkins International',	'Cleveland',	'OH');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('PDX',	'Portland International',	'Portland',	'OR');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('STL',	'Lambert St Louis International',	'St Louis',	'MO');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('HOU',	'William P Hobby',	'Houston',	'TX');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('OAK',	'Metropolitan Oakland International',	'Oakland',	'CA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('MCI',	'Kansas City International',	'Kansas City',	'MO');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('BNA',	'Nashville International',	'Nashville',	'TN');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('AUS',	'Austin Bergstrom International',	'Austin',	'TX');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('RDU',	'Raleigh Durham International',	'Raleigh/Durham',	'NC');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SMF',	'Sacramento International',	'Sacramento',	'CA');
INSERT INTO `airline_system`.`airport` (`Airport_code`, `Name`, `City`, `State`) VALUES ('SNA',	'John Wayne-Orange County',	'Santa Ana',	'CA');

-- inserting into AIRPLANE_TYPE
-- delete from airline_system.airplane_type;
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('L76', '10', 'Boeing');
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('L77', '12', 'Boeing');
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('M99', '10', 'Lockheed');
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('MM2', '14', 'Lockheed');
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('A36', '10', 'Airbus');
INSERT INTO `airline_system`.`airplane_type` (`Airplane_type_name`, `Max_seats`, `Company`) VALUES ('A38', '16', 'Airbus');


-- inserting into flight table
insert into flight values ('E215','Etihad','Mon_Tue_Wed');
insert into flight values ('Q221','Qatar','Tue_Wed_Sun');
insert into flight values ('EM311','Emirates','Sat');
insert into flight values ('E312','Etihad','Mon_Wed');
insert into flight values ('E111','AirIndia','Tue_Wed');
insert into flight values ('EL198','Lufthansa','Fri_Sun');
insert into flight values ('E512','Lufthansa','Mon_Wed');


-- inserting into airplane table
insert into airplane values ('A1',10,'Boeing');
insert into airplane values ('A2',20,'Airbus');
insert into airplane values ('A3',15,'Airbus');


-- inserting into flight_instance
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('E111', '2014-12-20', '10', 'A1', 'DFW', '20:12:00', 'JFK', '23:15:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('E215', '2014-09-26', '10', 'A1', 'LAX', '20:12:00', 'BOS', '23:15:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('E312', '2014-11-10', '10', 'A1', 'JFK', '19:12:00', 'BOS', '21:15:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('E512', '2014-12-20', '10', 'A1', 'DFW', '20:12:00', 'JFK', '23:15:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('EL198', '2014-12-24', '20', 'A2', 'DFW', '3:12:00', 'LAX', '6:15:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('EM311', '2014-06-01', '15', 'A3', 'DFW', '20:12:00', 'BOS', '1:30:00');
INSERT INTO `airline_system`.`flight_instance` (`Flight_number`, `Date`, `number_of_available_seats`, `Airplane_id`, `Departure_airport_code`, `Departure_time`, `Arrival_airport_code`, `Arrival_time`) VALUES ('Q221', '2014-05-26', '20', 'A2', 'LAX', '23:12:00', 'BWI', '5:15:00');

-- inserting into fare table
INSERT INTO `airline_system`.`fare` (`Flight_number`, `Fare_code`, `Amount`, `Restrictions`) VALUES ('E215', 'USD', '750', 'NA');


-- inserting into seat_reservation

INSERT INTO `airline_system`.`seat_reservation` (`Flight_number`, `Date`, `Seat_number`, `Customer_name`, `Customer_phone`) VALUES ('E215', '2014-09-26', 'E25', 'Heet Vachhani', '4694381912');
INSERT INTO `airline_system`.`seat_reservation` (`Flight_number`, `Date`, `Seat_number`, `Customer_name`, `Customer_phone`) VALUES ('E312', '2014-11-10', 'A15', 'Dev Patel', '123456789');
