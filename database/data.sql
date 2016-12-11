-- Заполнение таблиц тестовыми данными
SET search_path TO task;

-- Соревнования
INSERT INTO competitions (status, start_date, description) VALUES
	('waiting', 	current_date, 'Example competition'),
	('running', 	current_date, 'Another example competition'),
	('completed', 	current_date, NULL);

-- Команды
INSERT INTO teams (name, level) VALUES
	('Astralis', 			7),
	('SK Gaming', 			4),
	('Ninjas in Pyjamas', 	1),
	('Virtus.Pro', 			2),
	('Cloud9', 				5);

-- Участие команд в соревнованиях
INSERT INTO competition_teams (competition_id, team_id, score) VALUES
	(1, 1, 0),	
	(1, 2, 0),
	(1, 5, 0),

	(2, 1, 2),	
	(2, 4, 6),

	(3, 3, 5),
	(3, 4, 4),
	(3, 5, 2);

-- Пользователи
INSERT INTO users (username, password, level, team_id) VALUES 
	('AlcoholicLobster12', 			'uF5n5FZr',	1,	1),
	('UnequaledSpaghetti27', 		'bkRRFF8M', 2,	1),
	('AboriginalSalamander83',		'h2hcd4rh', 1, 	2),
	('CreepyPudding62', 			'GzNTwTC3', 10,	3),
	('LuckyBandit15', 				'cxqLzFMp',	12,	1),
	('DynamicLeader99', 			'5p2Whk2S', 25,	5),
	('IntellectualBastard21', 		'B5kH7LaP', 1,	2),
	('LazyassedContender55', 		'7PtwXZbM', 1,	4),
	('FoolishSpecialist46', 		'DCvUkzH2', 64,	4),
	('ViolentAssassin70', 			'AGT7z3T6', 32,	5);

-- Дома
INSERT INTO houses (position_x, position_y, position_z, price, owner) VALUES
	(-1500.712, 2151.166, 1231.216, 150000,  'AlcoholicLobster12'),
	(1251.213, -2152.212, 6812.123, 500000,  'DynamicLeader99'),
	(-1231.211, 4125.231, 102.123, 	7500000, 'FoolishSpecialist46');

-- Модели автомобилей
INSERT INTO car_models (name, price, speed, weight) VALUES
	('Toyota AE86', 		7000,  160, 1200),
	('Nissan Skyline 2000',	9500,  180, 1300),
	('Honda Civic', 		10300, 190, 1100),
	('Mazda MX5 Miata', 	18700, 170, 980),
	('Nissan 180SX', 		24600, 180, 1400),
	('Mitsubishi Eclipse', 	28300, 170, 1250),
	('Nissan Silvia S13', 	32700, 180, 1500),
	('BMW E30', 			45800, 210, 1450),
	('Nissan Skyline ER34', 41500, 210, 1245),
	('Toyota Mark II 100', 	45000, 205, 1516),
	('Nissan Datsun 240Z',	36300, 195, 1210),
	('Toyota Altezza', 		47000, 180, 1160);

-- Автомобили игроков
INSERT INTO cars (owner, model_id, mileage, level) VALUES
	('FoolishSpecialist46', 	1, 1501, 5),
	('FoolishSpecialist46', 	5, 120, 1),
	('LuckyBandit15', 			2, 1273, 3),
	('ViolentAssassin70', 		3, 1821, 6),
	('AlcoholicLobster12', 		4, 1251, 2),
	('IntellectualBastard21', 	7, 1125, 8);

-- Улучшения автомобилей
INSERT INTO car_upgrades (car_id, price, add_speed, add_weight) VALUES
	(1, 200, 10, 0),
	(1, 250, 5, -5),
	(1, 500, 0, -5);