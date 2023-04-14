CREATE TABLE PlaceType (
  id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

INSERT INTO PlaceType (name)
VALUES
("bar"),
("cafe"),
("restaurant"),
("club"),
("hotel"),
("sauna"),
("cruise"),
("beach"),
("shop"),
("gym"),
("culture"),
("community"),