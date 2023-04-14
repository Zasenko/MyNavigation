CREATE TABLE Tag (
  id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

INSERT INTO Tag (name)
VALUES
("pool"),
("darkroom"),
("drag show"),
("terrace")