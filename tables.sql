SET search_path TO task;

-- Таблица команд, в которых могут состоять игроки
CREATE TABLE teams (
    id      int     primary key,
    name    text    not null,
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