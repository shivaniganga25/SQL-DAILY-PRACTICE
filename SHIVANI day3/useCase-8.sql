USE cdg_hyd_jfs_058;
CREATE TABLE hotel_rooms(
    room_id INT NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(20) NOT NULL,
    floor_number SMALLINT NOT NULL,
    bed_count TINYINT NOT NULL,
    max_occupancy TINYINT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    availablity_status VARCHAR(20) NOT NULL DEFAULT 'AVAILABLE',
    has_air_conditioning BOOLEAN NOT NULL DEFAULT TRUE,
    smoking_allowed BOOLEAN NOT NULL DEFAULT FALSE,
    notes VARCHAR(255),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

    CONSTRAINT `pk_room_id` PRIMARY KEY (room_id),
    CONSTRAINT `uk_room_number` UNIQUE (room_number),
    CONSTRAINT `chk_bed_count_should_atleast_be_1` CHECK (bed_count >= 1),
    CONSTRAINT `chk_max_occupancy_should_atleast_be_1` CHECK (max_occupancy >= 1),
    CONSTRAINT `chk_nightly_price_should_be_greater_than_1` CHECK (price_per_night >= 1)
);

ALTER TABLE hotel_rooms AUTO_INCREMENT=001;
DROP TABLE hotel_rooms;
SELECT * FROM hotel_rooms;


INSERT INTO hotel_rooms 
(room_number, room_type, floor_number, bed_count, max_occupancy, price_per_night, availablity_status, has_air_conditioning, smoking_allowed, notes)
VALUES
('101A', 'DELUXE', 1, 2, 4, 4500.00, 'AVAILABLE', TRUE, FALSE, 'Sea-facing room with balcony');

INSERT INTO hotel_rooms 
(room_number, room_type, floor_number, bed_count, max_occupancy, price_per_night, availablity_status, has_air_conditioning, smoking_allowed, notes)
VALUES
('205B', 'STANDARD', 2, 1, 2, 2200.00, 'OCCUPIED', TRUE, FALSE, NULL);

INSERT INTO hotel_rooms 
(room_number, room_type, floor_number, bed_count, max_occupancy, price_per_night, availablity_status, has_air_conditioning, smoking_allowed, notes)
VALUES
('310C', 'SUITE', 3, 3, 6, 9800.00, 'MAINTENANCE', FALSE, TRUE, 'Under renovation until next month');

-- Updating price_per_night and availablity_status for a room by room_number
UPDATE hotel_rooms SET price_per_night = 5000.00, availablity_status = 'AVAILABLE', update_at = CURRENT_TIMESTAMP WHERE room_number = '101A';

-- Updating notes and availablity_status for a room by room_id
UPDATE hotel_rooms SET notes = 'Renovation completed, ready for booking', availablity_status = 'AVAILABLE', update_at = CURRENT_TIMESTAMP WHERE room_id = 3;

-- Removing a room by room_number
DELETE FROM hotel_rooms WHERE room_number = '205B';

-- Removing all rooms with availablity_status = 'MAINTENANCE'
DELETE FROM hotel_rooms WHERE availablity_status = 'MAINTENANCE';