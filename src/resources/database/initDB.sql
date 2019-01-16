USE test;
DROP TABLE IF EXISTS part;
CREATE TABLE part
(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100)   NOT NULL,
needed TINYINT(1) DEFAULT 0 NOT NULL, number INT(4)  NOT NULL, PRIMARY KEY(id))
ENGINE=InnoDB DEFAULT CHARSET=utf8;