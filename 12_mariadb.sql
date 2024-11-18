-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    major VARCHAR(50),
    gpa DECIMAL(3, 2)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    credits INT
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert data into students table
INSERT INTO students (name, age, major, gpa) VALUES
('Yash Patil', 21, 'Computer Science', 4.5),
('Manmath Mungde', 22, 'Mathematics', 3.8),
('Kartikey Lodhe', 20, 'Physics', 3.2),
('Soumitra Bapat', 23, 'Chemistry', 3.6),
('Harsh Bamane', 21, 'Biology', 3.1),
('Suprit Bashetti', 22, 'Computer Science', 3.9),
('Vishal Desai', 20, 'Mathematics', 3.7);

-- Insert data into courses table
INSERT INTO courses (course_name, credits) VALUES
('CS101', 3),
('Math101', 4),
('Phys101', 4),
('Chem101', 3),
('Bio101', 3);

-- Insert data into enrollments table
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2);

-- Select all students
SELECT * FROM students;

-- Select all courses
SELECT * FROM courses;

-- Select all enrollments
SELECT * FROM enrollments;

-- Join tables to retrieve student names and their enrolled courses
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;