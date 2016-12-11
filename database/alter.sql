SET search_path TO task;

ALTER TABLE users 
	ADD COLUMN money 	numeric not null default 5000,
	ADD COLUMN online 	boolean	not null default false;