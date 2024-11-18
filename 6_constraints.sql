-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DEPTNO INT(3) PRIMARY KEY,
    DNAME VARCHAR(20)
);
-- Insert sample data into DEPARTMENT
INSERT INTO DEPARTMENT (DEPTNO, DNAME) VALUES 
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales');

-- Create EMP table with foreign key constraint
CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    JOB VARCHAR(10) NOT NULL,
    DEPTNO INT,
    SAL DECIMAL(7, 2),
    CONSTRAINT emp_deptno_fk FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT(DEPTNO),
    CONSTRAINT emp_empno_check CHECK (EMPNO > 100),
    CONSTRAINT emp_sal_unique UNIQUE (SAL)
);
-- Insert sample data into EMP
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES 
(101, 'Yash', 'Manager', 10, 50000.00),
(102, 'Soumitra', 'Employee', 20, 30000.00),
(103, 'Manmath', 'Analyst', 30, 40000.00),
(104, 'Harsh', 'Salesman', 40, 35000.00);




-- Attempt to insert a record with EMPNO <= 100 (should fail)
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (100, 'E', 'Developer', 50, 45000.00);

-- Attempt to insert a record with a duplicate Sal (should fail)
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (105, 'F', 'Manager', 10, 45000.00);

-- Attempt to insert a record with NULL ENAME (should fail)
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (106, NULL, 'Clerk', 60, 25000.00);

-- Attempt to insert a record with NULL JOB (should fail)
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (107, 'G', NULL, 70, 30000.00);

-- Attempt to insert a record with a non-existent DEPTNO (should fail due to referential constraint)
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (109, 'I', 'Developer', 50, 45000.00);

-- Insert a valid record
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (108, 'H', 'Engineer', 20, 60000.00);
