ALTER table passengers
add constraint chk_date_of_birth CHECK ( AGE(date_of_birth)  >= interval '10 years');

alter table booking
add constraint chk_ticket_price check(ticket_price > 0 and ticket_price <= 50000);

alter table baggage
add constraint chk_weighInKg check ( weight_in_kg >= 1 and weight_in_kg <= 23 )
not valid;

alter table airport
add constraint chk_airport_name check (length(airport_name) >= 10 );

--5 unique
Alter table airline
add constraint unique_airline_country
unique (airline_code);

Alter table airport
add constraint unique_state
unique (state);

alter table baggage
add constraint unique_weight_in_kg
unique (weight_in_kg);

alter table baggage_check
add constraint unique_baggage_check_id
unique (baggage_check_id);

alter table boarding_pass
add constraint unique_seat
unique (seat);

alter table booking
add constraint unique_ticket_price
unique (ticket_price);

alter table booking_flight
add constraint unique_booking_flight_id
unique (booking_flight_id);

alter table flights
add constraint unique_departing_gate
unique (departing_gate);

alter table passengers
add constraint unique_date_of_birth
unique (date_of_birth);

alter table security_check
add constraint unique_security_check_id
unique (security_check_id);

--6
alter table passengers
add constraint chk_gender_age check ( gender = 'Male' and age(date_of_birth) >= interval '18 years' or
                                      gender = 'Female' and age(date_of_birth) >= interval '19 years')
not valid ;

alter table passengers
add constraint chk_country_of_citizenship
check ( country_of_citizenship = 'Kazakhstan' and age(date_of_birth) >= interval '18 years' or
        country_of_citizenship = 'France' and age(date_of_birth) >= interval '17 years' or
        country_of_citizenship not in ('France', 'Kazakhstan') and age(date_of_birth) >= interval '19 years')
not valid;

alter table booking
add column ticket_discount decimal;

alter table booking
add constraint chk_ticket_discount
check(created_at >= '2024-01-01' and ticket_discount = ticket_price * 0.05 or
      created_at < '2024-01-01' and ticket_discount = ticket_price * 0.10)
