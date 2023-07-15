/*11-Afficher la liste des chambres qui correspondent à un intervalle de prix donné par le client 
(remplacer min_price et max_price par les valeurs minimale et maximale des prix souhaités) :*/

SELECT room.id_room ,number ,room_type ,capacity_room , hotel.hotel_name ,price.cost_per_night
FROM room,hotel*
WHERE cost_per_night BETWEEN min_price AND max_price;
/*12-Afficher la liste des chambres par prix décroissant :*/

SELECT id_price_by_season, cost_per_night ,room.id_room ,id_season
FROM price
INNER JOIN room ON room.id_room = price.id_room
ORDER BY cost_per_night DESC;

/*13-Afficher la liste des chambres dont la description correspond à des mots-clés donnés (remplacer keywords par les mots-clés séparés par des espaces) :*/

SELECT id_room ,number ,room_type ,capacity_room ,hotel.hotel_name ,id_features
FROM room, hotel
WHERE room_type ILIKE '%keyword%';

/*14-Afficher la liste des hôtels qui contiennent des chambres dont la description 
correspond à des mots-clés donnés (remplacer keywords par les mots-clés séparés par des espaces) :*/

SELECT id_hotel ,hotel_name ,address , province_available.province_name
FROM hotel ,province_available
JOIN room ON hotel.id_hotel = room.id_hotel
WHERE room.room_type ILIKE '%keyword%';

/*15-Afficher les détails sur la chambre qu'occupe un client donné actuellement 
(remplacer id_client par l'identifiant du client souhaité) :*/

SELECT room.id_room,room_type ,capacity_room ,reservation.id_reservation ,hotel.hotel_name,id_features 
FROM room, hotel
WHERE reservation.id_client = id_client AND CURRENT_DATE BETWEEN reservation.date_arrived AND reservation.leaving_date;

/*16-Afficher l'hôtel avec le plus de réservations :*/

SELECT hotel.id_hotel, hotel_name ,address ,id_province
FROM hotel 
JOIN room  ON hotel.id_hotel = room.id_hotel
JOIN reservation ON room.id_reservation = reservation.id_reservation
GROUP BY hotel.id_hotel
ORDER BY COUNT(*) DESC
LIMIT 1;


/*17-Afficher l'hôtel avec le moins de réservations :*/

SELECT hotel.id_hotel, hotel_name ,address ,id_province
FROM hotel 
JOIN room  ON hotel.id_hotel = room.id_hotel
JOIN reservation ON room.id_reservation = reservation.id_reservation
GROUP BY hotel.id_hotel
ORDER BY COUNT(*) ASC
LIMIT 1;


/*18-Afficher le client avec le plus d'avis négatifs rédigés envers les hôtels :*/

SELECT client.id_client, name ,last_name ,principal_contact ,address ,emergency_number ,gender ,CIN , email ,password
FROM client 
JOIN feedback ON client.id_client = feedback.id_client
WHERE feedback.rating < 3
GROUP BY client.id_client
ORDER BY COUNT (*) DESC
LIMIT 1;