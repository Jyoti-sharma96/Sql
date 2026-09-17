CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    registration_date DATE
);

INSERT INTO Patients (name, dob, gender, phone_number, email, address, registration_date) VALUES 
('John Doe', '1985-06-15', 'Male', '9876543210', 'john@example.com', '123 Main St', '2025-10-10'),
('Jane Smith', '1990-03-22', 'Female', '9876543211', 'jane@example.com', '456 Oak Ave', '2026-01-15'),
('Robert Johnson', '1975-11-05', 'Male', '9876543212', 'robert@example.com', '789 Pine Rd', '2024-05-20'),
('Emily Davis', '1995-08-12', 'Female', '9876543213', 'emily@example.com', '321 Elm St', '2026-02-01'),
('Michael Brown', '1968-12-30', 'Male', '9876543214', 'michael@example.com', '654 Maple Dr', '2023-11-10'),
('Sarah Wilson', '1992-04-18', 'Female', '9876543215', 'sarah@example.com', '111 Birch Rd', '2026-03-01'),
('David Miller', '1982-09-25', 'Male', '9876543216', 'david@example.com', '222 Cedar St', '2026-03-05'),
('Laura Moore', '1988-07-14', 'Female', '9876543217', 'laura@example.com', '333 Walnut Ave', '2025-12-20'),
('James Taylor', '1979-01-30', 'Male', '9876543218', 'james@example.com', '444 Ash St', '2025-11-15'),
('Linda Anderson', '1994-10-05', 'Female', '9876543219', 'linda@example.com', '555 Chestnut Dr', '2026-03-10');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10, 2),
    experience INT DEFAULT 0
);

INSERT INTO Doctors (name, specialization, phone_number, email, available_days, consultation_fee, experience) VALUES 
('Dr. Smith', 'Cardiology', '9123456789', 'smith@hospital.com', 'Mon-Fri', 1200.00, 16),
('Dr. Adams', 'Neurology', '9123456790', 'adams@hospital.com', 'Tue-Sat', 1500.00, 8),
('Dr. Evans', 'Dermatology', '9123456791', 'evans@hospital.com', 'Mon-Wed', 900.00, 4),
('Dr. Taylor', 'Orthopedics', '9123456792', 'taylor@hospital.com', 'Thu-Sat', 1100.00, 12),
('Dr. Brown', 'Pediatrics', '9123456793', 'brown@hospital.com', 'Mon-Sat', 800.00, 18),
('Dr. White', 'Oncology', '9123456794', 'white@hospital.com', 'Mon-Thu', 2000.00, 20),
('Dr. Green', 'Radiology', '9123456795', 'green@hospital.com', 'Wed-Sun', 1000.00, 7),
('Dr. Harris', 'Gynecology', '9123456796', 'harris@hospital.com', 'Tue-Fri', 1300.00, 11),
('Dr. Clark', 'Urology', '9123456797', 'clark@hospital.com', 'Mon-Fri', 1400.00, 9),
('Dr. Lewis', 'General Surgery', '9123456798', 'lewis@hospital.com', 'Mon-Sat', 1600.00, 14);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

INSERT INTO Departments (department_name) VALUES 
('Cardiology'),
('Neurology'),
('Dermatology'),
('Orthopedics'),
('Pediatrics'),
('Oncology'),
('Radiology'),
('Gynecology'),
('Urology'),
('General Surgery');

CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Doctor_Department (doctor_id, department_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(50), -- 'Scheduled', 'Completed', 'Cancelled'
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES 
(1, 1, '2026-03-25', 'Scheduled'),
(2, 2, '2026-03-20', 'Scheduled'),
(3, 3, '2026-02-10', 'Completed'),
(4, 1, '2025-09-15', 'Cancelled'),
(5, 4, '2026-01-05', 'Completed'),
(6, 6, '2026-03-12', 'Completed'),
(7, 7, '2026-03-14', 'Scheduled'),
(8, 8, '2025-08-20', 'Cancelled'),
(9, 9, '2026-03-18', 'Completed'),
(10, 10, '2026-03-19', 'Scheduled');

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    prescription TEXT,
    treatment_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Medical_Records (patient_id, doctor_id, diagnosis, prescription, treatment_date, discharge_date) VALUES 
(1, 1, 'Hypertension', 'Amlodipine 5mg', '2026-03-10', '2026-03-12'),
(2, 2, 'Migraine', 'Sumatriptan 50mg', '2026-03-15', '2026-03-15'),
(3, 3, 'Eczema', 'Hydrocortisone cream', '2026-01-10', '2026-01-10'),
(1, 3, 'Skin Allergy', 'Cetirizine', '2026-02-01', '2026-02-01'),
(1, 2, 'Mild Vertigo', 'Betahistine', '2026-02-15', '2026-02-15'),
(1, 4, 'Joint Pain', 'Ibuprofen', '2026-02-20', '2026-02-20'),
(1, 5, 'Routine Checkup', 'Vitamins', '2026-03-01', '2026-03-01'),
(6, 6, 'Benign Tumor', 'Observation', '2026-03-12', '2026-03-13'),
(9, 9, 'Kidney Stones', 'Pain relievers and hydration', '2026-03-18', '2026-03-18'),
(10, 10, 'Appendicitis', 'Appendectomy', '2026-03-19', '2026-03-22');

CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10, 2),
    payment_status VARCHAR(50), -- 'Paid', 'Pending', 'Cancelled'
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Billing (patient_id, appointment_id, amount, payment_status, payment_date) VALUES 
(1, 1, 1200.00, 'Pending', NULL),
(2, 2, 1500.00, 'Paid', '2026-03-20'),
(3, 3, 900.00, 'Paid', '2026-02-10'),
(5, 5, 1100.00, 'Paid', '2026-01-05'),
(6, 6, 2000.00, 'Paid', '2026-03-12'),
(7, 7, 1000.00, 'Pending', NULL),
(9, 9, 1400.00, 'Paid', '2026-03-18'),
(10, 10, 3500.00, 'Pending', NULL),
(4, 4, 1200.00, 'Cancelled', NULL),
(8, 8, 1300.00, 'Cancelled', NULL);

