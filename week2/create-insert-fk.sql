DROP TABLE Teams;
DROP TABLE Divisions;

CREATE TABLE Divisions (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE Teams (
	id SERIAL PRIMARY KEY,
	city TEXT,
	name TEXT NOT NULL UNIQUE,
	home_color TEXT NOT NULL,
	away_color TEXT,
	division_id INT,
	CONSTRAINT fk_division_id
		FOREIGN KEY (division_id)
			REFERENCES divisions(id)
				ON DELETE SET null
);

INSERT INTO Divisions (name) VALUES ('Atlantic');
INSERT INTO Divisions (name) VALUES ('Pacific');
INSERT INTO Divisions (name) VALUES ('Central');

INSERT INTO Teams (city, name, home_color, away_color, division_id) VALUES ('New York', 'New York Islanders', 'Royal Blue', 'White', 1);
INSERT INTO Teams (city, name, home_color, away_color, division_id) VALUES ('Seattle', 'Seattle Kraken', 'Royal Blue', 'White', 2);


SELECT * FROM Divisions;
SELECT * FROM Teams;