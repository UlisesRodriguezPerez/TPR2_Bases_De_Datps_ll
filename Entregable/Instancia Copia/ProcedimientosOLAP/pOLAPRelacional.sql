-- para un mes dado, sin importar el año, dar para cada categoría de película el número de alquileres realizados
select  date_part('month',rental_date) as mes, c.name,
        count(*) as num_alquileres
from rental r inner join inventory i      on r.inventory_id = i.inventory_id
              inner join film_category fc on i.film_id = fc.film_id
              inner join category c       on fc.category_id = c.category_id
where date_part('month',rental_date)=7
group by mes, c.name
order by mes, c.name;

-- 	dar el número de alquileres y el monto cobrado, por duración del préstamo
select (date_part ('day',  return_date - rental_date )) +
        ceiling(date_part ('hour', return_date - rental_date ) /24) as duracion,
        count(*), sum(amount)
from rental r inner join payment p on r.rental_id = p.rental_id
where return_date is not null
group by duracion
order by duracion;

-- hacer un rollup por año y mes para el monto cobrado por alquileres
select date_part('year',  rental_date) as anno,
       date_part('month', rental_date) as mes,
       sum(amount)
from rental r inner join payment p on r.rental_id = p.rental_id
group by rollup (anno, mes)
order by anno, mes


--	hacer un cubo por año y categoría de película para el número de alquileres y el monto cobrado
select  date_part('year',rental_date) as anno, c.name,
        count(*) as num_alquileres,
        sum(p.amount) as monto_cobrado
       --, r.rental_id, i.inventory_id, i.film_id, fc.category_id, rental_date
from rental r inner join inventory i      on r.inventory_id = i.inventory_id
              inner join film_category fc on i.film_id = fc.film_id
              inner join category c       on fc.category_id = c.category_id
              inner join payment  p       on r.rental_id = p.rental_id
group by cube (anno, c.name)
order by anno, c.name;



