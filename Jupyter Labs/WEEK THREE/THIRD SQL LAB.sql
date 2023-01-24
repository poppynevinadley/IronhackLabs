use sakila;

#1. Which actor has appeared in the most films?

#1) first what do we want? the actor, so check where the information is in both and what joins
#i.e this time it is actor.id, then to get the name of the actor we will want the first and
#last name - basically get what it asks for. 
#2) select those items and if need amount of something count a column and rename as ie.film_count
#3) then has to be select from something so what table are they within? actor, so from actor then
#4) join to what another table is with another useful part of the q, the amount of films, so join
#film_actor then.
#5) using something they both have - (actor_id).
#6) then group by if need all of the films by that one actress per say so it will need to be grouped
#i.e in this case the actor_id, as that is what can ensure counts all the names, and films into one
#row, groups them. 
#7) then to get one actress and one film count, one row, and to get the most films only, need to order
#by the film_count, what we are counting and put a limit of one, and desc so we get the highest
#desc for highest, asc, for lowest. 
select actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
from actor 
join film_actor 
using (actor_id)
group by actor_id
order by film_count desc
limit 1;


#2. Most active customer (the customer that has rented the  most number of films). looking for customer id, name and second name 
#against renting films. so looking at tables. so possibly order by rental id. 

select customer.first_name, customer.last_name,
count(rental.rental_id) as rental_count
from rental join customer using (customer_id)
group by customer_id
order by rental_count desc 
limit 1;


#3. List number of films per category.
SELECT * from category;
select category.name, 
count(film_category.film_id) as films_per_cat
from film_category join category using (category_id)
group by category_id
order by category.name asc;

#4.	Display the first and last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address
	from staff 
	join address 
	USING (address_id);

#Changed the title names
select staff.first_name 'First Name', staff.last_name 'Last Name', address.address 'Address'
	from staff 
	join address 
	USING (address_id);
    
    
#5. Get films titles where the film language is either English or italian, and whose 
#titles starts with letter "M" , sorted by title descending.
select film.title
	from film
	where film.language_id = (select language_id from language where name = 'English' or 'Italian')
	and film.title like 'M%'
    ORDER BY film.title DESC;
  
  
#6. Display the total amount rung up by each staff member in August of 2005.  
#made prettier too
    select concat(s.first_name,' ',s.last_name) 'Staff Member', sum(p.amount) 'Total Amount'
	from payment p
	join staff s
	USING (staff_id)
	where payment_date like '2005-08%'
	group by p.staff_id;
    
    SELECT * FROM payment;

#7. List each film and the number of actors who are listed for that film.

select film.title, count(film_actor.actor_id)
	from film 
	join film_actor
	on film.film_id = film_actor.film_id
	group by film.title;
    
    #made easier with alias'
    select f.title, count(fa.actor_id)
	from film f
	join film_actor fa
	USING (film_id)
	group by f.title;


    #8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
    #List the customers alphabetically by last name.
    
	select customer.first_name, customer.last_name, sum(payment.amount)
	from payment 
	join customer
	USING (customer_id)
	group by payment.customer_id
    ORDER BY customer.last_name ASC;
    
#made it more beautiful 
 select concat(c.first_name,' ',c.last_name) 'Customer Name', sum(p.amount) 'Total Paid'
	from payment as p
	join customer as c
	USING (customer_id)
	group by p.customer_id
    ORDER BY c.last_name ASC;
   
#9. ---------------------- NOT DONE Write sql statement to check if you can find any actor who never particiapted in any film.

SELECT concat(actor.first_name,' ',actor.last_name) 'Name'
FROM actor 
LEFT JOIN film_actor
USING (actor_id)
WHERE film_actor.film_id IS NULL;

#10. Get the addresses that have NO customers, and ends with the letter "e"
SELECT address.address
FROM address                                      #as it should be from addresses without customers 
LEFT JOIN customer
USING (address_id)
WHERE customer.customer_id IS NULL 
and address.address like '%E';


#Optional - what is the most rented film?
SELECT a.first_name, act_lname, mov_title, mov_year
FROM actor
JOIN movie_cast 
ON actor.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 1990 and 2000;