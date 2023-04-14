CREATE TABLE PlacePhoto (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,

  place_id INT UNSIGNED NOT NULL,

  photo VARCHAR(255) NOT NULL,
  
  CONSTRAINT PlacePhoto_place_id
  FOREIGN KEY (place_id)
  REFERENCES Place (id)
  ON DELETE RESTRICT,
  
  INDEX (place_id),
  
  CONSTRAINT PlacePhoto_place_id_photo
  UNIQUE (place_id, photo)
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci