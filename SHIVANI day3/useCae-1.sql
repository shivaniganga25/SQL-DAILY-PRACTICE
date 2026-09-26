USE cdg_hyd_jfs_058;

CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT,
    admission_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    admission_date DATE NOT NULL,
    cgpa DECIMAL(4, 2) NOT NULL,
    student_status VARCHAR(15) NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_students_student_id` PRIMARY KEY (student_id),
    CONSTRAINT `uq_admission_number` UNIQUE (admission_number),
    CONSTRAINT `uq_email` UNIQUE (email),
    CONSTRAINT `chk_cgpa_range_between_0_00_and_10.00` CHECK (cgpa BETWEEN 0.00 AND 10.00)
);

ALTER TABLE students AUTO_INCREMENT = 101;
DROP TABLE students;
SELECT * FROM students;

INSERT INTO students 
(admission_number, first_name, last_name, email, phone, date_of_birth, program_name, admission_date, cgpa, student_status)
VALUES
('ST20260101', 'Aarav', 'Sharma', 'aarav.sharma@gmail.com', '9876543210', '2007-04-15', 'B.Tech Computer Science', '2026-06-01', 8.75, 'Active');

INSERT INTO students 
(admission_number, first_name, last_name, email, phone, date_of_birth, program_name, admission_date, cgpa, student_status)
VALUES
('ST20260102', 'Ishita', 'Reddy', 'ishita.reddy@gmail.com', '9123456780', '2006-11-22', 'B.Com Honours', '2026-06-01', 9.10, 'Active');

INSERT INTO students 
(admission_number, first_name, last_name, email, phone, date_of_birth, program_name, admission_date, cgpa, student_status)
VALUES
('ST20260103', 'Rohan', 'Iyer', 'rohan.iyer@gmail.com', '9988001122', '2007-01-30', 'B.Sc Physics', '2026-06-01', 7.85, 'Inactive');

-- Removing a student by admission_number
DELETE FROM students WHERE admission_number = 'ST20260103';

-- Removing alml students with status 'Inactive'
DELETE FROM students WHERE student_status = 'Inactive';

-- Updating CGPA and status for a specific student by admission_number
UPDATE students
SET cgpa = 9.25, student_status = 'Active',updated_at = CURRENT_TIMESTAMP WHERE admission_number = 'ST20260101';

-- Updating a phone number and email for a student by student_id
UPDATE students
SET phone = '9000011122',email = 'ishita.reddy2026@gmail.com',updated_at = CURRENT_TIMESTAMP WHERE student_id = 102;