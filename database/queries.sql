SET search_path TO task;

-- Получить команды, которые принимали участие во всех завершённых соревнованиях
WITH 
    -- Завершённые соревнования
    completed_competitions AS (
        SELECT id FROM competitions WHERE status = 'completed'
    ), 
    -- Количество завершённых соревнований
    completed_count AS (
        SELECT count(*) FROM completed_competitions
    ),
    -- Количество завершённых соревнований, в которых участвовала команда
    team_completed_competitions_count AS (
        SELECT team_id as id, count(team_id)
        FROM competition_teams
        WHERE competition_id IN 
            (SELECT * FROM completed_competitions)
        GROUP BY team_id
    )

SELECT 
    teams.name
FROM 
    teams
WHERE 
    (SELECT count FROM team_completed_competitions_count WHERE id = teams.id) in (SELECT * FROM completed_count)

-- TODO: Показать все варианты JOIN на командах и пользователях

-- Получить машины, имеющие улучшения. Посчитать сумму, 
-- потраченную на улучшения для каждого автомобиля. В 
-- результирующей таблице должны быть следующие поля:
-- id машины, username владельца, пробег, название модели
SELECT 
    cars.id, 
    cars.owner, 
    cars.mileage, 
    car_models.name as model_name, 
    costs.total as upgrades_price

FROM cars
    INNER JOIN car_upgrades ON car_upgrades.car_id = cars.id
    INNER JOIN car_models ON car_models.id = cars.model_id
    INNER JOIN (
        SELECT car_id, SUM(price) AS total 
        FROM car_upgrades 
        GROUP BY car_upgrades.car_id
    ) costs ON costs.car_id = cars.id

GROUP BY cars.id, car_models.name, costs.total