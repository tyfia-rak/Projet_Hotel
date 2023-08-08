INSERT INTO province_available (id_province,province_name, code_province)
VALUES
    (1,'Antananarivo', 101),
    (2,'Antsiranana', 201),
    (3,'Fianarantsoa', 301),
    (4,'Mahajanga', 401),
    (5,'Tamatave', 501),
    (6,'Toliara', 601);


INSERT INTO hotel (id_hotel,hotel_name, address, id_province)
VALUES
    (1,'Radisson', 'Tana Waterfront', 1),
    (2,'Le grand hotel diego', 'Diego suarez', 2),
    (3,'Tsara Guest House', '301 fianaratsoa', 3),
    (4,'baobab tree hotel & Spa', '207 Mahajanga', 4),
    (5,'Clypso Hotel', '501 Toamasina', 5),
    (6,'Soavadia', 'Toliara central', 6);
	
	/* transformer CIN en Varchar */
ALTER TABLE receptionist
ALTER COLUMN work_contact TYPE varchar(150);


INSERT INTO receptionist (id_employee,first_name, last_name, password, email, work_contact, id_hotel)
VALUES
    (1,'John', 'Smith', 'abc123', 'john.smith@example.com', '1234567890', 1),
    (2,'Emily', 'Johnson', 'pass456', 'emily.johnson@example.com', '9876543210', 2),
    (3,'Michael', 'Williams', 'secret', 'michael.williams@example.com', '5555555555', 3),
    (4,'Emma', 'Brown', 'test123', 'emma.brown@example.com', '9998887777', 4),
    (5,'Daniel', 'Jones', '123abc', 'daniel.jones@example.com', '7777777777', 5),
    (6,'Sophia', 'Davis', 'qwerty', 'sophia.davis@example.com', '5551112222', 6),
    (7,'Matthew', 'Taylor', 'password1', 'matthew.taylor@example.com', '3334445555', 1),
    (8,'Olivia', 'Martinez', 'abcxyz', 'olivia.martinez@example.com', '7778889999', 3),
    (9,'James', 'Anderson', 'pass123', 'james.anderson@example.com', '6667778888', 4),
    (10,'Ava', 'Harris', 'hello123', 'ava.harris@example.com', '8889990000', 6);
	
/* transformer CIN en Varchar */
ALTER TABLE client
ALTER COLUMN CIN TYPE varchar(150);

INSERT INTO client (id_client,name, last_name, principal_contact, address, emergency_number, gender, CIN, email, password, id_employee)
VALUES
    (1,'Emma', 'Johnson', '1234567890', '123 Main Street', '9876543210', 'F', '123456789', 'emma.johnson@example.com', 'pass123', 1),
    (2,'Liam', 'Smith', '9876543210', '456 Elm Street', '1234567890', 'M', '987654321', 'liam.smith@example.com', 'password123', 2),
    (3,'Olivia', 'Brown', '5555555555', '789 Oak Street', '5555555555', 'F', '987654321', 'olivia.brown@example.com', 'pass456', 3),
    (4,'Noah', 'Miller', '9998887777', '321 Pine Street', '5555555555', 'M', '123456789', 'noah.miller@example.com', 'password456', 4),
    (5,'Ava', 'Davis', '7777777777', '654 Maple Street', '9998887777', 'F', '987654321', 'ava.davis@example.com', 'pass789', 5),
    (6,'Sophia', 'Wilson', '1112223333', '987 Cherry Street', '1234567890', 'F', '123456789', 'sophia.wilson@example.com', 'password789', 6),
    (7,'Jackson', 'Martinez', '3334445555', '456 Cedar Street', '9876543210', 'M', '987654321', 'jackson.martinez@example.com', 'passabc', 2),
    (8,'Isabella', 'Taylor', '7778889999', '789 Walnut Street', '5555555555', 'F', '123456789', 'isabella.taylor@example.com', 'passwordabc', 1),
    (9,'Sophia', 'Anderson', '6667778888', '321 Oak Street', '9998887777', 'F', '987654321', 'sophia.anderson@example.com', 'passxyz', 3),
    (10,'Mason', 'Harris', '8889990000', '654 Elm Street', '1234567890', 'M', '123456789', 'mason.harris@example.com', 'passwordxyz', 4);


