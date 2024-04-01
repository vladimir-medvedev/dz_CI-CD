Домашнее задание к занятию "DDL/DML" - Медведев Владимир


### Задание 1

#Что нужно сделать:
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

фамилия и имя сотрудника из этого магазина;

город нахождения магазина;

количество пользователей, закреплённых в этом магазине.


select CONCAT(s2.last_name, ' ', s2.first_name), c.city, count(c2.store_id)  

from store s 

join staff s2 on s.manager_staff_id = s2.staff_id

join address a on s.address_id  = a.address_id 

join city c on a.city_id = c.city_id  

join customer c2 on s.store_id = c2.store_id 

group by c2.store_id 

having  count(c2.store_id) > 300

### Задание 2

#Что нужно сделать:
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.


select `length`, title

from film f 

group by film_id 

having `length` > (select avg(`length`) from film f)

### Задание 3

#Что нужно сделать:
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

select month(p.payment_date), sum(p.amount) SumAmount, count(r.rental_id)

from payment p

join rental r on p.rental_id = r.rental_id

group by month(p.payment_date)#, month(r.rental_date)

order by SumAmount desc 

limit 1


### Задание 4

#Что нужно сделать:
Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку «Премия». Если количество продаж превышает 8000, то значение в колонке будет «Да», иначе должно быть значение «Нет».

select CONCAT(s.last_name, ' ', s.first_name), count(payment_id), 

case

	when count(payment_id) > 7999 then 'Да'

	when count(payment_id) < 8000 then 'Нет'

	end as 'Премия'

from payment p

join staff s on p.staff_id = s.staff_id 

group by p.staff_id 


### Задание 5

#Что нужно сделать:
Найдите фильмы, которые ни разу не брали в аренду.

select  f.title

from film f

left join inventory i on i.film_id = f.film_id

left join rental r on r.inventory_id = i.inventory_id

where r.rental_id is null;
