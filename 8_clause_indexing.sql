-- Create DEPT table
CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(20)
);

-- Insert sample data into DEPT
INSERT INTO DEPT (DEPTNO, DNAME) VALUES 
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales');

-- Create EMP table
CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    JOB VARCHAR(10),
    HIREDATE DATE,
    MGR INT,
    SAL INT,
    DEPTNO INT,
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

-- Insert sample data into EMP
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES 
(1, 'Yash',    'Manager', NULL, '2020-01-01', 50000, 10),
(2, 'Harsh',   'Scientist', 1, '2020-02-01', 30000, 20),
(3, 'Soumitra', 'Analyst', 1, '2020-03-01', 40000, 30),
(4, 'Manmath', 'Salesman', 5, '2020-04-01', 35000, 40),
(5, 'Kartikey', 'Manager', NULL, '2020-05-01', 25000, 20);


-- 1. Display total salary spent for each job category
SELECT JOB, SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY JOB;

-- 2. Display lowest paid employee details under each manager
SELECT MGR, ENAME, SAL
FROM EMP e1
WHERE SAL = (SELECT MIN(SAL) FROM EMP e2 WHERE e2.MGR = e1.MGR)
ORDER BY MGR;

-- 3. Display number of employees working in each department and their department name
SELECT d.DNAME, COUNT(e.EMPNO) AS NUM_EMPLOYEES
FROM EMP e
INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
GROUP BY d.DNAME;

-- 4. Display the details of employees sorting the salary in increasing order
SELECT *
FROM EMP
ORDER BY SAL ASC;

-- 5. Show the record of employee earning salary greater than 16000 in each department
SELECT *
FROM EMP
WHERE SAL > 16000
ORDER BY DEPTNO;

-- 6. Write queries to implement and practice the above clauses
-- The above queries demonstrate the use of GROUP BY, HAVING, ORDER BY, and WHERE clauses.

-- 7. Create Unique and Clustered Index on given Database
-- Create a unique index on ENAME
CREATE UNIQUE INDEX idx_ename ON EMP(ENAME);

-- Create a clustered index on DEPTNO
CREATE INDEX idx_deptno ON EMP(SAL);