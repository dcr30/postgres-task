-- Заполнение таблиц тестовыми данными
SET search_path TO task;

-- Соревнования
INSERT INTO competitions (status, start_date, description) VALUES
    ('waiting',     date '2016-09-28', 'Example competition'),
    ('running',     date '2016-09-25', 'Another example competition'),
    ('completed',   date '2016-12-01', 'Dis one iz completed'),
    ('completed',   date '2016-12-20', 'Nobody reads this'),
    ('completed',   date '2016-12-03', 'One more completed'),
    ('completed',   date '2016-12-04', 'Just some random text here');

-- Команды
INSERT INTO teams (name, level) VALUES
    ('Astralis',            7),
    ('SK Gaming',           4),
    ('Ninjas in Pyjamas',   1),
    ('Virtus.Pro',          2),
    ('Cloud9',              5),
    ('NewTeam',             1),
    ('AnotherTeam',         2);

-- Участие команд в соревнованиях
INSERT INTO competition_teams (competition_id, team_id, score) VALUES
    (1, 1, 0),  
    (1, 2, 0),
    (1, 5, 0),

    (2, 1, 2),  
    (2, 4, 6),

    (3, 3, 5),
    (3, 4, 4),
    (3, 5, 2),

    (4, 3, 0),
    (4, 2, 5),
    (4, 5, 4),

    (5, 1, 4),
    (5, 3, 5),
    (5, 5, 2),

    (6, 2, 0),
    (6, 3, 1);
    (6, 5, 2);

-- Пользователи
INSERT INTO users (username, password, level, team_id, register_date) VALUES 
    ('AlcoholicLobster12',          'uF5n5FZr', 1,  1,    date '2016-05-28'),
    ('UnequaledSpaghetti27',        'bkRRFF8M', 2,  1,    date '2016-08-16'),
    ('AboriginalSalamander83',      'h2hcd4rh', 1,  2,    date '2016-11-18'),
    ('CreepyPudding62',             'GzNTwTC3', 10, 3,    date '2016-10-01'),
    ('LuckyBandit15',               'cxqLzFMp', 12, NULL, date '2016-12-07'),
    ('DynamicLeader99',             '5p2Whk2S', 25, 5,    date '2016-07-28'),
    ('IntellectualBastard21',       'B5kH7LaP', 1,  2,    date '2016-07-11'),
    ('LazyassedContender55',        '7PtwXZbM', 1,  4,    date '2016-06-02'),
    ('FoolishSpecialist46',         'DCvUkzH2', 64, 4,    date '2016-08-15'),
    ('ViolentAssassin70',           'AGT7z3T6', 32, 5,    date '2016-09-12'),
    ('HeavyFishing24',              '1q9qJwqg', 3,  NULL, date '2016-10-14'),
    ('ElectronicRegion28',          'qwg90mqz', 2,  NULL, date '2016-11-20');

-- Дома
INSERT INTO houses (position_x, position_y, position_z, price, owner) VALUES
    (-1500.712, 2151.166, 1231.216, 150000,  'AlcoholicLobster12'),
    (1251.213, -2152.212, 6812.123, 500000,  'DynamicLeader99'),
    (-1231.211, 4125.231, 102.123,  7500000, 'FoolishSpecialist46');

-- Модели автомобилей
INSERT INTO car_models (name, price, speed, weight) VALUES
    ('Toyota AE86',         7000,  160, 1200),
    ('Nissan Skyline 2000', 9500,  180, 1300),
    ('Honda Civic',         10300, 190, 1100),
    ('Mazda MX5 Miata',     18700, 170, 980),
    ('Nissan 180SX',        24600, 180, 1400),
    ('Mitsubishi Eclipse',  28300, 170, 1250),
    ('Nissan Silvia S13',   32700, 180, 1500),
    ('BMW E30',             45800, 210, 1450),
    ('Nissan Skyline ER34', 41500, 210, 1245),
    ('Toyota Mark II 100',  45000, 205, 1516),
    ('Nissan Datsun 240Z',  36300, 195, 1210),
    ('Toyota Altezza',      47000, 180, 1160);

-- Автомобили игроков
INSERT INTO cars (owner, model_id, mileage, level) VALUES
    ('FoolishSpecialist46',     1, 1501, 5),
    ('FoolishSpecialist46',     5, 120, 1),
    ('LuckyBandit15',           2, 1273, 3),
    ('ViolentAssassin70',       3, 1821, 6),
    ('AlcoholicLobster12',      4, 1251, 2),
    ('IntellectualBastard21',   7, 1125, 8);

-- Улучшения автомобилей
INSERT INTO car_upgrades (car_id, price, add_speed, add_weight, add_date) VALUES
    (3, 215, 0,  10, date '2016-12-12'),
    (2, 300, 5,  0,  date '2016-08-13'),
    (1, 250, 10, 10, date '2016-12-14'),
    (1, 200, 10, 0,  date '2016-12-16'),
    (1, 250, 5, -5,  date '2016-12-17'),
    (5, 250, 10, 0,  date '2016-10-10'),
    (1, 500, 0, -5,  date '2016-12-18'),
    (5, 100, 5,  2,  date '2016-09-09'),
    (4, 900, 15, 0,  date '2016-11-11');