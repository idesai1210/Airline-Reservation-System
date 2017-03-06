insert into airplane select * from airline_system.airplane;

insert into airplane_type select * from airline_system.airplane_type;

insert into airport select * from airline_system.airport;

insert into can_land select * from airline_system.can_land;

insert into flight_instance select flight_number,date, number_of_available_seats, airplane_id, Departure_time, arrival_time from airline_system.flight_instance;

insert into fare select * from airline_system.fare;

insert into seat_reservation select * from airline_system.seat_reservation;