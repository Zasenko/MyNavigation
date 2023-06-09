CREATE TABLE Region (
  id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,

  country_id SMALLINT UNSIGNED NOT NULL,

  name_en VARCHAR(255) NOT NULL,
  name_fr VARCHAR(255) NOT NULL,
  name_ge VARCHAR(255) NOT NULL,
  name_ru VARCHAR(255) NOT NULL,
  name_it VARCHAR(255) NOT NULL,
  name_es VARCHAR(255) NOT NULL,
  
  is_active BOOLEAN DEFAULT 1,

  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  INDEX (country_id),

  CONSTRAINT Region_country_id
  FOREIGN KEY (country_id)
  REFERENCES Country (id)
  ON DELETE RESTRICT,

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci