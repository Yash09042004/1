-- Create Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age INT
);

-- Create Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- Create Reserves table
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

-- Insert sample data into Sailors
INSERT INTO Sailors (sid, sname, rating, age) VALUES 
(1, 'A', 10, 25),
(2, 'B', 8, 30),
(3, 'C', 7, 22),
(4, 'D', 9, 35);

-- Insert sample data into Boats
INSERT INTO Boats (bid, bname, color) VALUES 
(101, 'Boat1', 'Red'),
(102, 'Boat2', 'Green'),
(103, 'Boat3', 'Blue');

-- Insert sample data into Reserves
INSERT INTO Reserves (sid, bid, day) VALUES 
(1, 101, '2022-01-01'),
(2, 102, '2022-01-02'),
(3, 101, '2022-01-03'),
(4, 103, '2022-01-04'),
(1, 102, '2022-01-05'),
(2, 101, '2022-01-06'),
(1, 10, '2022-01-01');


-- Queries for Lab Practice Assignment

-- 1. Find all information of sailors who have reserved boat number 101
SELECT * 
FROM Sailors s
INNER JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 101;

-- 2. Find the name of the boat reserved by Bob
SELECT b.bname 
FROM Sailors s
INNER JOIN Reserves r ON s.sid = r.sid
INNER JOIN Boats b ON r.bid = b.bid
WHERE s.sname = 'Bob';

-- 3. Find the names of sailors who have reserved a red boat, and list in the order of age
SELECT s.sname,s.age
FROM Sailors s
INNER JOIN Reserves r ON s.sid = r.sid
INNER JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'Red'
ORDER BY s.age;

-- 4. Find the names of sailors who have reserved at least one boat
SELECT DISTINCT s.sname 
FROM Sailors s
INNER JOIN Reserves r ON s.sid = r.sid;

-- 5. Find the ids and names of sailors who have reserved two different boats on the same day
SELECT s.sid, s.sname 
FROM Sailors s
INNER JOIN Reserves r1 ON s.sid = r1.sid
INNER JOIN Reserves r2 ON s.sid = r2.sid AND r1.day = r2.day AND r1.bid <> r2.bid;

-- 6. Find the ids of sailors who have reserved a red boat or a green boat
SELECT DISTINCT s.sid 
FROM Sailors s
INNER JOIN Reserves r ON s.sid = r.sid
INNER JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('Red', 'Green');

-- 7. Find the name and the age of the youngest sailor
SELECT sname, age 
FROM Sailors
ORDER BY age ASC
LIMIT 1;

-- 8. Count the number of different sailor names
SELECT COUNT(DISTINCT sname) AS num_sailors 
FROM Sailors;

-- 9. Find the average age of sailors for each rating level
SELECT rating, AVG(age) AS avg_age 
FROM Sailors
GROUP BY rating;

-- 10. Find the average age of sailors for each rating level that has at least two sailors
SELECT rating, AVG(age) AS avg_age 
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;