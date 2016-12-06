SET search_path TO task;

-- Таблица команд, в которых могут состоять игроки
CREATE TABLE teams (
    id      int     primary key,
    -- Название команды
    name    text    not null,
    -- Уровень команды
    level   int     not null default 1
);

-- Таблица пользователей (игроков)
CREATE TABLE users (
    -- Имя пользователя
    username        varchar(64)     primary key,
    -- Пароль
    password        text            not null,
    -- Уровень игрока
    level           int             not null default 1,
    -- Дата регистрации 
    register_date   date            not null default CURRENT_DATE,
    -- id команды, в которой состоит игрок
    team_id         int             references teams(id)
);

-- Таблица домов игроков
CREATE TABLE houses (
    id          int         primary key,
    -- Координаты расположения дома в игровом мире
    position_x  real        not null, 
    position_y  real        not null, 
    position_z  real        not null,
    -- Стоимость дома
    price       real        not null default 0,
    -- Владелец дома
    owner       varchar(64) references users(username)
);

-- Модели машин
CREATE TABLE car_models (
    id          int         primary key,
    -- Название модели (напр. Mazda RX-8)
    name        text        not null,
    -- Цена автомобиля данной модели
    price       real        not null default 0,
    -- Скорость по-умолчанию
    speed       real        not null,
    -- Масса по-умолчанию
    weight      real        not null
);

-- Машины игроков
CREATE TABLE cars (
    id          int         primary key,
    -- Владелец
    owner       varchar(64) references users(username),
    -- Модель
    model_id    int         references models(id),
    -- Пробег
    mileage     real        not null default 0,
    -- Уровень
    level       int         not null default 1
);

-- Улучшения, установленные на машины
CREATE TABLE car_upgrades (
    -- id машины, на которую добавляется улучшение
    car_id      int         references cars(id),
    -- Цена улучшения 
    price       real        not null default 0,
    -- Скорость, которую добавляет улучшение
    add_speed   real        not null default 0,
    -- Масса, которую добавляет улучшение
    add_weight  real        not null default 0
);