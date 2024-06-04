# DevOps homework

# HW1
1. Для начала нужно файлу дать права на выполнение: chmod +x hw1.sh
2. Для запуска написать ./hw1.sh
3. Ввести нашу директиву (я вводил /home/goku)
4. После выполнения появится файл "script_log.txt"


# HW 2
1. Для запуска написать ansible-playbook -i hosts user_setup.yml
2. Файл hosts - это обычный текстовый файл, его можно редактировать под себя. Я вводил удаленные адрес и имя пользователя


# HW 3
**Устноавка molecule**
1. Я все делал через pip в виртуальной среде python, тк иначе у меня была ошибка, которую не удалось пофиксить: sudo apt install python3-venv
2. Создать виртуальную среду через python: python3 -m venv molecule-venv
3. Активировать виртуальную среду: source molecule-venv/bin/activate
4. Установить molecule: pip install molecule molecule-docker
_Докер уже был установлен для другой домашки_

**Создание ansible роли**
1. Ввести: ansible-galaxy init user_setup
2. Затем перейти в эту директорию и работать в ней: cd user_setup

**Настройка molecule для тестирование**
1. Инициализация molecule сценария: molecule init scenario --driver-name docker

**Запуск тестов**
1. Тк работа происходила в виртуальной среде, команды molecule test и sudo molecule test не работали. Я решил это следующим образом: вместо molecule я использовал полный путь к molecule и использовал test: sudo /home/goku/hw3/molecule-env/bin/molecule test, после чего все заработало

–––––––––––––––––––––––––––––––

# HW 4
1. Чтобы создать образ нужно ввести: sudo docker build -t khayrullin_tf_image_03-06-2024 .
2. Для отображения всех слоев изображения использовать: sudo docker history khayrullin_tf_image_03-06-2024
3. Изначально использовал базу данный MySQL, но была ошибка: пакет mysql-server отсутствует в репозиториях Debian Bookworm
Поэтому использовал баззу данных MariaDB, после чего все заработало
