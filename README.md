 Домашнее задание к занятию "CI/CD" - Медведев Владимир


### Задание 1

#Что нужно сделать:

Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
Установите на машину с jenkins golang.
Используя свой аккаунт на GitHub, сделайте себе форк репозитория. В этом же репозитории находится дополнительный материал для выполнения ДЗ.
Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта go test . и docker build ..
![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/1.png)
![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/2.png)
![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/3.png)

### Задание 2

Что нужно сделать:

Создайте новый проект pipeline.
Перепишите сборку из задания 1 на declarative в виде кода.

![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/dz_2.png)

### Задание 3


Установите на машину Nexus.
Создайте raw-hosted репозиторий.
Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
Загрузите файл в репозиторий с помощью jenkins.

![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/dz_3_1.png)
![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/dz_3_2.png)
