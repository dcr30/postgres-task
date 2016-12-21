-- Получить команды, которые принимали участие во всех завершённых соревнованиях
SELECT * 
FROM teams
WHERE EXISTS (
    SELECT * 
    FROM competition_teams 
    WHERE competition_teams.team_id = teams.id
            AND NOT EXISTS (
                SELECT * 
                FROM competitions
                WHERE competitions.id = competition_teams.competition_id AND competitions.status <> 'completed'
            )
)

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
    sum(car_upgrades.price) as upgrades_price

FROM cars
    INNER JOIN car_models ON car_models.id = cars.model_id
    INNER JOIN car_upgrades ON car_upgrades.car_id = cars.id

GROUP BY cars.id, car_models.name