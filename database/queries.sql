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

-- TODO: Получить машины, имеющие улучшения. Посчитать сумму, 
--       потраченную на улучшения для каждого автомобиля. В 
--       результирующей таблице должны быть следующие поля:
--       id машины, username владельца, пробег, название модели