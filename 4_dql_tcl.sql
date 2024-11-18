-- Create the database
CREATE DATABASE customer_information;

-- Use the database
USE customer_information;

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50),
    PHONE VARCHAR(15),
    ADDRESS VARCHAR(100)
);

-- Insert sample data into CUSTOMER
INSERT INTO CUSTOMER (CUSTOMER_ID, NAME, EMAIL, PHONE,ADDRESS) VALUES 
('1', 'Harsh', 'harsh@gmail.com', '8787878787','Sangli'),
('2', 'Vishal', 'vishal@gmail.com', '9797979797','Kolhapur'),
('3', 'Suprit', 'suprit@gmail.com', '5757575757', 'M','Solapur'),
('4', 'YASH', 'yash@gmail.com','676767676767','Jalgaon'),
('5', 'MANMATH', 'manmath@gmail.com', '373737373737', 'M','Nanded');

-- Select all data
SELECT * FROM CUSTOMER;

-- Use SQL operators
-- Equality operator
SELECT * FROM CUSTOMER WHERE NAME = 'YASH';

-- Inequality operator
SELECT * FROM CUSTOMER WHERE NAME != 'YASH';

-- Greater than operator
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID > 1;

-- Less than operator
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID < 3;

-- LIKE operator
SELECT * FROM CUSTOMER WHERE EMAIL LIKE '%gmail.com';

-- IN operator
SELECT * FROM CUSTOMER WHERE NAME IN ('YASH', 'MANMATH','Suprit');

-- BETWEEN operator
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID BETWEEN 1 AND 2;


-- Start a transaction
START TRANSACTION;

-- Insert a new record
INSERT INTO CUSTOMER (CUSTOMER_ID, NAME, EMAIL, PHONE, ADDRESS) VALUES (6, 'AA', 'bob@example.com', '6666666666', 'NEW YORK');

-- Create a savepoint
SAVEPOINT S1;

-- Insert another record
INSERT INTO CUSTOMER (CUSTOMER_ID, NAME, EMAIL, PHONE, ADDRESS) VALUES (7, 'BB', 'charlie@example.com', '7777777777', 'FINLAND');

-- Rollback to savepoint
ROLLBACK TO S1;

-- Commit the transaction
COMMIT;