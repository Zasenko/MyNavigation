INSERT INTO City (name_en, name_fr, name_de, name_ru, name_it, name_es, about_en, about_fr, about_de, about_ru, about_it, about_es, photo, country_id) VALUES (" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", 2)

CREATE TABLE City (
  id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,

  name_en VARCHAR(255) NOT NULL,
  name_fr VARCHAR(255) NOT NULL,
  name_ge VARCHAR(255) NOT NULL,
  name_ru VARCHAR(255) NOT NULL,
  name_it VARCHAR(255) NOT NULL,
  name_es VARCHAR(255) NOT NULL,
  
  about_en TEXT NOT NULL,
  about_fr TEXT NOT NULL,
  about_ge TEXT NOT NULL,
  about_ru TEXT NOT NULL,
  about_it TEXT NOT NULL,
  about_es TEXT NOT NULL,
  
  photo VARCHAR(255) NOT NULL,

  country_id SMALLINT UNSIGNED NOT NULL,
  region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  
  is_active BOOLEAN DEFAULT 1,

  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  INDEX (country_id),
  INDEX (region_id),

  CONSTRAINT City_country_id
  FOREIGN KEY (country_id)
  REFERENCES Country (id)
  ON DELETE RESTRICT,

  CONSTRAINT City_region_id
  FOREIGN KEY (region_id)
  REFERENCES Region (id)
  ON DELETE RESTRICT,

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci