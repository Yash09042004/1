-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    SSN VARCHAR(20),
    FNAME VARCHAR(20),
    LNAME VARCHAR(20),
    ADDRESS VARCHAR(20),
    SEX CHAR(1),
    SALARY INTEGER
);
-- Insert sample data Employee table
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY) VALUES 
('1', 'YASH', 'PATIL', 'JALGAON', 'M', 200000),
('2', 'SOUMITRA', 'BAPAT', 'SANGLI', 'M', 100000),
('3', 'MANMATH', 'MUNGDE', 'NANDED', 'M', 150000);

--Create Employee2 table
CREATE TABLE EMPLOYEE2 (
    SSN VARCHAR(20),
    FNAME VARCHAR(20),
    LNAME VARCHAR(20),
    ADDRESS VARCHAR(20),
    SEX CHAR(1),
    SALARY INTEGER
);

-- Insert sample data Employee2 table
INSERT INTO EMPLOYEE2 (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY) VALUES 
('126', 'Harsh', 'Patel', '101 Maple St', 'M', 52000),
('127', 'Vishal', 'Sharma', '202 Birch St', 'M', 58000),
('128', 'Suprit', 'Kumar', '303 Cedar St', 'M', 54000),
('1', 'YASH', 'PATIL', 'JALGAON', 'M', 200000),
('3', 'MANMATH', 'MUNGDE', 'NANDED', 'M', 150000);


-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(10),
    LOC VARCHAR(4),
    PINCODE INT
);
-- Insert sample data into DEPARTMENT
INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE) VALUES (1, 'HR', 'NY', 10001),
(2, 'IT', 'LA', 90001),
(3, 'Finance', 'SF', 94101);



-- Select operation
SELECT * FROM EMPLOYEE WHERE SEX = 'M';

-- Project operation
SELECT FNAME, LNAME FROM EMPLOYEE;

-- Intersect operation (requires two tables with the same structure)
-- Assuming we have another table EMPLOYEE2 with similar structure
SELECT * FROM EMPLOYEE
INTERSECT
SELECT * FROM EMPLOYEE2;

-- Minus operation using LEFT JOIN
SELECT e.*
FROM EMPLOYEE e
LEFT JOIN EMPLOYEE2 e2 ON e.SSN = e2.SSN AND e.FNAME = e2.FNAME AND e.LNAME = e2.LNAME AND e.ADDRESS = e2.ADDRESS AND e.SEX = e2.SEX AND e.SALARY = e2.SALARY
WHERE e2.SSN IS NULL;


-- Cartesian Product operation
-- Assuming we have another table DEPARTMENT
SELECT * FROM EMPLOYEE, DEPARTMENT;