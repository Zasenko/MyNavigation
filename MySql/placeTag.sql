CREATE TABLE PlaceTag (

  place_id INT UNSIGNED NOT NULL,
  tag_id TINYINT UNSIGNED NOT NULL,
  
  CONSTRAINT PlaceTag_place_id
  FOREIGN KEY (place_id)
  REFERENCES Place (id)
  ON DELETE RESTRICT,

  CONSTRAINT PlaceTag_tag_id
  FOREIGN KEY (tag_id)
  REFERENCES Tag (id)
  ON DELETE RESTRICT,
  
  INDEX (place_id),
  
  CONSTRAINT PlaceTag_place_tag
  UNIQUE (place_id, tag_id)
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci