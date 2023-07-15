
INSERT INTO province_available (province_name, code_province)
VALUES
    ('Province A', 123),
    ('Province B', 456),
    ('Province C', 789),
    ('Province D', 987),
    ('Province E', 654),
    ('Province F', 321),
    ('Province G', 951),
    ('Province H', 753),
    ('Province I', 246),
    ('Province J', 468);


INSERT INTO hotel (hotel_name, address, id_province)
VALUES
    ('Hotel A', '123 Main Street', 1),
    ('Hotel B', '456 Elm Street', 2),
    ('Hotel C', '789 Oak Street', 3),
    ('Hotel D', '321 Pine Street', 1),
    ('Hotel E', '654 Maple Street', 2),
    ('Hotel F', '987 Cherry Street', 3),
    ('Hotel G', '456 Cedar Street', 1),
    ('Hotel H', '789 Walnut Street', 2),
    ('Hotel I', '321 Oak Street', 3),
    ('Hotel J', '654 Elm Street', 2);


INSERT INTO receptionist (first_name, last_name, password, email, work_contact, id_hotel)
VALUES
    ('John', 'Smith', 'abc123', 'john.smith@example.com', '1234567890', 1),
    ('Emily', 'Johnson', 'pass456', 'emily.johnson@example.com', '9876543210', 2),
    ('Michael', 'Williams', 'secret', 'michael.williams@example.com', '5555555555', 1),
    ('Emma', 'Brown', 'test123', 'emma.brown@example.com', '9998887777', 3),
    ('Daniel', 'Jones', '123abc', 'daniel.jones@example.com', '7777777777', 2),
    ('Sophia', 'Davis', 'qwerty', 'sophia.davis@example.com', '5551112222', 1),
    ('Matthew', 'Taylor', 'password1', 'matthew.taylor@example.com', '3334445555', 2),
    ('Olivia', 'Martinez', 'abcxyz', 'olivia.martinez@example.com', '7778889999', 3),
    ('James', 'Anderson', 'pass123', 'james.anderson@example.com', '6667778888', 1),
    ('Ava', 'Harris', 'hello123', 'ava.harris@example.com', '8889990000', 2);


INSERT INTO client (name, last_name, principal_contact, address, emergency_number, gender, CIN, email, password, id_employee)
VALUES
    ('Emma', 'Johnson', '1234567890', '123 Main Street', '9876543210', 'F', '123456789', 'emma.johnson@example.com', 'pass123', 1),
    ('Liam', 'Smith', '9876543210', '456 Elm Street', '1234567890', 'M', '987654321', 'liam.smith@example.com', 'password123', 2),
    ('Olivia', 'Brown', '5555555555', '789 Oak Street', '5555555555', 'F', '987654321', 'olivia.brown@example.com', 'pass456', 1),
    ('Noah', 'Miller', '9998887777', '321 Pine Street', '5555555555', 'M', '123456789', 'noah.miller@example.com', 'password456', 3),
    ('Ava', 'Davis', '7777777777', '654 Maple Street', '9998887777', 'F', '987654321', 'ava.davis@example.com', 'pass789', 2),
    ('Sophia', 'Wilson', '1112223333', '987 Cherry Street', '1234567890', 'F', '123456789', 'sophia.wilson@example.com', 'password789', 1),
    ('Jackson', 'Martinez', '3334445555', '456 Cedar Street', '9876543210', 'M', '987654321', 'jackson.martinez@example.com', 'passabc', 2),
    ('Isabella', 'Taylor', '7778889999', '789 Walnut Street', '5555555555', 'F', '123456789', 'isabella.taylor@example.com', 'passwordabc', 1),
    ('Sophia', 'Anderson', '6667778888', '321 Oak Street', '9998887777', 'F', '987654321', 'sophia.anderson@example.com', 'passxyz', 3),
    ('Mason', 'Harris', '8889990000', '654 Elm Street', '1234567890', 'M', '123456789', 'mason.harris@example.com', 'passwordxyz', 2);


INSERT INTO service (service_name, description, price, reduction)
VALUES
    ('Service A', 'Description A', 10.50, 0.05),
    ('Service B', 'Description B', 15.25, 0.1),
    ('Service C', 'Description C', 20.00, 0.15),
    ('Service D', 'Description D', 12.75, 0.2),
    ('Service E', 'Description E', 8.99, 0.1),
    ('Service F', 'Description F', 25.50, 0.3),
    ('Service G', 'Description G', 18.75, 0.1),
    ('Service H', 'Description H', 14.99, 0.2),
    ('Service I', 'Description I', 9.50, 0.05),
    ('Service J', 'Description J', 12.25, 0.1);


INSERT INTO buy (id_client, id_service)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);


INSERT INTO feedback (comment, rating, id_client)
VALUES
    ('Great service!', 5, 1),
    ('Average experience.', 3, 2),
    ('Highly recommended!', 5, 3),
    ('Needs improvement.', 2, 4),
    ('Excellent stay!', 5, 5),
    ('Friendly staff.', 4, 6),
    ('Good value for money.', 4, 7),
    ('Not satisfied.', 2, 8),
    ('Amazing hospitality!', 5, 9),
    ('Poor service.', 1, 10);


INSERT INTO status_client (status_arrived, status_missing, in_fidelity, in_blacklist, id_client)
VALUES
    (3, 1, TRUE, FALSE, 1),
    (2, 0, FALSE, FALSE, 2),
    (1, 0, FALSE, TRUE, 3),
    (1, 1, TRUE, FALSE, 4),
    (3, 0, TRUE, FALSE, 5),
    (2, 0, FALSE, FALSE, 6),
    (1, 0, FALSE, TRUE, 7),
    (3, 0, FALSE, TRUE, 8),
    (2, 1, TRUE, FALSE, 9),
    (3, 0, TRUE, FALSE, 10);


INSERT INTO reservation (date_arrived, leaving_date, number_of_person, is_canceled, id_client)
VALUES
    ('2023-07-15', '2023-07-20', 2, FALSE, 1),
    ('2023-07-16', '2023-07-19', 1, FALSE, 2),
    ('2023-07-18', '2023-07-23', 3, FALSE, 2),
    ('2023-07-19', '2023-07-22', 2, TRUE, 4),
    ('2023-07-20', '2023-07-25', 4, FALSE, 5),
    ('2023-07-22', '2023-07-24', 2, FALSE, 6),
    ('2023-07-23', '2023-07-26', 1, TRUE, 3),
    ('2023-07-25', '2023-07-30', 3, FALSE, 8),
    ('2023-07-26', '2023-07-29', 2, FALSE, 9),
    ('2023-07-27', '2023-08-01', 2, FALSE, 10);


INSERT INTO payment (payment_date, amount_paid, number_night, room_occupied, deadline_payment, lending_status, total_amount_status, id_client, id_employee)
VALUES
    ('2023-07-20', 100.00, 5, 2, '2023-07-30', FALSE, TRUE, 1, 1),
    ('2023-07-19', 150.00, 4, 1, '2023-07-29', FALSE, TRUE, 2, 2),
    ('2023-07-23', 200.00, 5, 3, '2023-07-30', FALSE, TRUE, 3, 1),
    ('2023-07-22', 135.00, 3, 2, '2023-07-25', TRUE, TRUE, 4, 3),
    ('2023-07-25', 180.00, 6, 4, '2023-07-31', FALSE, TRUE, 5, 2),
    ('2023-07-24', 255.00, 2, 2, '2023-07-27', FALSE, TRUE, 6, 1),
    ('2023-07-26', 190.00, 3, 1, '2023-07-31', TRUE, TRUE, 7, 2),
    ('2023-07-29', 210.00, 5, 3, '2023-08-05', FALSE, TRUE, 8, 1),
    ('2023-07-28', 165.00, 4, 2, '2023-08-01', FALSE, TRUE, 9, 3),
    ('2023-07-31', 230.00, 6, 2, '2023-08-07', FALSE, TRUE, 10, 2);


INSERT INTO payment_method (mobile_money, credit_card, cash)
VALUES
    (TRUE, FALSE, TRUE),
    (TRUE, TRUE, FALSE),
    (TRUE, TRUE, TRUE),
    (FALSE, TRUE, TRUE),
    (TRUE, FALSE, FALSE),
    (TRUE, TRUE, TRUE),
    (FALSE, TRUE, FALSE),
    (TRUE, FALSE, TRUE),
    (FALSE, FALSE, TRUE),
    (TRUE, TRUE, TRUE);


INSERT INTO choose (id_payment, id_payment_method)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 1),
    (8, 2),
    (9, 3),
    (10, 1);


INSERT INTO room_features (id_features, sea_view, vip_category, hot_water, wifi_available, room_service, mini_bar, flat_screen)
VALUES
    (1, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    (2, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE),
    (3, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE),
    (4, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE),
    (5, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
    (6, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE),
    (7, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
    (8, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE),
    (9, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE),
    (10, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE);


INSERT INTO room (number, room_type, capacity_room, id_reservation, id_hotel, id_features)
VALUES
    ('101', 'Single', 1, 1, 1, 1),
    ('102', 'Double', 2, 2, 2, 2),
    ('103', 'Single', 1, 3, 3, 3),
    ('104', 'Double', 2, 4, 4, 4),
    ('105', 'Single', 1, 5, 5, 5),
    ('201', 'Double', 2, 6, 6, 6),
    ('202', 'Single', 1, 7, 7, 7),
    ('203', 'Double', 2, 8, 8, 8),
    ('204', 'Single', 1, 9, 9, 9),
    ('205', 'Double', 2, 10, 10, 10);


INSERT INTO promotion (name, begin_date, end_date, percent)
VALUES
    ('Promotion A', '2023-07-01', '2023-07-31', 10),
    ('Promotion B', '2023-08-01', '2023-08-31', 15),
    ('Promotion C', '2023-09-01', '2023-09-30', 20),
    ('Promotion D', '2023-10-01', '2023-10-31', 25),
    ('Promotion E', '2023-11-01', '2023-11-30', 30),
    ('Promotion F', '2023-12-01', '2023-12-31', 35),
    ('Promotion G', '2024-01-01', '2024-01-31', 40),
    ('Promotion H', '2024-02-01', '2024-02-28', 45),
    ('Promotion I', '2024-03-01', '2024-03-31', 50),
    ('Promotion J', '2024-04-01', '2024-04-30', 55);


INSERT INTO have (id_room, id_promotion)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);


INSERT INTO season (season_name, start_date, end_date)
VALUES
    ('Season A', '2023-07-01', '2023-09-30'),
    ('Season B', '2023-10-01', '2023-12-31'),
    ('Season C', '2024-01-01', '2024-03-31'),
    ('Season D', '2024-04-01', '2024-06-30');


INSERT INTO price (cost_per_night, id_room, id_season)
VALUES
    (100.0, 1, 1),
    (150.0, 2, 2),
    (200.0, 3, 3),
    (250.0, 4, 4),
    (120.0, 5, 1),
    (180.0, 6, 2),
    (240.0, 7, 3),
    (300.0, 8, 4),
    (80.0, 9, 1),
    (120.0, 10, 2);