UPDATE Patients SET phone_number = '9998887776', address = '456 New St' WHERE patient_id = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Billing 
WHERE appointment_id IN (
    SELECT appointment_id FROM (
        SELECT appointment_id 
        FROM Appointments 
        WHERE status = 'Cancelled' 
          AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    ) AS temp
);


DELETE FROM Appointments 
WHERE status = 'Cancelled' 
  AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
  
  SELECT * FROM Patients WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
  
  SELECT patient_id, SUM(amount) AS total_spent 
FROM Billing GROUP BY patient_id ORDER BY total_spent DESC LIMIT 5;

SELECT * FROM Doctors WHERE consultation_fee > 1000;

SELECT * FROM Appointments WHERE status = 'Scheduled' AND doctor_id = 3;


SELECT * FROM Doctors WHERE specialization = 'Cardiology' OR specialization = 'Neurology';


SELECT * FROM Patients 
WHERE patient_id NOT IN (
    SELECT DISTINCT patient_id FROM Appointments WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

SELECT * FROM Doctors ORDER BY specialization ASC;


SELECT doctor_id, COUNT(DISTINCT patient_id) AS patient_count 
FROM Appointments GROUP BY doctor_id;


SELECT d.department_name, SUM(b.amount) AS total_revenue 
FROM Billing b
JOIN Appointments a ON b.appointment_id = a.appointment_id
JOIN Doctor_Department dd ON a.doctor_id = dd.doctor_id
JOIN Departments d ON dd.department_id = d.department_id
GROUP BY d.department_name;



SELECT SUM(amount) AS total_revenue FROM Billing WHERE payment_status = 'Paid';


SELECT doctor_id, COUNT(*) AS visit_count 
FROM Appointments GROUP BY doctor_id ORDER BY visit_count DESC LIMIT 1;


select avg(consultation_fee) AS avg_fee FROM Doctors;


SELECT doc.name, d.department_name 
FROM Doctors doc
JOIN Doctor_Department dd ON doc.doctor_id = dd.doctor_id
JOIN Departments d ON dd.department_id = d.department_id;


SELECT DISTINCT p.* 
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'Completed';


select a.* 
from Billing b
right join  Appointments a ON b.appointment_id = a.appointment_id
where b.invoice_id IS NULL;


SELECT p.* FROM Patients p LEFT JOIN Appointments a ON p.patient_id = a.patient_id WHERE a.appointment_id IS NULL
UNION
SELECT p.* FROM Patients p RIGHT JOIN Appointments a ON p.patient_id = a.patient_id WHERE p.patient_id IS NULL;



SELECT * FROM Doctors 
WHERE doctor_id IN (
    SELECT doctor_id FROM Appointments GROUP BY doctor_id HAVING COUNT(DISTINCT patient_id) > 50
);


SELECT * FROM Patients 
WHERE patient_id = (
    SELECT patient_id FROM Billing GROUP BY patient_id ORDER BY SUM(amount) DESC LIMIT 1
);


SELECT * FROM Appointments 
WHERE doctor_id IN (
    SELECT doctor_id FROM Doctors WHERE specialization = 'Dermatology'
);



SELECT MONTH(appointment_date) AS visit_month, COUNT(*) AS visit_count 
FROM Appointments GROUP BY MONTH(appointment_date);


SELECT record_id, DATEDIFF(discharge_date, treatment_date) AS stay_duration_days 
FROM Medical_Records;


SELECT DATE_FORMAT(treatment_date, '%d-%m-%Y') AS formatted_treatment_date 
FROM Medical_Records;


SELECT UPPER(name) AS uppercase_name FROM Patients;


SELECT TRIM(name) AS trimmed_name FROM Doctors;


SELECT COALESCE(NULLIF(phone_number, ''), 'Not Available') AS phone_number FROM Patients;



SELECT doctor_id, COUNT(DISTINCT patient_id) AS patient_count,
       RANK() OVER (ORDER BY COUNT(DISTINCT patient_id) DESC) as doctor_rank
FROM Appointments GROUP BY doctor_id;


SELECT payment_date, amount,
       SUM(amount) OVER (ORDER BY payment_date) AS cumulative_revenue
FROM Billing WHERE payment_status = 'Paid';


SELECT appointment_date, 
       COUNT(*) OVER (ORDER BY appointment_date) AS running_total_appointments
FROM Appointments;



SELECT p.patient_id, p.name,
       CASE 
           WHEN COUNT(m.record_id) > 5 THEN 'High'
           WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium'
           ELSE 'Low'
       END AS Patient_Risk_Level
FROM Patients p
LEFT JOIN Medical_Records m ON p.patient_id = m.patient_id
GROUP BY p.patient_id, p.name;


SELECT name, experience,
       CASE 
           WHEN experience > 15 THEN 'Senior'
           WHEN experience BETWEEN 5 AND 15 THEN 'Mid-Level'
           ELSE 'Junior'
       END AS Experience_Category
FROM Doctors;