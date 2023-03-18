use sakilla;
select * from inventory;


select count(*) from category;
select * from film;
select * from film_actor;
desc address;


select * from film;


select i.film_id,count(i.inventory_id) as no_units from inventory i group by film_id 
having i.film_id in (select f.film_id from film f where f.title in ("BROTHERHOOD BLANKET","SOUP WISDOM"));


select f.title,f.film_id from film f where f.title in ("BROTHERHOOD BLANKET","SOUP WISDOM");

select i.film_id,count(i.inventory_id) as no_units from inventory i group by film_id;


select (select count(i.inventory_id) from inventory i where i.film_id=f.film_id) as count_no,f.film_id,f.title 
from film f where f.title in ("BROTHERHOOD BLANKET","SOUP WISDOM");

select * from film;



select * from film_category;


select * from category;

select (select count(f.film_id) from film_category f where f.category_id=c.category_id) as count_each_genre,
c.category_id,c.name from category c;

select count(f.film_id),f.category_id from film_category f group by f.category_id;

select * from actor;

select * from film;

select * from film_actor where film_id=1;


select * from film_actor;


 

select (select concat(a.first_name,' ',a.last_name) from actor a where a.actor_id=z.actor_id) as actor_name,z.* from (select t.actor_id,
avg(t.rep_cost_film) as rep_cost_actor from (select (select f.replacement_cost from film f where f.film_id=a.film_id) as rep_cost_film,
a.* from film_actor as a) as t group by t.actor_id order by avg(t.rep_cost_film) desc) as z limit 3;


select t.actor_id,
avg(t.rep_cost_film) as rep_cost_actor from (select (select f.replacement_cost from film f where f.film_id=a.film_id) as rep_cost_film,
a.* from film_actor as a) as t group by t.actor_id order by avg(t.rep_cost_film) desc;


(select t.actor_id,
avg(t.rep_cost_film) as rep_cost_actor from (select (select f.replacement_cost from film f where f.film_id=a.film_id) as rep_cost_film,
a.* from film_actor as a) as t group by t.actor_id order by avg(t.rep_cost_film) desc) ;


select * from actor;



select * from payment;

select * from sales_by_film_category;



select * from sales_by_store;
select * from customer;

select * from payment;

select * from film;


select * from rental;


select * from inventory;

select * from store;


select * from customer;


select * from payment;

select sum(total_sales) from sales_by_store;

select sum(a.amount) from payment a;



select * from film;




