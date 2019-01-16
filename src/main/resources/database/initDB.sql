USE test;
DROP TABLE IF EXISTS part;
CREATE TABLE part
(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100)   NOT NULL,
needed TINYINT(1) DEFAULT 0 NOT NULL, number INT(4)  NOT NULL, PRIMARY KEY(id))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO part (name, needed, number) VALUES ('box', 1, 10), ('matherboard', 1, 5),
('processor', 1, 4), ('power supply', 1, 7), ('video card', 0, 3), ('monitor', 0, 6),
('keyboard', 0, 4), ('box light', 0, 8), ('RAM', 1, 9), ('HDD disc', 1, 14),
('sound card', 0, 6), ('computer mouse', 0, 8), ('cart reader', 0, 6), ('CD driver', 0, 7),
('DVD driver', 0, 5), ('TV tune', 0, 9), ('satellit card', 0, 3), ('cooler', 1, 8),
('blu-ray drive', 0, 3), ('optical mouse', 0, 7), ('hard drive', 1, 8), ('joystick', 0, 6);

