use sakila;
-- Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
select title, length, rank() over (order by length desc) as 'Rank'
from film
WHERE length IS NOT NULL AND length > 0;

-- Rank films by length within the rating category (filter out the rows with nulls or zeros in length column)
-- . In your output, only select the columns title, length, rating and rank.

select title, length ,rating, rank() over (partition by rating order by length desc) as "Ranks"
from film
WHERE length IS NOT NULL AND length > 0;

-- How many films are there for each of the categories in the category table?
-- Hint: Use appropriate join between the tables "category" and "film_category".

select * from category;

SELECT c.name, COUNT(*) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- Which actor has appeared in the most films?
--  Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

select a.actor_id, a.first_name, a.last_name, count(*) as film_count
from actor a
join film_actor on a.actor_id = film_actor.actor_id
group by a.actor_id, a.first_name, a.last_name
order by film_count desc
limit 1;

-- or


-- Which is the most active customer (the customer that has rented the most number of films)? 
-- Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

select customer.customer_id, customer.first_name, customer.last_name, count(*) as customer_count
from customer
join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, customer.first_name, customer.last_name;


