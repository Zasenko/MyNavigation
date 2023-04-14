CREATE TABLE Event (

  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  
  name VARCHAR(255) NOT NULL,

  type_id TINYINT UNSIGNED NOT NULL,
  
  about_en TEXT NOT NULL,
  about_fr TEXT NOT NULL,
  about_ge TEXT NOT NULL,
  about_ru TEXT NOT NULL,
  about_it TEXT NOT NULL,
  about_es TEXT NOT NULL,

  cover VARCHAR(255) NOT NULL,

  country_id SMALLINT UNSIGNED NOT NULL,
  region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  city_id SMALLINT UNSIGNED DEFAULT NULL DEFAULT 0,

  address VARCHAR(255) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,

  start_time TIME NOT NULL,
  close_time TIME NOT NULL,

  tickets VARCHAR(255) NOT NULL,

  www VARCHAR(255) DEFAULT NULL,
  fb VARCHAR(255) DEFAULT NULL,
  insta VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(255) DEFAULT NULL,

  owner_user_id INT UNSIGNED DEFAULT NULL,
  owner_place_id INT UNSIGNED DEFAULT NULL,
  
  is_active BOOLEAN DEFAULT 1,
  is_checked BOOLEAN DEFAULT 0,

  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),

  INDEX (city_id),
  INDEX (region_id),

  CONSTRAINT Event_type_id
  FOREIGN KEY (type_id)
  REFERENCES EventType (id)
  ON DELETE RESTRICT,

  CONSTRAINT Event_region_id
  FOREIGN KEY (region_id)
  REFERENCES Region (id)
  ON DELETE RESTRICT,

  CONSTRAINT Event_country_id
  FOREIGN KEY (country_id)
  REFERENCES Country (id)
  ON DELETE RESTRICT,
  
  CONSTRAINT Event_city_id
  FOREIGN KEY (city_id)
  REFERENCES City (id)
  ON DELETE RESTRICT,

  CONSTRAINT Event_owner_user_id
  FOREIGN KEY (owner_user_id)
  REFERENCES User (id)
  ON DELETE RESTRICT,

  CONSTRAINT Event_owner_place_id
  FOREIGN KEY (owner_place_id)
  REFERENCES Place (id)
  ON DELETE RESTRICT
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci