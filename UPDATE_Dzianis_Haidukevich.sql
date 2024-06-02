INSERT INTO film (title, description, release_year, language_id, rental_duration,
         rental_rate, length, replacement_cost, rating, special_features)
VALUES ('Shot Caller', 'A newly released prison gangster is forced by the leaders of his gang to orchestrate a major crime with a brutal rival gang on the streets of Southern California.',
     2017, 1, 14, 4.99, 121, 20.99, 'R', '{"Deleted Scenes"}');

INSERT INTO actor (first_name, last_name)
VALUES
('Leonardo', 'DiCaprio'),
('Joseph', 'Gordon-Levitt'),
('Elliot', 'Page');

INSERT INTO film_actor (actor_id, film_id)
VALUES
(301, 1002),
(302, 1002),
(303, 1002);


INSERT INTO inventory (film_id, store_id)
VALUES (1001,1);


UPDATE film
SET rental_duration = 21,
    rental_rate = 9.99
WHERE title = 'Shot Caller';


SELECT c.customer_id, c.first_name, c.last_name,
COUNT(r.rental_id) AS rental_count, COUNT(p.payment_id) AS payment_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) >= 10 AND COUNT(p.payment_id) >= 10
LIMIT 1;

SELECT address_id FROM address LIMIT 1;

UPDATE customer
SET first_name = 'Dzianis',
  last_name = 'Haidukevich',
  email = 'haidukevich.dzianis@student.ehu.lt',
  address_id = 1,
  create_date = CURRENT_DATE
WHERE customer_id = 16;

DELETE FROM inventory
WHERE film_id = 1001;

DELETE FROM film_actor
WHERE film_id = 1001;

DELETE FROM payment
WHERE customer_id = 16;

DELETE FROM rental
WHERE customer_id = 1;
