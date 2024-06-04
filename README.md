# DevOps homework

## HW1
1. Для начала нужно файлу дать права на выполнение
```
chmod +x hw1.sh
```
2. Для запуска написать либо так
```
./hw1.sh -d /корневой каталог
```
Либо так (попросит написать путь)
```
./hw1.sh
```

3. Ввести наш путь (я вводил /home/goku)
4. После выполнения появится файл "script_log.txt"

____

## HW 2
1. Для запуска написать:
```
ansible-playbook -i hosts user_setup.yml
```
2. Файл hosts - это обычный текстовый файл, его можно редактировать под себя. Я вводил удаленные адрес и имя пользователя

____

## HW 3
- [X] 1. ***Устноавка molecule***
    1. Я все делал через pip в виртуальной среде python, тк иначе у меня была ошибка, которую не удалось пофиксить
    ```
    sudo apt install python3-venv
    ```
    2. Создать виртуальную среду через python
    ```
    python3 -m venv molecule-venv
    ```
    3. Активировать виртуальную среду
    ```
    source molecule-venv/bin/activate
    ```
    4. Установить molecule
    ```
    pip install molecule molecule-docker
    ```
    5.  _Докер уже был установлен для другой домашки_


- [X] 2. ***Создание ansible роли***
    1. Ввести
    ```
    ansible-galaxy init user_setup
    ```
    2. Затем перейти в эту директорию и работать в ней
    ```
    cd user_setup
    ```

- [X] 3. ***Настройка molecule для тестирование***
    1. Инициализация molecule сценария
    ```
    molecule init scenario --driver-name docker
    ```

- [X] 4. ***Запуск тестов***
    1. _Все выполняется в папке user_setup_
    2. Тк работа происходила в виртуальной среде, команды molecule test и sudo molecule test не работали. Я решил это следующим образом: вместо molecule я использовал полный путь к 
    molecule и использовал test
    ```
    sudo /home/goku/hw3/molecule-env/bin/molecule test, после чего все заработало
    ```

____

## HW 4
1. Чтобы создать образ нужно ввести 
```
sudo docker build -t khayrullin_tf_image_03-06-2024 .
```
2. Для отображения всех слоев изображения использовать
```
sudo docker history khayrullin_tf_image_03-06-2024
```
3. Изначально использовал базу данный MySQL, но была ошибка: пакет mysql-server отсутствует в репозиториях Debian Bookworm.
Поэтому использовал баззу данных MariaDB, после чего все заработало

![screen](https://github.com/KhayrullinTimur/DevOps/blob/main/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-06-03%20%D0%B2%2023.50.47.png?raw=true, "hello :)")

![gif](https://media1.tenor.com/m/nLEr_XPzesUAAAAd/%D0%B8%D0%B2%D0%B0%D0%BD%D0%B1%D1%83%D1%80%D0%B5%D0%BD%D0%B8%D0%BD-%D0%B1%D1%83%D1%80%D0%B5%D0%BD%D0%B8%D0%BD.gif)
