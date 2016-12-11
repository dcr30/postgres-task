CREATE SCHEMA IF NOT EXISTS task;

-- Использование схемы task
SET search_path TO task;

-- Таблица соревнований между командами
CREATE TABLE competitions (
    id              serial          primary key,    
    -- Статус соревнования "running", "completed" и т. д.
    status          varchar(16)     not null default 0,
    -- Дата начала соревнования
    start_date      date            not null,
    -- Опциональное описание соревнования
    description     text
);

-- Таблица команд, в которых могут состоять игроки
CREATE TABLE teams (
    id      serial  primary key,
    -- Название команды
    name    text    not null unique,
    -- Уровень команды
    level   int     not null default 1
);

-- Таблица, связывающая соревнования и команды
CREATE TABLE competition_teams (
    competition_id  serial  references competitions(id),
    team_id         serial  references teams(id),
    -- Счёт команды в соревновании
    score           int     not null default 0
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
    id          serial      primary key,
    -- Координаты расположения дома в игровом мире
    position_x  real        not null, 
    position_y  real        not null, 
    position_z  real        not null,
    -- Стоимость дома
    price       numeric     not null default 0,
    -- Владелец дома
    owner       varchar(64) references users(username)
);

-- Модели машин
CREATE TABLE car_models (
    id          serial      primary key,
    -- Название модели (напр. Mazda RX-8)
    name        text        not null,
    -- Цена автомобиля данной модели
    price       numeric     not null default 0,
    -- Скорость по-умолчанию
    speed       real        not null,
    -- Масса по-умолчанию
    weight      real        not null
);

-- Машины игроков
CREATE TABLE cars (
    id          serial      primary key,
    -- Владелец
    owner       varchar(64) references users(username),
    -- Модель
    model_id    int         references car_models(id),
    -- Пробег
    mileage     real        not null default 0,
    -- Уровень
    level       int         not null default 1
);

-- Улучшения, установленные на машины
CREATE TABLE car_upgrades (
    -- id машины, на которую добавляется улучшение
    car_id      serial      references cars(id),
    -- Цена улучшения 
    price       numeric     not null default 0,
    -- Скорость, которую добавляет улучшение
    add_speed   real,
    -- Масса, которую добавляет улучшение
    add_weight  real
);