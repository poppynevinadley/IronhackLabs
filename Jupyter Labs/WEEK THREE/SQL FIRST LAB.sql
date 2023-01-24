 SHOW TABLES FROM sakila;
SHOW FULL TABLES FROM sakila;
SELECT * FROM sakila.actor;
SELECT title from sakila.film;
SELECT DISTINCT name as 'Language'from sakila.language; #use sakila not need sakila on everything
SELECT COUNT(STORE_ID) FROM sakila.store;
SELECT COUNT(STAFF_ID) FROM sakila.staff;
SELECT STAFF_ID from sakila.staff; #to check if above is correct
SELECT first_name from sakila.staff; 

