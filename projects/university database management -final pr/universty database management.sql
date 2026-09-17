CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments VALUES (1, 'Computer Science'), (2, 'Mathematics');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(3, 'Physics'),
(4, 'Business Administration');

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students VALUES 
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES 
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2001-03-10', '2023-01-15'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2002-07-19', '2024-08-01'),
(5, 'Chris', 'Wilson', 'chris.wilson@email.com', '2000-11-04', '2020-08-01'),
(6, 'Jessica', 'Taylor', 'jessica.taylor@email.com', '2003-09-12', '2025-01-10'),
(7, 'David', 'Anderson', 'david.anderson@email.com', '1998-12-30', '2019-08-01'),
(8, 'Sarah', 'Thomas', 'sarah.thomas@email.com', '2001-06-22', '2023-08-01'),
(9, 'James', 'Jackson', 'james.jackson@email.com', '2002-02-14', '2024-01-20'),
(10, 'Laura', 'White', 'laura.white@email.com', '2000-10-05', '2022-01-15'),
(11, 'Kevin', 'Harris', 'kevin.harris@email.com', '2001-04-18', '2023-08-01'),
(12, 'Anna', 'Martin', 'anna.martin@email.com', '2003-12-01', '2025-08-01');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses VALUES 
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES 
(103, 'Database Management Systems', 1, 4),
(104, 'Calculus I', 2, 3),
(105, 'Quantum Physics', 3, 4),
(106, 'Macroeconomics', 4, 3),
(107, 'Advanced Algorithms', 1, 4);


-- adding Salary column per assumption for Query 8
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 82000.00);
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES 
(3, 'Charlie', 'Green', 'charlie.green@univ.com', 1, 95000.00),
(4, 'Diana', 'Prince', 'diana.prince@univ.com', 3, 78000.00),
(5, 'Evan', 'Wright', 'evan.wright@univ.com', 4, 91000.00);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
(3, 3, 101, '2023-01-15'),
(4, 4, 101, '2024-08-01'),
(5, 5, 101, '2020-08-01'),
(6, 6, 101, '2025-01-10'),
(7, 7, 101, '2019-08-01'),
(8, 8, 101, '2023-08-01'),
(9, 9, 101, '2024-01-20'),
(10, 10, 101, '2022-01-15'),
(11, 11, 101, '2023-08-01'),
(12, 1, 102, '2022-08-01'),
(13, 2, 102, '2021-08-01'),
(14, 3, 102, '2023-01-15'),
(15, 4, 102, '2024-08-01'),
(16, 5, 102, '2020-08-01'),
(17, 6, 102, '2025-01-10'),
(18, 7, 103, '2019-08-01'),
(19, 8, 103, '2023-08-01'),
(20, 9, 104, '2024-01-20'),
(21, 10, 104, '2022-01-15'),
(22, 11, 105, '2023-08-01'),
(23, 12, 106, '2025-08-01');

SELECT * FROM Students;

UPDATE Students SET Email = 'john.newemail@email.com' WHERE StudentID = 1;

DELETE FROM Enrollments WHERE EnrollmentID = 5;

SELECT * FROM Students WHERE EnrollmentDate > '2022-12-31';

SELECT c.CourseID, c.CourseName, c.Credits 
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

SELECT CourseID, COUNT(StudentID) AS TotalStudents 
FROM Enrollments 
GROUP BY CourseID 
HAVING COUNT(StudentID) > 5;

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Courses c1 ON e1.CourseID = c1.CourseID AND c1.CourseName = 'Introduction to SQL'
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
JOIN Courses c2 ON e2.CourseID = c2.CourseID AND c2.CourseName = 'Data Structures';

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

SELECT AVG(Credits) AS AverageCredits 
FROM Courses;

SELECT MAX(i.Salary) AS MaxCSSalary 
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';


SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

SELECT FirstName, LastName 
FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE CourseID IN (
        SELECT CourseID 
        FROM Enrollments 
        GROUP BY CourseID 
        HAVING COUNT(StudentID) > 8
    )
);

SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear 
FROM Students;


SELECT CONCAT(FirstName, ' ', LastName) AS InstructorFullName 
FROM Instructors;

SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(StudentID) OVER (ORDER BY EnrollmentDate, EnrollmentID) AS RunningTotal
FROM Enrollments;

SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE 
           WHEN DATEDIFF(CURDATE(), EnrollmentDate) > (4 * 365) THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLabel
FROM Students;
