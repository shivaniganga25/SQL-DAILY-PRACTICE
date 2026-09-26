USE cdg_hyd_jfs_058;

CREATE TABLE patients (
    patient_id INT NOT NULL AUTO_INCREMENT,
    patient_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    biological_sex VARCHAR(20) NOT NULL,
    blood_group VARCHAR(20),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(120),
    emergency_contact_name VARCHAR(100) NOT NULL,
    emergency_contact_phone VARCHAR(15) NOT NULL,
    allergies TEXT,
    patient_status VARCHAR(20) NOT NULL DEFAULT 'Active',
    registed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `pk_patient_id` PRIMARY KEY (patient_id),
    CONSTRAINT `uq_patient_number` UNIQUE (patient_number),
    CONSTRAINT `chk_biological_sex` CHECK (biological_sex IN ('FEMALE', 'MALE', 'INTERSEX', 'NOT_DISCLOSED'))
);

ALTER TABLE patients AUTO_INCREMENT=001;
DROP TABLE patients;
SELECT * FROM patients;

INSERT INTO patients ( patient_number , first_name , last_name , date_of_birth , biological_sex , blood_group , phone , email , emergency_contact_name , emergency_contact_phone  ) 
VALUES ('PS01' , 'Shivani' , 'Mutyam' , '2004-12-25' , 'FEMALE' , 'O+' , '+91 6304746238' , 'shivani1@gmail.com' , 'Sada Shiva','+91 9177367282' );

INSERT INTO patients ( patient_number , first_name , last_name , date_of_birth , biological_sex , blood_group , phone , email , emergency_contact_name , emergency_contact_phone  ) 
VALUES ('PS0201' , 'Shiv' , 'Mut' , '2005-11-20' , 'MALE' , 'O-' , '+91 6300006238' , 'shiv1@gmail.com' , 'Saba','+91 9177777282' );

INSERT INTO patients ( patient_number , first_name , last_name , date_of_birth , biological_sex , blood_group , phone , email , emergency_contact_name , emergency_contact_phone  ) 
VALUES ('PS1021' , 'Shiva' , 'Gupta' , '2000-10-05' , 'MALE' , 'A+' , '+91 6304444238' , 'shiva1@gmail.com' , 'Shivani','+91 9133333282' );

-- Updating blood_group and allergies for a patient by patient_number
UPDATE patients SET blood_group = 'O+',allergies = 'Penicillin, Dust' WHERE patient_number = 'PS01';

-- Updating phone and patient_status for a patient by patient_id
UPDATE patients SET phone = '+91 9000011223',patient_status = 'Inactive' WHERE patient_id = 2;

-- Removing a patient by patient_number
DELETE FROM patients WHERE patient_number = 'PS1021';

-- Removing all patients with status 'Inactive'
DELETE FROM patients WHERE patient_status = 'Inactive';