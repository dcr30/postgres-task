# Описание базы данных
### Диаграмма схемы данных

![Scheme](https://pp.vk.me/c837524/v837524694/18913/vj5i6KvJQOM.jpg)

### Описание
Основной сущностью является *пользователь* или игрок (users). Для каждого пользователя хранится его пароль, уровень, дата регистрации и команда, в которой он состоит. Любой игрок может состоять только в одной команде в каждый момент времени. Все команды имеют название и уровень.

Команды могут участовать в соревнованиях (competitions). В любой момент времени команда может находиться в нескольких соревнованиях. В каждом соревновании участвуют несколько команд. Для команды хранится её состояние (status), принимающее такие значения как "preparing", "running" или "completed", дата начала соревнования (start_date) и опциональное описание (description).

Игроки могут иметь дом (houses). У каждого игрока он может быть только один. Игрок также может не иметь дома. Для каждого дома хранятся его координаты (position_x, position_y, position_z) и имя пользователя-владельца (owner).

Каждому игроку может принадлежать несколько автомобилей (cars). Автомобили имеют модель (car_models), которая определяет цену автомобиля (price), а также его характеристики: скорость (speed) и массу (weight). В таблице моделей также хранятся их названия. 

На автомобили могут быть установлены улучшения (car_upgrades). Автомобиль может иметь любое количество установленных на него улучшений или не иметь их. Улучшения имеют цену (price) и несколько столбцов, влияющих на характеристики автомобиля: add_speed и add_weight.