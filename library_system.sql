START TRANSACTION;

CREATE DATABASE IF NOT EXISTS library_system;

USE library_system;

DROP TABLE IF EXISTS course_material, courses, department, library_resources;

CREATE TABLE library_resources (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_serial_number VARCHAR(50) NOT NULL UNIQUE,
    author VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    version VARCHAR(20) NOT NULL
);

CREATE TABLE department (
    dept_id VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id VARCHAR(10) NOT NULL PRIMARY KEY,
    course_name VARCHAR(50),
    course_description TEXT,
    credit_hours INT,
    dept_id VARCHAR(10) NOT NULL,

    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE course_material (
    course_id VARCHAR(10) NOT NULL,
    book_serial_number VARCHAR(50),
    software_license_number VARCHAR(100),
    material_name VARCHAR(50),

    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (book_serial_number) REFERENCES library_resources(book_serial_number)
);

-- 1. Insert library resources (ai generated)
INSERT INTO library_resources
    (book_serial_number, author, release_year, version)
VALUES
    ('BK1001', 'George Orwell', 1949, '1st Edition'),
    ('BK1002', 'J.K. Rowling', 1997, '2nd Edition'),
    ('BK1003', 'Robert C. Martin', 2008, '1st Edition'),
    ('BK1004', 'Paul Deitel', 2020, '3rd Edition'),
    ('BK1005', 'Andrew S. Tanenbaum', 2015, '6th Edition');

-- 2. Insert departments (ai generated)
INSERT INTO department
    (dept_id, dept_name)
VALUES
    ('D001', 'Computer Science'),
    ('D002', 'Mathematics'),
    ('D003', 'English'),
    ('D004', 'Information Technology');

-- 3. Insert courses (ai generated)
INSERT INTO courses
    (course_id, course_name, course_description, credit_hours, dept_id)
VALUES
    ('CS101', 'Intro to Programming', 'Programming fundamentals', 3, 'D001'),
    ('CS201', 'Database Systems', 'SQL and database design', 4, 'D001'),
    ('CS301', 'Software Engineering', 'Software development methods', 3, 'D001'),
    ('MATH101', 'College Algebra', 'Algebra and equations', 3, 'D002'),
    ('ENG101', 'English Composition', 'Writing and grammar', 3, 'D003'),
    ('IT201', 'Network Fundamentals', 'Computer networking basics', 4, 'D004');

-- 4. Insert course materials (ai generated)
INSERT INTO course_material
    (course_id, book_serial_number, software_license_number, material_name)
VALUES
    ('CS101', 'BK1004', NULL, 'Programming Textbook'),
    ('CS201', 'BK1003', NULL, 'Database Design Textbook'),
    ('CS201', NULL, 'LIC-SQL-001', 'SQL Software License'),
    ('CS301', 'BK1003', NULL, 'Software Engineering Textbook'),
    ('MATH101', 'BK1005', NULL, 'Mathematics Textbook'),
    ('ENG101', 'BK1001', NULL, 'Required Reading'),
    ('IT201', 'BK1005', NULL, 'Networking Textbook'),
    ('IT201', NULL, 'LIC-NET-002', 'Network Simulation Software');

SELECT * FROM library_resources;

SELECT * FROM department;

SELECT * FROM courses;

SELECT * FROM course_material;

COMMIT;