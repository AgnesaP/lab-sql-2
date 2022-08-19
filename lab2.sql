USE sakila;


-- 1.Select all the actors with the first name ‘Scarlett’.

SELECT * FROM sakila.actor AS a WHERE a.first_name = "Scarlett";

-- 2.Select all the actors with the last name ‘Johansson’.

SELECT * FROM sakila.actor AS a WHERE a.last_name = "Johansson";

-- 3. How many films (movies) are available for rent?
SELECT COUNT(DISTINCT i.film_id) available_movies FROM sakila.inventory AS i 
LEFT JOIN sakila.rental AS r ON r.inventory_id  = i.inventory_id
WHERE r.rental_date IS NULL OR r.rental_date < current_date;

-- 4. How many films have been rented?
SELECT COUNT(DISTINCT i.film_id) rented_movies FROM sakila.inventory AS i 
LEFT JOIN sakila.rental AS r ON r.inventory_id  = i.inventory_id
WHERE r.inventory_id IS NOT NULL;

-- 5.What is the shortest and longest rental period?
SELECT MIN(DATEDIFF(return_date, r.rental_date)) AS shortest_rental_period_days, MAX(DATEDIFF(return_date, r.rental_date)) AS longest_rental_period_days FROM sakila.rental AS r;

-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(f.length) AS min_duration, MAX(f.length) AS max_duration from sakila.film AS f;

-- 7. What's the average movie duration?
SELECT AVG(f.length) AS avg_movie_length FROM sakila.film AS f;

-- 8. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(AVG(f.length)/60),'h ',ROUND(AVG(MOD(f.length,60)),0),'m') AS avg_movie_length FROM sakila.film AS f; 

-- 9. How many movies longer than 3 hours?
SELECT COUNT(film_id) number_of_movies FROM film WHERE (length/60) > 3;

-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT CONCAT(c.first_name, ' ', c.last_name, ' - ' , LOWER(c.email)) AS full_contact FROM sakila.customer AS c;

-- 11. What's the length of the longest film title?
SELECT f.title, MAX(length(title)) AS max_title_length FROM sakila.film AS f;



