-- para un mes dado, sin importar el año, dar para cada categoría de película el número de alquileres realizados
select TME.mes, FME."Categoria",
        count(*) as num_alquileres
from "Central" Ce 
inner join "film_ME" FME on Ce.film_id = FME."IDFilm"
inner join "tiempo_ME" TME on Ce.time_id = TME.rental_id
where TME.mes = 7
group by TME.mes, FME."Categoria"
order by TME.mes, FME."Categoria";

-- 	dar el número de alquileres y el monto cobrado, por duración del préstamo
select DME."diasDuracion" as duracion,
        count(Ce.duration_id), sum(Ce.monto)
from "Central" Ce 
inner join "duraciones_ME" DME on Ce.duration_id = DME.rental_id
where DME."diasDuracion" > 0 AND Ce.monto > 0
group by DME."diasDuracion"
order by DME."diasDuracion";

-- hacer un rollup por año y mes para el monto cobrado por alquileres
select TME.anno as anno,
       TME.mes as mes,
       sum(Ce.monto)
from "Central" Ce 
inner join "tiempo_ME" TME ON Ce."time_id" = TME."rental_id"
WHERE Ce.monto > 0
group by rollup (TME.anno, TME.mes)
order by TME.anno, TME.mes

--	hacer un cubo por año y categoría de película para el número de alquileres y el monto cobrado
select  TME.anno as anno, FME."Categoria",
        count(*) as num_alquileres,
        sum(CE.monto) as monto_cobrado
       --, r.rental_id, i.inventory_id, i.film_id, fc.category_id, rental_date
from "Central" Ce
inner join "film_ME" FME ON Ce.film_id = FME."IDFilm"
inner join "tiempo_ME" TME on Ce.time_id = TME.rental_id
group by cube (TME.anno, FME."Categoria")
order by TME.anno, FME."Categoria";