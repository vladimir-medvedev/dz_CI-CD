Домашнее задание к занятию "Index" - Медведев Владимир


### Задание 1

#Что нужно сделать:
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

SELECT sum(index_length)/sum(data_length)*100

FROM INFORMATION_SCHEMA.TABLES

### Задание 2

#Что нужно сделать:

Выполните explain analyze следующего запроса:

select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
перечислите узкие места;
оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

ОПТИМИЗАЦИЯ ЗАПРОСА:

select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount)

from payment p, customer c

where date(p.payment_date) = '2005-07-30' and p.customer_id = c.customer_id 

group by p.customer_id

РЕЗУЛЬТАТ EXPLAIN ANALYZE:

 Sort with duplicate removal: `concat(c.last_name, ' ', c.first_name)`, `sum(p.amount)`  (actual time=30.6..30.6 rows=391 loops=1)

    -> Table scan on <temporary>  (actual time=30.3..30.4 rows=391 loops=1)

        -> Aggregate using temporary table  (actual time=30.3..30.3 rows=391 loops=1)

            -> Nested loop inner join  (cost=5691 rows=16086) (actual time=0.162..29.5 rows=634 loops=1)

                -> Table scan on c  (cost=61.2 rows=599) (actual time=0.0525..0.51 rows=599 loops=1)

                -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=6.72 rows=26.9) (actual time=0.0438..0.0481 rows=1.06 loops=599)

                    -> Index lookup on p using idx_fk_customer_id (customer_id=c.customer_id)  (cost=6.72 rows=26.9) (actual time=0.0389..0.0449 rows=26.8 loops=599)


