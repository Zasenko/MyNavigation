CREATE TABLE PlaceWorkingTime (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,

  place_id INT UNSIGNED NOT NULL,
  
  day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,

  opening_time TIME NOT NULL,
  closing_time TIME NOT NULL,

  extra TINYTEXT default NULL,

  PRIMARY KEY (id),
  INDEX (place_id),

  CONSTRAINT PlaceWorkingTime_place_id
  FOREIGN KEY (place_id)
  REFERENCES Place (id)
  ON DELETE RESTRICT

);
