
-- Persona con el mejor puntaje en cada materia
-- Punto 1
-- (Consulto primero la maxima puntuacion en cada materia)
select max(pe.punt_matematicas) as Matematicas, 
max(pe.punt_ingles) as Ingles, 
max(pe.punt_c_sociales) as Sociales, 
max(pe.punt_filosofia) as Filosofia, 
max(pe.punt_biologia) as Biologia, 
max(pe.punt_quimica) as Quimica, 
max(pe.punt_fisica) as Fisica, 
max(pe.punt_lenguaje) as Lenguaje
from estudiante e
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id;
-- (Despues consulto el estudiante que cumple con el mayor puntaje estimado)
select e.estu_puesto, pe.punt_matematicas, 
pe.punt_c_sociales, pe.punt_filosofia, 
pe.punt_biologia, pe.punt_quimica, pe.punt_fisica, pe.punt_lenguaje, pe.punt_ingles
from estudiante e
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
where pe.punt_matematicas>=80 and pe.punt_ingles>=80 and pe.punt_fisica>=80 and pe.punt_filosofia>=80 
and pe.punt_quimica>=70 and pe.punt_biologia>=70 and pe.punt_lenguaje>=70;




-- Colegio con el mejor puntaje promedio?
-- Punto 2
-- (Realizo la consulta calculando el promedio encima de 80 entre todos los estudiantes. Aqui muestra el colegio)
select c.cole_cod_icfes, c.cole_cod_dane, c.cole_nombre, pe.desemp_ingles,
avg(pe.punt_matematicas) as Matematicas, 
avg(pe.punt_ingles) as Ingles, 
avg(pe.punt_c_sociales) as Sociales, 
avg(pe.punt_filosofia) as Filosofia, 
avg(pe.punt_biologia) as Biologia, 
avg(pe.punt_quimica) as Quimica, 
avg(pe.punt_fisica) as Fisica, 
avg(pe.punt_lenguaje) as Lenguaje
from colegio c
inner join estudiante e
on e.estu_cod_colegio = c.cole_cod_icfes
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
where pe.punt_matematicas>=80 and pe.punt_ingles>=80 and pe.punt_fisica>=80 and pe.punt_filosofia>=80 and pe.punt_quimica>=70 and pe.punt_biologia>=70
group by c.cole_cod_icfes, c.cole_cod_dane, c.cole_nombre, pe.desemp_ingles;

select c.cole_cod_icfes, c.cole_cod_dane, c.cole_nombre, pe.desemp_ingles
from colegio c
inner join estudiante e
on e.estu_cod_colegio = c.cole_cod_icfes
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
where pe.punt_matematicas>=80 and pe.punt_ingles>=80 and pe.punt_fisica>=80 and pe.punt_filosofia>=80 and pe.punt_quimica>=70 and pe.punt_biologia>=70;




-- Cantidad de personas con el nivel de ingles superior a B1
-- Punto 3
select count(*)
from estudiante e
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
where pe.desemp_ingles like '%B+%';


-- Ciudad con mayor cantidad de personas con nivel Ingles superior a B1
-- Punto 4

select count(r.residencia_mcpio), r.residencia_mcpio, r.residencia_dpto, pe.punt_ingles
from estudiante e
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
inner join residencia r
on e.estu_cod_residencia=r.residencia_cod
where pe.desemp_ingles like '%B+%'
group by r.residencia_mcpio, r.residencia_dpto, pe.punt_ingles
having max (pe.punt_ingles)>=100 and count(r.residencia_mcpio)>10
order by count(r.residencia_mcpio) desc;


-- Cinco colegios no bilingues con mejor puntaje en ingles
-- Punto 5
select * from colegio where cole_bilingue is null;

select count(r.residencia_mcpio), c.cole_cod_icfes, c.cole_cod_dane, c.cole_nombre, r.residencia_mcpio, r.residencia_dpto, pe.desemp_ingles, pe.punt_ingles
from colegio c
inner join estudiante e
on e.estu_cod_colegio = c.cole_cod_icfes
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
inner join residencia r
on e.estu_cod_residencia=r.residencia_cod
where pe.desemp_ingles like '%B+%'  and c.cole_bilingue is null
group by c.cole_cod_icfes, c.cole_cod_dane, c.cole_nombre, r.residencia_mcpio, r.residencia_dpto, pe.desemp_ingles, pe.punt_ingles
having max (pe.punt_ingles)>=100 and count(r.residencia_mcpio)>1
order by count(r.residencia_mcpio) desc;




--Mejor puntaje en matematicas por genero
-- Punto 6. Mostrar el estudiante o contar cuantos estudiantes por genero?
select pe.punt_matematicas, 
g.genero_estu, count(g.genero_estu)
from estudiante e
inner join puntaje_estudiante pe
on e.estu_id_puntaje = pe.punt_estu_id
inner join genero g
on e.estu_id_genero = g.genero_id
group by pe.punt_matematicas, g.genero_estu
having max (pe.punt_matematicas)>=110
order by pe.punt_matematicas desc;


