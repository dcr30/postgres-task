-- Заполнение таблиц тестовыми данными
SET search_path TO task;

-- Создание пользователей
INSERT INTO users (username, password) VALUES ('User1', 12345);	
INSERT INTO users (username, password) VALUES ('IvanIvanov99', 1337);	
INSERT INTO users (username, password, level) VALUES ('Kek', 123, 15);	

-- Увеличение уровня
UPDATE users SET level = level + 2 WHERE level = 1;

-- Создание команды
INSERT INTO teams (name) VALUES ('NaVi');
-- Добавление пользователя в команду
UPDATE users SET team_id = 1 WHERE username = 'Kek';
-- Получение всех пользователей в команде
SELECT username FROM users WHERE team_id = 1;