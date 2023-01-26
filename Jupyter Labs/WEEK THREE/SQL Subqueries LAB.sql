use sakila;
SELECT first_name, last_name
FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor 
WHERE film_id = 1);

SELECT first_name, last_name							#get actor which has actor id inside this list 
FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor 
WHERE film_id = (SELECT film_id FROM film
WHERE title = 'Academy Dinosaur'));

#find actors played in certain film
#start with that film
#then have to get to film actor as need to get to actor names inside actor. 
#OR split it up into queries then organise them

#1. List all films whose length is longer than the average of all the films.
SELECT title FROM film 
WHERE length > (SELECT avg(length) from film); #cannot add agg functions inside our WHERE have to use SELECT

#2. How many copies of the film Hunchback Impossible exist in the inventory system?
# count(inventory_id)
SELECT count(inventory_id) FROM inventory 
WHERE film_id = (SELECT film_id FROM film
WHERE title = 'Hunchback Impossible');

#3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT concat(actor.first_name,' ',actor.last_name) 'Name' FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor 
WHERE film_id = (SELECT film_id FROM film
WHERE title = 'Alone Trip'));

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.
SELECT * from category;
SELECT title from film
WHERE film_id in (SELECT film_id FROM film_category
WHERE category_id = (SELECT category_id from category
WHERE name = 'family'));

#5. 




