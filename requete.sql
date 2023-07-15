/*1.Afficher la liste des réceptionnistes avec l'hôtel auquel ils sont rattachés :*/
SELECT r.id_employee, r.last_name, h.hotel_name
FROM receptionist r
JOIN hotel h ON r.id_hotel = h.id_hotel

/*2.Afficher la liste des réservations en commençant par la plus récente pour un hôtel donné*/
SELECT *
FROM reservation
WHERE id_client = 1
ORDER BY date_arrived DESC;

/*3.Afficher une liste des chambres d'un type donné dans un hôtel donné*/
SELECT *
FROM room
WHERE room_type = 'Double' AND id_hotel = 4

/*5.Afficher la liste des réservations d'un client donné*/
SELECT *
FROM reservation
WHERE id_client = 4;

/*6-Afficher la liste des clients qui n'ont pas encore payé en totalité leurs frais :*/
SELECT c.id_client, c.last_name
FROM client c
JOIN payment p ON c.id_client = p.id_client
WHERE p.total_amount_status = TRUE

/*7.Afficher le total des paiements reçus par mobile money :*/
SELECT SUM(amount_paid)
FROM payment p
JOIN payment_method pm ON p.id_payment = pm.id_payment_method
WHERE pm.mobile_money = TRUE;

/*8.Afficher le nombre de réservations effectuées par un client donné pendant une période donnée*/
SELECT COUNT(*)
FROM reservation
WHERE id_client = 1 AND date_arrived BETWEEN '"2023-07-15"' AND '"2023-07-26"'

/*medium*/
/*1.afficher combien de fois un client a réservé dans tous les hôtels */
SELECT c.id_client, c.last_name, COUNT(*) AS total_reservations
FROM client c
JOIN reservation r ON c.id_client = r.id_client
GROUP BY c.id_client, c.last_name;

/*2.afficher une liste des chambres d'un type donné dans un hôtel donné */
SELECT r.id_room, r.number, r.room_type
FROM room r
JOIN hotel h ON r.id_hotel = h.id_hotel
WHERE r.room_type = 'single' AND h.id_hotel = 3;

/*3.afficher les hôtels avec le nombre de chambres par hôtel */
SELECT h.id_hotel, h.hotel_name, COUNT(r.id_room) AS total_rooms
FROM hotel h
LEFT JOIN room r ON h.id_hotel = r.id_hotel
GROUP BY h.id_hotel, h.hotel_name;
