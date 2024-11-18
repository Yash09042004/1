-- Create Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age INT
);

-- Insert sample data into Sailors
INSERT INTO Sailors (sid, sname, rating, age) VALUES 
(1, 'A', 10, 25),
(2, 'B', 8, 30),
(3, 'C', 7, 22),
(4, 'D', 9, 35);

-- Create Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- Insert sample data into Boats
INSERT INTO Boats (bid, bname, color) VALUES 
(101, 'Boat1', 'Red'),
(102, 'Boat2', 'Green'),
(103, 'Boat3', 'Blue');

-- Create Sailors_Log table
CREATE TABLE Sailors_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    sid INT,
    sname VARCHAR(50),
    rating INT,
    age INT,
    action VARCHAR(10),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a trigger to log changes to the Sailors table
CREATE TRIGGER after_sailors_update
AFTER UPDATE ON Sailors
FOR EACH ROW
BEGIN
    INSERT INTO Sailors_Log (sid, sname, rating, age, action)
    VALUES (NEW.sid, NEW.sname, NEW.rating, NEW.age, 'UPDATE');
END;

-- create a trigger to log changes to the Sailors table fro before insert 
CREATE TRIGGER bef_sail_insert
BEFORE INSERT ON Sailors
FOR EACH ROW
BEGIN
    IF NEW.rating <= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rating must be greater than 5';
    END IF;
END;

    


-- Create a view for Boats
CREATE VIEW Boats_View AS
SELECT bname, color
FROM Boats;

-- select from view
SELECT * FROM Boats_View;