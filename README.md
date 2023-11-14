 Домашнее задание к занятию "CI/CD" - Медведев Владимир


### Задание 1

#Что нужно сделать:

Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
Установите на машину с jenkins golang.
Используя свой аккаунт на GitHub, сделайте себе форк репозитория. В этом же репозитории находится дополнительный материал для выполнения ДЗ.
Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта go test . и docker build ..
![alt text](https://github.com/vladimir-medvedev/dz_CI-CD/blob/main/1.png)

### Задание 2

Что нужно сделать:

Создайте файл .gitignore (обратите внимание на точку в начале файла) и проверьте его статус сразу после создания.
Добавьте файл .gitignore в следующий коммит git add....
Напишите правила в этом файле, чтобы игнорировать любые файлы .pyc, а также все файлы в директории cache.
Сделайте коммит и пуш.
В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.

https://github.com/vladimir-medvedev/dz_netology/commit/167f4f9f2580b619d92baf4d95a9a85855d13304
### Задание 3


Что нужно сделать:

Создайте новую ветку dev и переключитесь на неё.
Создайте в ветке dev файл test.sh с произвольным содержимым.
Сделайте несколько коммитов и пушей в ветку dev, имитируя активную работу над файлом в процессе разработки.
Переключитесь на основную ветку.
Добавьте файл main.sh в основной ветке с произвольным содержимым, сделайте комит и пуш . Так имитируется продолжение общекомандной разработки в основной ветке во время разработки отдельного функционала в dev ветке.
Сделайте мердж dev ветки в основную с помощью git merge dev. Напишите осмысленное сообщение в появившееся окно комита.
Сделайте пуш в основной ветке.
Не удаляйте ветку dev.
В качестве ответа прикрепите ссылку на граф коммитов https://github.com/ваш-логин/ваш-репозиторий/network в ваш md-файл с решением.

https://github.com/vladimir-medvedev/dz_netology/network
