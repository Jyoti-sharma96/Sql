# University Course Management System - SQL Project

## Project Overview
The "Final Project" aims to synthesize and apply a broad range of SQL concepts through a comprehensive database design and query execution process. This project focuses on working with all types of SQL operations (CRUD, joins, subqueries, string and date manipulation, and window functions) to create a fully functional database system for a **University Course Management System**.

---

## Database Architecture & Tables
The database schema consists of five main relational tables with established primary and foreign key constraints:
1. **Departments**: Stores academic department records (`DepartmentID`, `DepartmentName`).
2. **Students**: Stores student profile information (`StudentID`, `FirstName`, `LastName`, `Email`, `BirthDate`, `EnrollmentDate`).
3. **Courses**: Stores course catalog details (`CourseID`, `CourseName`, `DepartmentID`, `Credits`).
4. **Instructors**: Contains instructor details and departmental affiliation (`InstructorID`, `FirstName`, `LastName`, `Email`, `DepartmentID`, `Salary`).
5. **Enrollments**: Manages course registration relationships (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`).

---

## Queries & Tasks Implemented

### 1. Perform CRUD Operations on all tables
- **CREATE / INSERT:** Populated all relational tables with comprehensive sample records.
- **READ:** Queried complete entity sets (e.g., `SELECT * FROM Students;`).
- **UPDATE:** Modified existing student records (e.g., updating student emails).
- **DELETE:** Safely managed and executed row deletions within enrollment logs.

### 2. Retrieve students who enrolled after 2022
```sql
SELECT * FROM Students 
WHERE EnrollmentDate > '2022-12-31';
```

### 3. Retrieve courses offered by the Mathematics department with a limit of 5 courses
```sql
SELECT c.CourseID, c.CourseName, c.Credits 
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
```

### 4. Get the number of students enrolled in each course, filtering for courses with more than 5 students
```sql
SELECT CourseID, COUNT(StudentID) AS TotalStudents 
FROM Enrollments 
GROUP BY CourseID 
HAVING COUNT(StudentID) > 5;
```

### 5. Find students who are enrolled in both Introduction to SQL and Data Structures
```sql
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Courses c1 ON e1.CourseID = c1.CourseID AND c1.CourseName = 'Introduction to SQL'
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
JOIN Courses c2 ON e2.CourseID = c2.CourseID AND c2.CourseName = 'Data Structures';
```

### 6. Find students who are either enrolled in Introduction to SQL or Data Structures
```sql
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');
```

### 7. Calculate the average number of credits for all courses
```sql
SELECT AVG(Credits) AS AverageCredits 
FROM Courses;
```

### 8. Find the maximum salary of instructors in the Computer Science department
```sql
SELECT MAX(i.Salary) AS MaxCSSalary 
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
```

### 9. Count the number of students enrolled in each department
```sql
SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;
```

### 10. INNER JOIN - Retrieve students and their corresponding courses
```sql
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
```

### 11. LEFT JOIN - Retrieve all students and their corresponding courses, if any
```sql
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;
```

### 12. Subquery - Find students enrolled in courses that have more than 10 students
```sql
SELECT FirstName, LastName 
FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE CourseID IN (
        SELECT CourseID 
        FROM Enrollments 
        GROUP BY CourseID 
        HAVING COUNT(StudentID) > 10
    )
);
```

### 13. Extract the year from the EnrollmentDate of students
```sql
SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear 
FROM Students;
```

### 14. Concatenate the instructor's first and last name
```sql
SELECT CONCAT(FirstName, ' ', LastName) AS InstructorFullName 
FROM Instructors;
```

### 15. Calculate the running total of students enrolled in courses
```sql
SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(StudentID) OVER (ORDER BY EnrollmentDate, EnrollmentID) AS RunningTotal
FROM Enrollments;
```

### 16. Label students as 'Senior' or 'Junior' based on their year of enrollment
```sql
SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE 
           WHEN DATEDIFF(CURDATE(), EnrollmentDate) > (4 * 365) THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLabel
FROM Students;
```

---

## Execution Screenshots & Output Validation

### 1. CRUD Operations & Date Filtering
![Screenshot 293](screenshots/Screenshot%20(293).png)

### 2. Multi-Table Joins (Intersection Query)
![Screenshot 294](screenshots/Screenshot%20(294).png)

### 3. Aggregate Functions & Average Calculations
![Screenshot 295](screenshots/Screenshot%20(295).png)

### 4. Nested Subqueries
![Screenshot 296](screenshots/Screenshot%20(296).png)

### 5. String Manipulation & Window Functions
![Screenshot 297](screenshots/Screenshot%20(297).png)

### 6. Conditional Logic (CASE Expressions)
![Screenshot 298](screenshots/Screenshot%20(298).png)
---

## Technologies Used
- **Database Management System:** MySQL / MySQL Workbench
- **Language:** Structured Query Language (SQL)
