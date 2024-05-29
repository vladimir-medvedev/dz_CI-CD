Домашнее задание к занятию "Index" - Медведев Владимир


### Задание 1

#Что нужно сделать:
Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя nmap.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

![alt text](https://github.com/vladimir-medvedev/dz_bz/blob/main/Nmap1.png)

Пароль и логин совпадают
Используется HTTP, а не HTTPS
Бэкдор vsftpd v.2.3.4

### Задание 2

#Что нужно сделать:

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

![alt text](https://github.com/vladimir-medvedev/dz_bz/blob/main/sA.pcapng)
![alt text](https://github.com/vladimir-medvedev/dz_bz/blob/main/sS.pcapng)
![alt text](https://github.com/vladimir-medvedev/dz_bz/blob/main/sX.pcapng)
![alt text](https://github.com/vladimir-medvedev/dz_bz/blob/main/sU.pcapng)


