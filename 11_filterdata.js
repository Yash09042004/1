// Switch to the desired database
use myDatabase;

// Create a collection named "students"
db.createCollection("students");

// Insert sample data into the "students" collection
db.students.insertMany([
    { name: "Yash Patil", age: 18, major: "Computer Science", gpa: 4.5 },
    { name: "Manmath Mungde", age: 19, major: "Mathematics", gpa: 3.8 },
    { name: "Kartikey Lodhe", age: 20, major: "Physics", gpa: 3.2 },
    { name: "Soumitra Bapat", age: 21, major: "Chemistry", gpa: 3.6 },
    { name: "Harsh Bamane", age: 22, major: "Biology", gpa: 3.1 },
    { name: "Suprit Bashetti", age: 23, major: "Computer Science", gpa: 3.9 },
    { name: "Vishal Desai", age: 24, major: "Mathematics", gpa: 3.7 }
]);

// Filter by a single field
db.students.find({ major: "Computer Science" });

// Filter with comparison operators
db.students.find({ gpa: { $lt: 3.5 } });

// Filter by multiple fields
db.students.find({ major: "Mathematics", gpa: { $gt: 3.5 } });

// Filter with logical operators
db.students.find({ $or: [{ major: "Physics" }, { gpa: { $gt: 3.7 } }] });

// Filter with regular expressions
db.students.find({ name: { $regex: /^Y/ } });

//case insensitive
db.students.find({ name: { $regex: /manmath/i } });

// Assuming we have an array field "courses" in the documents
// db.students.find({ courses: "Math 101" });

// Assuming we have a nested document "address" in the documents
// db.students.find({ "address.city": "New York" });

// Create an index on the "major" field to improve query performance
db.students.createIndex({ major: 1 });
db.students.createIndex({ age: 1 }, { unique: true });
db.students.createIndex({ gpa: 1 }, { sparse: true });