 Домашнее задание к занятию "HAProxy" - Медведев Владимир


### Задание 1

#Что нужно сделать:
Запустите два simple python сервера на своей виртуальной машине на разных портах
Установите и настройте HAProxy
Настройте балансировку Round-robin на 4 уровне.
На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.
![alt text](https://github.com/vladimir-medvedev/dz_Gitlab/blob/main/HAP1.1.png)
![alt text](https://github.com/vladimir-medvedev/dz_Gitlab/blob/main/HAP1.2.png)


### Задание 2

#Что нужно сделать:

Запустите три simple python сервера на своей виртуальной машине на разных портах
Настройте балансировку Weighted Round Robin на 7 уровне, чтобы первый сервер имел вес 2, второй - 3, а третий - 4
HAproxy должен балансировать только тот http-трафик, который адресован домену example.local
На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него.
![alt text](https://github.com/vladimir-medvedev/dz_Gitlab/blob/main/Pipeline.png)
![alt text](https://github.com/vladimir-medvedev/dz_Gitlab/blob/main/gitlab-ci.png)
