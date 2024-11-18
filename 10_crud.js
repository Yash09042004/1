// Switch to the desired database
use myDatabase;

// Create a collection named "students"
db.createCollection("students");

// Insert a single document into the "students" collection
db.students.insertOne({
    name: "harsh Bamane",
    age: 21,
    sub: "cs"
});

// Insert multiple documents into the "students" collection
db.students.insertMany([
    {name:"Yash Patil", age:20, sub:"physics"},
    {name:"Soumitra Bapat", age:21, sub:"chemistry"},
    {name:"Manmath Mungde", age:20, sub:"maths"}
  
  ]);

// Find all documents in the "students" collection
db.students.find();

// Find a specific document by a field
db.students.findOne({ name: "Yash Patil" });

// Find documents with a condition
db.students.find({ age: { $gt: 20 } });

// Update a single document
db.students.updateOne(
    { name: "Manmath Mungde" },
    { $set: { age: 22 } }
);

// Update multiple documents
db.students.updateMany(
    { age: { $lt: 22 } },
    { $set: { status: "Underage" } }
);

// Delete a single document
db.students.deleteOne({ name: "Manmath Mungde" });

// Delete multiple documents
db.students.deleteMany({ age: { $lt: 22 } });