INSERT INTO service (id_service,service_name, description, price, reduction)
VALUES
    (1,'Spa & Bien-Être', ' massages relaxants et des saunas exclusifs', 10.50, 0.05),
    (2,'Restauration Gastronomique', 'Notre chef étoilé prépare une expérience culinaire', 15.25, 0.1),
    (3,'Service de Voiturier', ' profitez de notre service de voiturier professionnel disponible 24/7.', 20.00, 0.15),
    (4,'Piscine à Débordement', 'vue panoramique sur le paysage urbain environnant', 12.75, 0.2),
    (5,'Salle de Sport Haut de Gamme', ' Maintenez votre routine d`exercice dans notre salle de sport équipée des dernières technologies', 8.99, 0.1),
    (6,'Wi-Fi Haut Débit', ' Restez connecté avec une connexion Internet haut débit disponible dans tout l`établissement', 25.50, 0.3),
    (7,'Petit-Déjeuner Gourmand ', 'Commencez votre journée avec un petit-déjeuner fait maison, mettant en valeur les produits locaux et les saveurs authentiques de la région.', 18.75, 0.1);


INSERT INTO buy (id_client, id_service)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 1),
    (9, 5),
    (10, 4);


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


INSERT INTO status_client (id_status_client,status_arrived, status_missing, in_fidelity, in_blacklist, id_client)
VALUES
    (1,3, 1, TRUE, FALSE, 1),
    (2,2, 0, FALSE, FALSE, 2),
    (3,1, 0, FALSE, TRUE, 3),
    (4,1, 1, TRUE, FALSE, 4),
    (5,3, 0, TRUE, FALSE, 5),
    (6,2, 0, FALSE, FALSE, 6),
    (7,1, 0, FALSE, TRUE, 7),
    (8,3, 0, FALSE, TRUE, 8),
    (9,2, 1, TRUE, FALSE, 9),
    (10,3, 0, TRUE, FALSE, 10);


INSERT INTO reservation (id_reservation,date_arrived, leaving_date, number_of_person, is_canceled, id_client)
VALUES
    (1,'2023-07-15', '2023-07-20', 2, FALSE, 1),
    (2,'2023-07-16', '2023-07-19', 1, FALSE, 2),
    (3,'2023-07-18', '2023-07-23', 3, FALSE, 2),
    (4,'2023-07-19', '2023-07-22', 2, TRUE, 4),
    (5,'2023-07-20', '2023-07-25', 4, FALSE, 5),
    (6,'2023-07-22', '2023-07-24', 2, FALSE, 6),
    (7,'2023-07-23', '2023-07-26', 1, TRUE, 3),
    (8,'2023-07-25', '2023-07-30', 3, FALSE, 8),
    (9,'2023-07-26', '2023-07-29', 2, FALSE, 9),
    (10,'2023-07-27', '2023-08-01', 2, FALSE, 10);


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
    (TRUE, FALSE, FALSE),
    (TRUE, FALSE, FALSE),
    (FALSE, FALSE, TRUE),
    (FALSE, FALSE, FALSE),
    (FALSE, FALSE, TRUE),
    (FALSE, TRUE, FALSE),
    (FALSE, TRUE, FALSE),
    (FALSE, FALSE, TRUE),
    (FALSE, FALSE, TRUE),
    (FALSE, FALSE, TRUE);


INSERT INTO choose (id_payment, id_payment_method)
VALUES
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 21),
    (25, 22),
    (26, 23),
    (27, 21),
    (28, 24),
    (29, 28),
    (30, 24);


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
    ('202', 'Single', 1, 7, 3, 7),
    ('203', 'Double', 2, 8, 6, 8),
    ('204', 'Single', 1, 9, 1, 9),
    ('205', 'Double', 2, 10, 2, 10);


INSERT INTO promotion (name, "begin" , "end" , percent)
VALUES
    ('noel', '2023-12-25', '2023-01-26', 10),
    ('penteckote', '2023-08-01', '2023-08-31', 15),
    ('nouvel ans', '2023-12-30', '2024-01-08', 20),
    ('1 avril', '2023-04-01', '2023-04-02', 25),
    ('26 juin', '2023-06-23', '2023-06-30', 30),
    ('saint valentin', '2023-02-13', '2023-02-14', 35);


INSERT INTO have (id_room, id_promotion)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (2, 4),
    (5, 5),
    (6, 6),
    (7, 4),
    (8, 2),
    (9, 6),
    (10, 1);


INSERT INTO season (id_season,times, start_date, end_date)
VALUES
    (1,'Printemps', '2023-07-01', '2023-09-30'),
    (2,'Automne', '2023-10-01', '2023-12-31'),
    (3,'hiver', '2024-01-01', '2024-03-31'),
    (4,'été', '2024-04-01', '2024-06-30');



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