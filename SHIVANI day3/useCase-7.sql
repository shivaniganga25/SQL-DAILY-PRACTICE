USE cdg_hyd_jfs_058;

CREATE TABLE vehicles(
    vehicle_id INT NOT NULL AUTO_INCREMENT,
    registration_number VARCHAR(20) NOT NULL,
    qwner_name VARCHAR(80) NOT NULL,
    manufacturer VARCHAR(80) NOT NULL,
    model VARCHAR(80) NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,
    fuel_type VARCHAR(20) NOT NULL,
    manufacture_year YEAR NOT NULL,
    purchase_date DATE,
    color VARCHAR(40) NOT NULL,
    odometer_km INT NOT NULL DEFAULT 0,
    insurance_expiry DATE,
    vehicle_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE', 
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `pk_vehicle_id` PRIMARY KEY (vehicle_id),
    CONSTRAINT `uk_registration_number` UNIQUE (registration_number)
);

ALTER TABLE vehicles AUTO_INCREMENT=001;
DROP TABLE vehicles;
SELECT * FROM vehicles;

INSERT INTO vehicles 
(registration_number, qwner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, color, odometer_km, insurance_expiry, vehicle_status)
VALUES
('TS09EA1234', 'Ravi Kumar', 'Maruti Suzuki', 'Swift', 'HATCHBACK', 'PETROL', 2021, '2021-05-10', 'Red', 32500, '2027-05-09', 'ACTIVE');

INSERT INTO vehicles 
(registration_number, qwner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, color, odometer_km, insurance_expiry, vehicle_status)
VALUES
('KA05MZ5678', 'Sneha Reddy', 'Hyundai', 'Creta', 'SUV', 'DIESEL', 2020, '2020-11-22', 'White', 58900, '2025-11-21', 'INACTIVE');

INSERT INTO vehicles 
(registration_number, qwner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, color, odometer_km, insurance_expiry, vehicle_status)
VALUES
('MH12AB9012', 'Arjun Mehta', 'Tesla', 'Model 3', 'SEDAN', 'ELECTRIC', 2023, NULL, 'Black', 8200, NULL, 'ACTIVE');

-- Updating odometer_km and insurance_expiry for a vehicle by registration_number
UPDATE vehicles SET odometer_km = 35800, insurance_expiry = '2028-05-09' WHERE registration_number = 'TS09EA1234';

-- Updating vehicle_status and color for a vehicle by vehicle_id
UPDATE vehicles SET vehicle_status = 'ACTIVE', color = 'Silver' WHERE vehicle_id = 2;

-- Removing a vehicle by registration_number
DELETE FROM vehicles WHERE registration_number = 'MH12AB9012';

-- Removing all vehicles with vehicle_status = 'INACTIVE'
DELETE FROM vehicles WHERE vehicle_status = 'INACTIVE';
