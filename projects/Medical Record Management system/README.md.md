# Hospital Management System - SQL Practical Exam

A comprehensive MySQL-based Hospital Management System project developed as part of practical coursework. It covers end-to-end database design, relationship mapping, advanced SQL functions, and operations to manage administrative tasks efficiently.

---

## Project Title
**Hospital Management System**

## Objective
Develop a fully functional **Hospital Management System** using **MySQL** where administrators can manage patient records, doctor schedules, appointments, billing, and medical reports. The implementation features CRUD operations, filtering, sorting, aggregation, key relationships, joins, subqueries, and advanced SQL functions.

---

## Database Schema & Tables

1. **Patients**
   - `patient_id` (Primary Key)
   - `name`, `dob`, `gender`, `phone_number`, `email`, `address`, `registration_date`

2. **Doctors**
   - `doctor_id` (Primary Key)
   - `name`, `specialization`, `phone_number`, `email`, `available_days`, `consultation_fee`, `experience`

3. **Departments**
   - `department_id` (Primary Key)
   - `department_name`

4. **Doctor_Department** (Mapping Table)
   - `doctor_id` (Foreign Key referencing `Doctors.doctor_id`)
   - `department_id` (Foreign Key referencing `Departments.department_id`)

5. **Appointments**
   - `appointment_id` (Primary Key)
   - `patient_id` (Foreign Key referencing `Patients.patient_id`)
   - `doctor_id` (Foreign Key referencing `Doctors.doctor_id`)
   - `appointment_date`, `status` ('Scheduled', 'Completed', 'Cancelled')

6. **Medical_Records**
   - `record_id` (Primary Key)
   - `patient_id` (Foreign Key referencing `Patients.patient_id`)
   - `doctor_id` (Foreign Key referencing `Doctors.doctor_id`)
   - `diagnosis`, `prescription`, `treatment_date`, `discharge_date`

7. **Billing**
   - `invoice_id` (Primary Key)
   - `patient_id` (Foreign Key referencing `Patients.patient_id`)
   - `appointment_id` (Foreign Key referencing `Appointments.appointment_id`)
   - `amount`, `payment_status` ('Paid', 'Pending', 'Cancelled'), `payment_date`

---

## Tasks & Functionalities Implemented

- **CRUD Operations**: Insert records, update patient information, and clean up cancelled appointments.
- **SQL Clauses**: Utilizing `WHERE`, `HAVING`, and `LIMIT` clauses for filtered data extraction.
- **Logical Operators**: Combining conditions using `AND`, `OR`, and `NOT`.
- **Sorting & Grouping**: Organizing data using `ORDER BY` and summarizing groups via `GROUP BY`.
- **Aggregate Functions**: Calculating total revenue, averages, minimums, maximums, and record counts (`SUM`, `AVG`, `MAX`, `MIN`, `COUNT`).
- **Primary & Foreign Key Relationships**: Enforcing data integrity across interconnected entities.
- **Joins**: Extracting related data using `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and simulated `FULL OUTER JOIN` (`UNION`).
- **Subqueries**: Nested queries for advanced filtering criteria.
- **Date & Time Functions**: Extracting intervals, computing date differences, and formatting dates.
- **String Manipulation**: Transforming strings using `UPPER`, `TRIM`, and handling missing values with `COALESCE`.
- **Window Functions**: Performing analytical calculations like ranking and running totals using `OVER()`.
- **CASE Expressions**: Implementing conditional logic for risk assessment and experience categorization.

---

## Query Execution & Output Screenshots

### 1. SQL Filtering & Clauses
Filtering doctors charging more than 1,000 consultation fees:
![SQL Clauses Output](Screenshots/Screenshot%20(Where%20caluse).png)

---

### 2. Inner Join (Doctors & Departments)
Retrieving doctors along with their department names:
![Inner Join Output](Screenshots/Screenshot%20(Join).png)

---

### 3. Left Join with Distinct Patients
Retrieving patients who have completed appointments:
![Left Join Output](Screenshots/Screenshot%20(Distinct).png)

---

### 4. Full Outer Join (UNION)
Finding patients who have never booked an appointment:
![Full Outer Join Output](Screenshots/Screenshots(union).png)

---

### 5. Window Functions (Running Total)
Calculating the running total of appointments over time:
![Window Function Output](Screenshots/Screenshot%20(total%20appointments).png)

---

### 6. SQL CASE Expressions
Categorizing doctor experience levels:
![CASE Statement Output](Screenshots/Screenshot%20(case).png)

---

## Instructions for Execution
1. Clone or download this repository.
2. Open **MySQL Workbench** or your preferred MySQL client.
3. Execute the complete SQL script file (`hospital_management.sql`) to create the database schema, insert sample data, and run all query operations.