-- Получить команды, которые принимали участие во всех завершённых соревнованиях
SELECT * FROM teams
WHERE NOT EXISTS (
    SELECT * FROM competitions
    WHERE NOT EXISTS (
        SELECT * FROM competition_teams 
        WHERE competition_teams.team_id = teams.id AND
              competition_teams.competition_id = competitions.id
    )
    AND competitions.status = 'completed'
)

-- Показать все варианты JOIN на командах и пользователях
-- 1. Inner Join
-- Вернёт всех пользователей, у которых есть команда 
SELECT users.username, teams.name as team_name
FROM users
    INNER JOIN teams ON (users.team_id = teams.id);

-- 2. Left Outer Join
-- Вернёт всех пользователей с командой и пользователей без команды
SELECT users.username, teams.name as team_name
FROM users
    LEFT OUTER JOIN teams ON (users.team_id = teams.id);

-- 3. Right Outer Join
-- Вернёт всех пользователей, у которых есть команда и команды без пользователей
SELECT users.username, teams.name as team_name
FROM users
    RIGHT OUTER JOIN teams ON (users.team_id = teams.id);

-- 4. Full Outer Join
-- Вернёт всех пользователей и все командыы
SELECT users.username, teams.name as team_name
FROM users
    FULL OUTER JOIN teams ON (users.team_id = teams.id);

-- Получить машины, имеющие улучшения. Посчитать сумму, 
-- потраченную на улучшения для каждого автомобиля. В 
-- результирующей таблице должны быть следующие поля:
-- id машины, username владельца, пробег, название модели
SELECT
    cars.id,
    cars.owner, 
    cars.mileage,   
    car_models.name as model_name,
    sum(car_upgrades.price) as upgrades_price

FROM cars
    INNER JOIN car_models ON car_models.id = cars.model_id
    INNER JOIN car_upgrades ON car_upgrades.car_id = cars.id

GROUP BY cars.id, car_models.name