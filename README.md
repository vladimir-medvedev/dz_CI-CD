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

create index paymentdate on payment(payment_date)
                  

explain analyze

select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount)

from payment p

join customer c on p.customer_id = c.customer_id 

where payment_date >= '2005-07-30' and payment_date < date_add('2005-07-30', interval 1 day) 

group by p.customer_id


РЕЗУЛЬТАТ EXPLAIN ANALYZE:

-> Sort with duplicate removal: `concat(c.last_name, ' ', c.first_name)`, `sum(p.amount)`  (actual time=2.84..2.87 rows=391 loops=1)

    -> Table scan on <temporary>  (actual time=2.59..2.64 rows=391 loops=1)

        -> Aggregate using temporary table  (actual time=2.59..2.59 rows=391 loops=1)

            -> Nested loop inner join  (cost=507 rows=634) (actual time=0.0338..2.1 rows=634 loops=1)

                -> Index range scan on p using paymentdate over ('2005-07-30 00:00:00' <= payment_date < '2005-07-31 00:00:00'), with index condition: ((p.payment_date >= TIMESTAMP'2005-07-30 00:00:00') and (p.payment_date < <cache>(('2005-07-30' + interval 1 day))))  (cost=286 rows=634) (actual time=0.0266..1.29 rows=634 loops=1)

                -> Single-row index lookup on c using PRIMARY (customer_id=p.customer_id)  (cost=0.25 rows=1) (actual time=0.00112..0.00114 rows=1 loops=634)

