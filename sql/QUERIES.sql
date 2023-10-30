QUERIES

1) List actors and their film count, ordered by the number of films they've appeared in:
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(af.film_id) AS film_count
FROM actor a
LEFT JOIN actor_film af ON a.actor_id = af.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC;


2) List actors who have appeared in more than 10 films:
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(af.film_id) AS film_count
FROM actor a
LEFT JOIN actor_film af ON a.actor_id = af.actor_id
GROUP BY a.actor_id
HAVING film_count > 10;


3) Find the actor who appeared in the most films:
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(af.film_id) AS film_count
FROM actor a
LEFT JOIN actor_film af ON a.actor_id = af.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;

4) List the top 10 longest films:
SELECT f.title AS film_title, f.length
FROM film f
ORDER BY f.length DESC
LIMIT 10;

5) Find the actors who have not appeared in any films:
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name
FROM actor a
LEFT JOIN actor_film af ON a.actor_id = af.actor_id
WHERE af.actor_id IS NULL;

6) Find the category of each film 
SELECT title, name 
FROM film AS f
LEFT JOIN category AS c on f.category_id=c.category_id
WHERE name not in ("unknown");
