#  Student Management System

A comprehensive MySQL-based Student Management System that allows universities or institutions to manage data related to students, courses, enrollments, departments, faculty, and more. This project includes well-defined tables, constraints, business rules, and sample data to simulate a realistic academic environment.

---

##  Features
 Manage Students, Courses, Faculty, Departments

 Handle Course Sections, Enrollments, Attendance, and Grades

 Enforce business rules using constraints and triggers

 Structured schema with foreign key relationships
 
---

## Technologies Used
 Database: MySQL

 Tool: MySQL Workbench

---

##  Installation & Usage

1. Clone the Repository
```bash
   git clone https://github.com/MilniChandrasekara/student_management_system.git
   cd student_management_system
```
2. Open MySQL Workbench

3. Run the Scripts in Order:

  •	Create database and tables:
  ```bash
source create_database.sql;
```
  •	Insert sample data:
  ```bash
source insert_sample_data.sql;
```
  •	Add constraints and rules:
  ```bash
source add_constraints.sql;
```
  •	Add triggers, views, or procedures:
  ```bash
source triggers.sql;
```

