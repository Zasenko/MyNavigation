CREATE TABLE EventTag (

  event_id INT UNSIGNED NOT NULL,
  tag_id TINYINT UNSIGNED NOT NULL,
  
  CONSTRAINT EventTag_event_id
  FOREIGN KEY (event_id)
  REFERENCES Event (id)
  ON DELETE RESTRICT,

  CONSTRAINT EventTag_tag_id
  FOREIGN KEY (tag_id)
  REFERENCES Tag (id)
  ON DELETE RESTRICT,
  
  INDEX (event_id),
  
  CONSTRAINT EventTag_event_tag
  UNIQUE (event_id, tag_id)
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci