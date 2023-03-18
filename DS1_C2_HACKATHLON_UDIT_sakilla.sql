use sakila;
show tables;

select * from actor;
select * from actor_info;

/* TASK 1 to show list of actors and last updated date*/

select actor_id,concat(first_name,' ', last_name) as full_name,last_update from actor;

/* TASK 2A change in actor's first name or last name*/
select a1.first_name,a1.last_name from actor a1 join
actor_info a2 on a1.actor_id=a2.actor_id where a1.first_name!=a2.first_name or a1.last_name != a2.last_name;

select a1.first_name,a1.last_name from actor a1 where a1.first_name=a1.last_name; 

/* TASK 2B same first name and last name*/
select concat(first_name,' ',last_name) as full_name  from actor group by full_name having count(full_name)>1;

select a1.first_name,a1.last_name from actor a1 where a1.first_name=a1.last_name; 

select* from actor where first_name='Susan';


/* TASK 2C unique names as well as count*/

select concat(first_name,' ',last_name) as full_name  from actor group by full_name having count(full_name)=1;

select count(distinct concat(first_name,' ',last_name)) as total from actor; 

select distinct last_name,first_name
 from actor;
select count(distinct last_name),count(distinct first_name)
 from actor;

/* TASK 3 list of actors*/

/* names repeated */

select concat(first_name,' ',last_name) as full_name  from actor group by full_name having count(full_name)>1;

/* names not repeated */

select concat(first_name,' ',last_name) as full_name  from actor group by full_name having count(full_name)=1;


select * from category;

/* TASK 4 categores actors based on conditions detailed overview according to preference  */

/* right */

select a.actor_id,concat(a.first_name,' ',a.last_name) as full_name,c.name,count(f.film_id) as total
from actor a join film_actor f on a.actor_id=f.actor_id
join film f1 on f.film_id=f1.film_id  join film_category f2 on f1.film_id=f2.film_id join category c on f2.category_id=c.category_id
group by full_name,c.name order by total desc;


select first_name ,category
from actor_info a  inner join film_actor f on a.actor_id=f.actor_id inner join film_text f1 
on f.film_id=f1.film_id inner join film_list f2 on f1.title=f2.title 
group by first_name,category  ;




select concat(a.first_name,' ',a.last_name) as full_name,f1.category from actor a   join film_actor f on
a.actor_id=f.actor_id join film_list f1 on f.film_id=f1.FID group by full_name;


select first_name ,category
from actor_info a  inner join film_actor f on a.actor_id=f.actor_id inner join film_text f1 
on f.film_id=f1.film_id inner join film_list f2 on f1.title=f2.title 
group by first_name,category  ;


/* TASK 5  according to category as well as rating*/
/* according to category */

select category,rating,count(*) as total_count from film_list group by category order by total_count desc;

/* according to rating */

select category,rating,count(*) as total_count from film_list group by rating order by total_count desc;
select * from film;

/* for kids */
select title,description,category,rating from film_list where rating='G';

/* under 16 */

select title,description,category,rating from film_list where rating='R';

/* for adult */

select title,description,category,rating from film_list where rating='NC-17';



select * from film;
desc film;
/*  rep_cost =19.99 default */

/* TASK 6 A replacement_cost <9*/

select title,replacement_cost from film where replacement_cost<=9.00;

/* TASK 6B  replacement_cost between */

select title,replacement_cost from film where replacement_cost between 15 and 20;

/* TASK 6C movies with high replacement cost and low rental_rate */

select title,rental_rate,replacement_cost from film where rental_rate<(select avg(rental_rate) from film) and 
replacement_cost>(select avg(replacement_cost) from film) order by replacement_cost desc;

select title,rental_rate,replacement_cost from film where rental_rate=(select min(rental_rate) from film) and 
replacement_cost=(select max(replacement_cost) from film);

select * from film_list;
select * from actor_info;
select * from film_text;
select * from film_actor;


/* TASK 7 list of all films and number of actors in each film */

select * from film_list;

select title,count(f1.actor_id) as Number_of_actors from film_text f join film_actor f1 on f.film_id=f1.film_id group by title
order by number_of_actors desc;

SELECT title, COUNT(actor_id) as Number_of_Actors
from film_actor f join  film f1 on f.film_id=f1.film_id
group by title order by number_of_actors desc;

select * from film;


/* TASK 8 */


select title from film where title like 'K%' or  title like 'Q%';



/* TASK 9 names of actors in Agent Truman*/
select * from film_list where title='Agent Truman';


select concat(a.first_name,' ',a.last_name) as full_name,f1.title from actor a join film_actor f
on a.actor_id=f.actor_id join film f1 on f.film_id=f1.film_id where title='Agent Truman';

select concat(a.first_name,' ',a.last_name) as full_name,f1.title from actor a join film_actor f
on a.actor_id=f.actor_id join film f1 on f.film_id=f1.film_id where title='Agent Truman';


/* TASK 10*/


select f.title,c.name from film f join film_category f1 on f.film_id=f1.film_id join category c on f1.category_id =c.category_id
where c.name='Family';


/* TASK 11  most frequently rented*/

select * from inventory;

select title,count(r.rental_id) as most_rented from category c join film_category f1
on c.category_id=f1.category_id join film f2 on f1.film_id=f2.film_id
join inventory i on f2.film_id=i.film_id join rental r on r.inventory_id=i.inventory_id group by title order by most_rented desc;



/* TASK 12 film catregories in which average difference between replacement and rental_cost is greater then 15*/


select f.replacement_cost,f.rental_rate,f1.category_id,c.name 
from film f join film_category f1 on f.film_id=f1.film_id join category c on f1.category_id=c.category_id 
group by c.name having avg(replacement_cost -rental_rate)>15;


select f.replacement_cost,f.rental_rate,f1.category_id,c.name 
from film f join film_category f1 on f.film_id=f1.film_id join category c on f1.category_id=c.category_id 
group by c.name having avg((replacement_cost) -(rental_rate))>15;


/* TASK 13 identify genres having 60 to 70 films */
select * from film_category;
select * from category;

select  c1.category_id,c1.name, COUNT(f.film_id) as number_of_films
from film f join film_category c on f.film_id=c.film_id join category c1 on c1.category_id=c.category_id
group by c1.category_id having number_of_films between 60 and 70
order by Number_of_films desc;













select  name, COUNT(film_id) as number_of_films
FROM film_category f join category c on f.category_id=c.category_id
group by c.category_id having number_of_films between 60 and 70
order by Number_of_films desc;








  