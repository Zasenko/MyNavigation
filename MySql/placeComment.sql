CREATE TABLE PlaceComment (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    place_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,

    comment TEXT NOT NULL,

    created_at DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    INDEX (place_id),
    INDEX (user_id),

    CONSTRAINT PlaceComment_place_id_user_id_created_at
    UNIQUE (place_id, user_id, created_at),
    
    CONSTRAINT PlaceComment_place_id
    FOREIGN KEY (place_id)
    REFERENCES Place (id)
    ON DELETE RESTRICT,
    
    CONSTRAINT PlaceComment_user_id
    FOREIGN KEY (user_id)
    REFERENCES User (id)
    ON DELETE RESTRICT
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci