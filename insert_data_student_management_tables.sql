USE student_management_system;

INSERT INTO departments (dept_name, dept_code, head_of_department, established_year, budget, location) VALUES
('Computer Science & Engineering', 'CSE', 'Dr. Sarah Johnson', 1995, 2500000.00, 'Engineering Block A'),
('Electronics & Communication', 'ECE', 'Dr. Michael Chen', 1992, 2200000.00, 'Engineering Block B'),
('Mechanical Engineering', 'ME', 'Dr. Robert Williams', 1988, 2800000.00, 'Engineering Block C'),
('Civil Engineering', 'CE', 'Dr. Emily Davis', 1985, 2600000.00, 'Engineering Block D'),
('Business Administration', 'MBA', 'Dr. James Wilson', 2000, 1800000.00, 'Management Block'),
('Mathematics', 'MATH', 'Dr. Lisa Anderson', 1990, 1200000.00, 'Science Block A'),
('Physics', 'PHY', 'Dr. David Thompson', 1987, 1500000.00, 'Science Block B'),
('Chemistry', 'CHEM', 'Dr. Maria Garcia', 1989, 1400000.00, 'Science Block C');

INSERT INTO faculty (employee_id, first_name, last_name, email, phone, address, dept_id, designation, qualification, experience_years, salary, hire_date, status) VALUES
('FAC001', 'Sarah', 'Johnson', 'sarah.johnson@university.edu', '555-0101', '123 Faculty Lane', 1, 'Professor', 'Ph.D. Computer Science', 15, 85000.00, '2010-08-15', 'Active'),
('FAC002', 'Michael', 'Chen', 'michael.chen@university.edu', '555-0102', '124 Faculty Lane', 2, 'Professor', 'Ph.D. Electronics Engineering', 18, 88000.00, '2008-01-20', 'Active'),
('FAC003', 'Robert', 'Williams', 'robert.williams@university.edu', '555-0103', '125 Faculty Lane', 3, 'Professor', 'Ph.D. Mechanical Engineering', 20, 90000.00, '2005-09-10', 'Active'),
('FAC004', 'Emily', 'Davis', 'emily.davis@university.edu', '555-0104', '126 Faculty Lane', 4, 'Professor', 'Ph.D. Civil Engineering', 16, 87000.00, '2009-06-01', 'Active'),
('FAC005', 'James', 'Wilson', 'james.wilson@university.edu', '555-0105', '127 Faculty Lane', 5, 'Professor', 'Ph.D. Business Administration', 12, 82000.00, '2012-03-15', 'Active'),
('FAC006', 'Lisa', 'Anderson', 'lisa.anderson@university.edu', '555-0106', '128 Faculty Lane', 6, 'Associate Professor', 'Ph.D. Mathematics', 8, 68000.00, '2016-08-20', 'Active'),
('FAC007', 'David', 'Thompson', 'david.thompson@university.edu', '555-0107', '129 Faculty Lane', 7, 'Associate Professor', 'Ph.D. Physics', 10, 70000.00, '2014-01-10', 'Active'),
('FAC008', 'Maria', 'Garcia', 'maria.garcia@university.edu', '555-0108', '130 Faculty Lane', 8, 'Associate Professor', 'Ph.D. Chemistry', 9, 69000.00, '2015-07-01', 'Active'),
('FAC009', 'John', 'Smith', 'john.smith@university.edu', '555-0109', '131 Faculty Lane', 1, 'Assistant Professor', 'Ph.D. Computer Science', 5, 58000.00, '2019-08-15', 'Active'),
('FAC010', 'Rachel', 'Brown', 'rachel.brown@university.edu', '555-0110', '132 Faculty Lane', 1, 'Assistant Professor', 'M.S. Computer Science', 3, 52000.00, '2021-01-20', 'Active'),
('FAC011', 'Alex', 'Miller', 'alex.miller@university.edu', '555-0111', '133 Faculty Lane', 2, 'Lecturer', 'M.S. Electronics', 4, 48000.00, '2020-09-01', 'Active'),
('FAC012', 'Jennifer', 'Taylor', 'jennifer.taylor@university.edu', '555-0112', '134 Faculty Lane', 3, 'Assistant Professor', 'Ph.D. Mechanical Engineering', 6, 60000.00, '2018-02-15', 'Active');

INSERT INTO students (student_number, first_name, last_name, email, phone, address, date_of_birth, gender, blood_group, emergency_contact_name, emergency_contact_phone, dept_id, program_type, admission_date, expected_graduation_date, status) VALUES
('STU2021001', 'Alice', 'Johnson', 'alice.johnson@student.edu', '555-1001', '201 Dorm Street', '2003-05-15', 'Female', 'A+', 'Mary Johnson', '555-2001', 1, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021002', 'Bob', 'Smith', 'bob.smith@student.edu', '555-1002', '202 Dorm Street', '2002-11-22', 'Male', 'B+', 'John Smith Sr.', '555-2002', 1, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021003', 'Carol', 'Davis', 'carol.davis@student.edu', '555-1003', '203 Dorm Street', '2003-03-10', 'Female', 'O+', 'Robert Davis', '555-2003', 2, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021004', 'David', 'Wilson', 'david.wilson@student.edu', '555-1004', '204 Dorm Street', '2002-08-18', 'Male', 'AB+', 'Linda Wilson', '555-2004', 2, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021005', 'Emma', 'Brown', 'emma.brown@student.edu', '555-1005', '205 Dorm Street', '2003-01-25', 'Female', 'B-', 'Michael Brown', '555-2005', 3, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021006', 'Frank', 'Miller', 'frank.miller@student.edu', '555-1006', '206 Dorm Street', '2002-12-05', 'Male', 'A-', 'Susan Miller', '555-2006', 3, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021007', 'Grace', 'Taylor', 'grace.taylor@student.edu', '555-1007', '207 Dorm Street', '2003-06-14', 'Female', 'O-', 'James Taylor', '555-2007', 4, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2021008', 'Henry', 'Anderson', 'henry.anderson@student.edu', '555-1008', '208 Dorm Street', '2002-09-30', 'Male', 'AB-', 'Patricia Anderson', '555-2008', 4, 'Undergraduate', '2021-08-20', '2025-05-15', 'Active'),
('STU2022001', 'Ivy', 'Thomas', 'ivy.thomas@student.edu', '555-1009', '209 Dorm Street', '2004-02-12', 'Female', 'A+', 'Charles Thomas', '555-2009', 1, 'Undergraduate', '2022-08-20', '2026-05-15', 'Active'),
('STU2022002', 'Jack', 'Jackson', 'jack.jackson@student.edu', '555-1010', '210 Dorm Street', '2003-07-08', 'Male', 'B+', 'Nancy Jackson', '555-2010', 1, 'Undergraduate', '2022-08-20', '2026-05-15', 'Active'),
('STU2020001', 'Kevin', 'White', 'kevin.white@student.edu', '555-1011', '211 Dorm Street', '2001-04-20', 'Male', 'O+', 'Helen White', '555-2011', 5, 'Graduate', '2020-08-20', '2024-05-15', 'Active'),
('STU2020002', 'Laura', 'Harris', 'laura.harris@student.edu', '555-1012', '212 Dorm Street', '2000-10-15', 'Female', 'AB+', 'George Harris', '555-2012', 5, 'Graduate', '2020-08-20', '2024-05-15', 'Active'),
('STU2023001', 'Mike', 'Clark', 'mike.clark@student.edu', '555-1013', '213 Dorm Street', '2005-01-03', 'Male', 'B-', 'Dorothy Clark', '555-2013', 2, 'Undergraduate', '2023-08-20', '2027-05-15', 'Active'),
('STU2023002', 'Nina', 'Lewis', 'nina.lewis@student.edu', '555-1014', '214 Dorm Street', '2004-11-28', 'Female', 'A-', 'Richard Lewis', '555-2014', 3, 'Undergraduate', '2023-08-20', '2027-05-15', 'Active'),
('STU2019001', 'Oscar', 'Walker', 'oscar.walker@student.edu', '555-1015', '215 Dorm Street', '1999-06-12', 'Male', 'O-', 'Barbara Walker', '555-2015', 1, 'Postgraduate', '2019-08-20', '2023-05-15', 'Graduated');

INSERT INTO academic_calendar (academic_year, semester_name, semester_number, start_date, end_date, registration_start_date, registration_end_date, exam_start_date, exam_end_date, status) VALUES
('2023-2024', 'Fall 2023', 1, '2023-08-21', '2023-12-15', '2023-08-01', '2023-08-20', '2023-12-01', '2023-12-15', 'Completed'),
('2023-2024', 'Spring 2024', 2, '2024-01-15', '2024-05-10', '2024-01-01', '2024-01-14', '2024-04-25', '2024-05-10', 'Completed'),
('2024-2025', 'Fall 2024', 1, '2024-08-20', '2024-12-14', '2024-08-01', '2024-08-19', '2024-11-30', '2024-12-14', 'Completed'),
('2024-2025', 'Spring 2025', 2, '2025-01-14', '2025-05-09', '2025-01-01', '2025-01-13', '2025-04-24', '2025-05-09', 'Active'),
('2025-2026', 'Fall 2025', 1, '2025-08-19', '2025-12-13', '2025-08-01', '2025-08-18', '2025-11-29', '2025-12-13', 'Upcoming');

INSERT INTO courses (course_code, course_name, course_description, credit_hours, dept_id, course_type, level, max_capacity, prerequisites, status) VALUES
('CSE101', 'Introduction to Programming', 'Basic programming concepts using Python', 3, 1, 'Core', 'Beginner', 60, 'None', 'Active'),
('CSE201', 'Data Structures', 'Implementation of fundamental data structures', 4, 1, 'Core', 'Intermediate', 50, 'CSE101', 'Active'),
('CSE301', 'Database Systems', 'Design and implementation of database systems', 3, 1, 'Core', 'Intermediate', 45, 'CSE201', 'Active'),
('CSE401', 'Software Engineering', 'Principles of software development lifecycle', 3, 1, 'Core', 'Advanced', 40, 'CSE301', 'Active'),
('CSE302', 'Computer Networks', 'Network protocols and communication', 3, 1, 'Elective', 'Intermediate', 35, 'CSE201', 'Active'),
('ECE101', 'Circuit Analysis', 'Basic electrical circuit analysis', 4, 2, 'Core', 'Beginner', 55, 'None', 'Active'),
('ECE201', 'Digital Electronics', 'Digital logic design and implementation', 3, 2, 'Core', 'Intermediate', 50, 'ECE101', 'Active'),
('ECE301', 'Signal Processing', 'Analog and digital signal processing', 4, 2, 'Core', 'Advanced', 40, 'ECE201', 'Active'),
('ME101', 'Engineering Mechanics', 'Statics and dynamics of mechanical systems', 3, 3, 'Core', 'Beginner', 60, 'None', 'Active'),
('ME201', 'Thermodynamics', 'Principles of thermodynamics and heat transfer', 4, 3, 'Core', 'Intermediate', 50, 'ME101', 'Active'),
('CE101', 'Surveying', 'Land surveying techniques and instruments', 3, 4, 'Core', 'Beginner', 55, 'None', 'Active'),
('CE201', 'Structural Analysis', 'Analysis of structures under various loads', 4, 4, 'Core', 'Intermediate', 45, 'CE101', 'Active'),
('MBA501', 'Strategic Management', 'Corporate strategy and competitive analysis', 3, 5, 'Core', 'Advanced', 30, 'None', 'Active'),
('MBA502', 'Financial Management', 'Corporate finance and investment decisions', 3, 5, 'Core', 'Advanced', 30, 'None', 'Active'),
('MATH101', 'Calculus I', 'Differential and integral calculus', 4, 6, 'Core', 'Beginner', 80, 'None', 'Active');

INSERT INTO course_sections (course_id, calendar_id, section_number, faculty_id, schedule_days, start_time, end_time, room_number, max_enrollment, current_enrollment, status) VALUES
(1, 3, 'A', 9, 'MWF', '09:00', '10:00', 'CSE-101', 60, 45, 'Closed'),
(1, 3, 'B', 10, 'TTh', '11:00', '12:30', 'CSE-102', 60, 38, 'Open'),
(2, 3, 'A', 1, 'MWF', '10:00', '11:00', 'CSE-201', 50, 42, 'Open'),
(3, 3, 'A', 9, 'TTh', '14:00', '15:30', 'CSE-301', 45, 35, 'Open'),
(6, 3, 'A', 11, 'MWF', '08:00', '09:00', 'ECE-101', 55, 48, 'Open'),
(7, 3, 'A', 2, 'TTh', '09:00', '10:30', 'ECE-201', 50, 40, 'Open'),
(9, 3, 'A', 12, 'MWF', '13:00', '14:00', 'ME-101', 60, 52, 'Open'),
(11, 3, 'A', 4, 'TTh', '15:00', '16:30', 'CE-101', 55, 43, 'Open'),
(15, 3, 'A', 6, 'MWF', '11:00', '12:00', 'MATH-101', 80, 65, 'Open'),
(1, 4, 'A', 10, 'MWF', '09:00', '10:00', 'CSE-101', 60, 25, 'Open'),
(2, 4, 'A', 9, 'TTh', '10:00', '11:30', 'CSE-201', 50, 18, 'Open'),
(4, 4, 'A', 1, 'MWF', '14:00', '15:00', 'CSE-401', 40, 12, 'Open'),
(5, 4, 'A', 9, 'TTh', '13:00', '14:30', 'CSE-302', 35, 15, 'Open'),
(8, 4, 'A', 2, 'MWF', '10:00', '11:00', 'ECE-301', 40, 20, 'Open'),
(10, 4, 'A', 12, 'TTh', '11:00', '12:30', 'ME-201', 50, 22, 'Open'),
(12, 4, 'A', 4, 'MWF', '15:00', '16:00', 'CE-201', 45, 28, 'Open'),
(13, 4, 'A', 5, 'TTh', '16:00', '17:30', 'MBA-501', 30, 8, 'Open'),
(14, 4, 'A', 5, 'MWF', '16:00', '17:00', 'MBA-502', 30, 6, 'Open');

INSERT INTO enrollments (student_id, section_id, enrollment_date, enrollment_status, grade, grade_points, attendance_percentage) VALUES
(1, 1, '2024-08-20', 'Completed', 'A', 4.00, 92.5),
(2, 1, '2024-08-20', 'Completed', 'B+', 3.33, 88.0),
(3, 6, '2024-08-20', 'Completed', 'A-', 3.67, 95.0),
(4, 6, '2024-08-20', 'Completed', 'B', 3.00, 85.5),
(1, 3, '2024-08-20', 'Completed', 'A+', 4.00, 96.0),
(2, 3, '2024-08-20', 'Completed', 'A', 4.00, 90.0),
(9, 2, '2024-08-20', 'Completed', 'B+', 3.33, 87.5),
(10, 2, '2024-08-20', 'Completed', 'A-', 3.67, 93.0),
(5, 7, '2024-08-20', 'Completed', 'B', 3.00, 89.0),
(6, 7, '2024-08-20', 'Completed', 'A', 4.00, 94.5),
(7, 8, '2024-08-20', 'Completed', 'A-', 3.67, 91.0),
(8, 8, '2024-08-20', 'Completed', 'B+', 3.33, 86.5),
(1, 12, '2025-01-14', 'Enrolled', NULL, NULL, 78.5),
(2, 11, '2025-01-14', 'Enrolled', NULL, NULL, 82.0),
(9, 10, '2025-01-14', 'Enrolled', NULL, NULL, 85.5),
(10, 10, '2025-01-14', 'Enrolled', NULL, NULL, 90.0),
(3, 15, '2025-01-14', 'Enrolled', NULL, NULL, 88.0),
(4, 15, '2025-01-14', 'Enrolled', NULL, NULL, 92.5),
(11, 18, '2025-01-14', 'Enrolled', NULL, NULL, 75.0),
(12, 18, '2025-01-14', 'Enrolled', NULL, NULL, 80.0);


INSERT INTO fee_structure (program_type, dept_id, academic_year, semester_name, tuition_fee, lab_fee, library_fee, sports_fee, hostel_fee, other_fees, total_fee, due_date, late_fee) VALUES
('Undergraduate', 1, '2024-2025', 'Fall 2024', 8000.00, 500.00, 200.00, 150.00, 2000.00, 300.00, 11150.00, '2024-09-15', 100.00),
('Undergraduate', 1, '2024-2025', 'Spring 2025', 8000.00, 500.00, 200.00, 150.00, 2000.00, 300.00, 11150.00, '2025-02-15', 100.00),
('Undergraduate', 2, '2024-2025', 'Fall 2024', 7500.00, 600.00, 200.00, 150.00, 2000.00, 300.00, 10750.00, '2024-09-15', 100.00),
('Undergraduate', 2, '2024-2025', 'Spring 2025', 7500.00, 600.00, 200.00, 150.00, 2000.00, 300.00, 10750.00, '2025-02-15', 100.00),
('Undergraduate', 3, '2024-2025', 'Fall 2024', 7800.00, 800.00, 200.00, 150.00, 2000.00, 300.00, 11250.00, '2024-09-15', 100.00),
('Undergraduate', 3, '2024-2025', 'Spring 2025', 7800.00, 800.00, 200.00, 150.00, 2000.00, 300.00, 11250.00, '2025-02-15', 100.00),
('Undergraduate', 4, '2024-2025', 'Fall 2024', 7600.00, 400.00, 200.00, 150.00, 2000.00, 300.00, 10650.00, '2024-09-15', 100.00),
('Undergraduate', 4, '2024-2025', 'Spring 2025', 7600.00, 400.00, 200.00, 150.00, 2000.00, 300.00, 10650.00, '2025-02-15', 100.00),
('Graduate', 5, '2024-2025', 'Fall 2024', 12000.00, 300.00, 300.00, 200.00, 2500.00, 500.00, 15800.00, '2024-09-15', 150.00),
('Graduate', 5, '2024-2025', 'Spring 2025', 12000.00, 300.00, 300.00, 200.00, 2500.00, 500.00, 15800.00, '2025-02-15', 150.00);

INSERT INTO student_fees (student_id, fee_id, amount_due, amount_paid, payment_date, payment_method, transaction_id, payment_status, late_fee_applied) VALUES
(1, 1, 11150.00, 11150.00, '2024-09-10', 'Bank Transfer', 'TXN2024090001', 'Paid', 0.00),
(1, 2, 11150.00, 5000.00, '2025-02-20', 'Card', 'TXN2025022001', 'Partial', 100.00),
(2, 1, 11150.00, 11150.00, '2024-09-08', 'Online', 'TXN2024090002', 'Paid', 0.00),
(2, 2, 11150.00, 0.00, NULL, NULL, NULL, 'Pending', 0.00),
(3, 3, 10750.00, 10750.00, '2024-09-12', 'Cheque', 'CHQ2024090001', 'Paid', 0.00),
(3, 4, 10750.00, 10750.00, '2025-02-14', 'Bank Transfer', 'TXN2025021401', 'Paid', 0.00),
(4, 3, 10750.00, 10750.00, '2024-09-15', 'Online', 'TXN2024091501', 'Paid', 0.00),
(4, 4, 10750.00, 8000.00, '2025-02-18', 'Card', 'TXN2025021801', 'Partial', 0.00),
(5, 5, 11250.00, 11250.00, '2024-09-05', 'Bank Transfer', 'TXN2024090501', 'Paid', 0.00),
(5, 6, 11250.00, 0.00, NULL, NULL, NULL, 'Overdue', 100.00),
(11, 9, 15800.00, 15800.00, '2024-09-01', 'Bank Transfer', 'TXN2024090101', 'Paid', 0.00),
(11, 10, 15800.00, 15800.00, '2025-02-12', 'Online', 'TXN2025021201', 'Paid', 0.00),
(12, 9, 15800.00, 15800.00, '2024-08-30', 'Bank Transfer', 'TXN2024083001', 'Paid', 0.00),
(12, 10, 15800.00, 10000.00, '2025-02-25', 'Card', 'TXN2025022501', 'Partial', 150.00);

INSERT INTO library_books (isbn, title, author, publisher, publication_year, category, total_copies, available_copies, location, status) VALUES
('978-0134685991', 'Effective Java', 'Joshua Bloch', 'Addison-Wesley', 2017, 'Computer Science', 5, 3, 'CS Section A1', 'Available'),
('978-0135166307', 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, 'Computer Science', 8, 5, 'CS Section A2', 'Available'),
('978-0262033848', 'Introduction to Algorithms', 'Cormen, Leiserson, Rivest, Stein', 'MIT Press', 2009, 'Computer Science', 10, 7, 'CS Section A3', 'Available'),
('978-0134494326', 'Database System Concepts', 'Silberschatz, Galvin, Gagne', 'McGraw-Hill', 2019, 'Computer Science', 6, 4, 'CS Section B1', 'Available'),
('978-0133594140', 'Computer Networks', 'Andrew S. Tanenbaum', 'Pearson', 2010, 'Computer Science', 4, 2, 'CS Section B2', 'Available'),
('978-0471117094', 'Engineering Circuit Analysis', 'William H. Hayt Jr.', 'McGraw-Hill', 2011, 'Electronics', 7, 5, 'ECE Section A1', 'Available'),
('978-0134715032', 'Digital Design and Computer Architecture', 'David Harris, Sarah Harris', 'Morgan Kaufmann', 2015, 'Electronics', 5, 3, 'ECE Section A2', 'Available'),
('978-0073398013', 'Fundamentals of Thermodynamics', 'Richard E. Sonntag', 'Wiley', 2013, 'Mechanical Engineering', 6, 4, 'ME Section A1', 'Available'),
('978-0134319650', 'Statics and Mechanics of Materials', 'Russell C. Hibbeler', 'Pearson', 2016, 'Mechanical Engineering', 8, 6, 'ME Section A2', 'Available'),
('978-0134610679', 'Structural Analysis', 'Russell C. Hibbeler', 'Pearson', 2017, 'Civil Engineering', 5, 3, 'CE Section A1', 'Available'),
('978-0133570897', 'Strategic Management', 'Fred R. David', 'Pearson', 2014, 'Business', 4, 2, 'BUS Section A1', 'Available'),
('978-0134730417', 'Calculus: Early Transcendentals', 'James Stewart', 'Cengage Learning', 2015, 'Mathematics', 12, 9, 'MATH Section A1', 'Available'),
('978-0134876986', 'University Physics with Modern Physics', 'Hugh D. Young', 'Pearson', 2019, 'Physics', 8, 6, 'PHY Section A1', 'Available'),
('978-0134293936', 'Chemistry: The Central Science', 'Theodore E. Brown', 'Pearson', 2017, 'Chemistry', 6, 4, 'CHEM Section A1', 'Available'),
('978-0321694683', 'Software Engineering', 'Ian Sommerville', 'Pearson', 2015, 'Computer Science', 7, 5, 'CS Section C1', 'Available');

INSERT INTO book_borrowings (student_id, book_id, borrow_date, due_date, return_date, fine_amount, status) VALUES
(1, 1, '2024-09-15', '2024-10-15', '2024-10-12', 0.00, 'Returned'),
(1, 3, '2024-10-20', '2024-11-20', NULL, 0.00, 'Borrowed'),
(2, 2, '2024-09-18', '2024-10-18', '2024-10-25', 7.00, 'Returned'),
(2, 4, '2024-11-01', '2024-12-01', NULL, 0.00, 'Borrowed'),
(3, 6, '2024-09-10', '2024-10-10', '2024-10-08', 0.00, 'Returned'),
(3, 7, '2024-10-25', '2024-11-25', NULL, 0.00, 'Borrowed'),
(4, 6, '2024-09-22', '2024-10-22', '2024-10-22', 0.00, 'Returned'),
(5, 8, '2024-10-05', '2024-11-05', NULL, 0.00, 'Borrowed'),
(6, 9, '2024-09-28', '2024-10-28', '2024-11-02', 5.00, 'Returned'),
(7, 10, '2024-10-12', '2024-11-12', NULL, 0.00, 'Borrowed'),
(8, 10, '2024-11-15', '2024-12-15', NULL, 0.00, 'Borrowed'),
(9, 1, '2024-11-20', '2024-12-20', NULL, 0.00, 'Borrowed'),
(10, 5, '2024-10-30', '2024-11-30', '2025-01-15', 46.00, 'Returned'),
(11, 11, '2024-09-05', '2024-10-05', '2024-10-03', 0.00, 'Returned'),
(12, 11, '2024-10-15', '2024-11-15', NULL, 0.00, 'Borrowed'),
(13, 12, '2024-11-08', '2024-12-08', NULL, 0.00, 'Borrowed'),
(14, 13, '2024-10-18', '2024-11-18', '2024-11-20', 2.00, 'Returned'),
(1, 15, '2024-12-01', '2025-01-01', NULL, 0.00, 'Borrowed');

INSERT INTO attendance (student_id, section_id, attendance_date, status, remarks) VALUES
(1, 1, '2024-08-21', 'Present', NULL),
(1, 1, '2024-08-23', 'Present', NULL),
(1, 1, '2024-08-26', 'Present', NULL),
(1, 1, '2024-08-28', 'Absent', 'Sick leave'),
(1, 1, '2024-08-30', 'Present', NULL),
(2, 1, '2024-08-21', 'Present', NULL),
(2, 1, '2024-08-23', 'Present', NULL),
(2, 1, '2024-08-26', 'Late', 'Traffic delay'),
(2, 1, '2024-08-28', 'Present', NULL),
(2, 1, '2024-08-30', 'Present', NULL),
(3, 6, '2024-08-21', 'Present', NULL),
(3, 6, '2024-08-23', 'Present', NULL),
(3, 6, '2024-08-26', 'Present', NULL),
(3, 6, '2024-08-28', 'Present', NULL),
(3, 6, '2024-08-30', 'Present', NULL),
(4, 6, '2024-08-21', 'Present', NULL),
(4, 6, '2024-08-23', 'Absent', 'Medical appointment'),
(4, 6, '2024-08-26', 'Present', NULL),
(4, 6, '2024-08-28', 'Present', NULL),
(4, 6, '2024-08-30', 'Absent', 'Family emergency'),
(1, 12, '2025-01-14', 'Present', NULL),
(1, 12, '2025-01-16', 'Present', NULL),
(1, 12, '2025-01-21', 'Present', NULL),
(1, 12, '2025-01-23', 'Absent', 'Flu'),
(1, 12, '2025-01-28', 'Present', NULL),
(2, 11, '2025-01-15', 'Present', NULL),
(2, 11, '2025-01-17', 'Present', NULL),
(2, 11, '2025-01-22', 'Late', 'Overslept'),
(2, 11, '2025-01-24', 'Present', NULL),
(2, 11, '2025-01-29', 'Present', NULL),
(9, 10, '2025-01-15', 'Present', NULL),
(9, 10, '2025-01-17', 'Present', NULL),
(9, 10, '2025-01-22', 'Present', NULL),
(9, 10, '2025-01-24', 'Present', NULL),
(9, 10, '2025-01-29', 'Present', NULL),
(10, 10, '2025-01-15', 'Present', NULL),
(10, 10, '2025-01-17', 'Present', NULL),
(10, 10, '2025-01-22', 'Present', NULL),
(10, 10, '2025-01-24', 'Present', NULL),
(10, 10, '2025-01-29', 'Present', NULL);

INSERT INTO hostels (hostel_name, hostel_type, total_rooms, occupied_rooms, warden_name, warden_contact, address, facilities, status) VALUES
('Sunrise Boys Hostel', 'Boys', 100, 85, 'Mr. Thomas Wilson', '555-3001', '101 Campus Drive', 'WiFi, Gym, Common Room, Laundry, Mess Hall', 'Active'),
('Moonlight Girls Hostel', 'Girls', 80, 72, 'Ms. Sarah Mitchell', '555-3002', '102 Campus Drive', 'WiFi, Library, Common Room, Laundry, Mess Hall', 'Active'),
('Unity Co-ed Hostel', 'Co-ed', 120, 95, 'Dr. James Rodriguez', '555-3003', '103 Campus Drive', 'WiFi, Gym, Study Hall, Laundry, Cafeteria', 'Active'),
('Green Valley Boys Hostel', 'Boys', 60, 48, 'Mr. Michael Davis', '555-3004', '104 Campus Drive', 'WiFi, Sports Room, Common Room, Laundry', 'Active'),
('Rose Garden Girls Hostel', 'Girls', 70, 55, 'Ms. Linda Johnson', '555-3005', '105 Campus Drive', 'WiFi, Music Room, Common Room, Laundry, Garden', 'Active'),
('Phoenix Graduate Hostel', 'Co-ed', 40, 28, 'Dr. Robert Chen', '555-3006', '106 Campus Drive', 'WiFi, Research Lounge, Private Study Rooms, Kitchenette', 'Active');

INSERT INTO hostel_rooms (hostel_id, room_number, room_type, max_occupancy, current_occupancy, monthly_rent, facilities, status) VALUES
-- Sunrise Boys Hostel
(1, '101', 'Double', 2, 2, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(1, '102', 'Double', 2, 2, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(1, '103', 'Single', 1, 1, 1800.00, 'AC, Attached Bathroom, Study Table, Wardrobe, Balcony', 'Occupied'),
(1, '104', 'Triple', 3, 3, 900.00, 'Fan, Shared Bathroom, Study Table, Wardrobe', 'Occupied'),
(1, '105', 'Double', 2, 1, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Available'),
-- Moonlight Girls Hostel
(2, '201', 'Double', 2, 2, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(2, '202', 'Single', 1, 1, 1800.00, 'AC, Attached Bathroom, Study Table, Wardrobe, Balcony', 'Occupied'),
(2, '203', 'Double', 2, 2, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(2, '204', 'Triple', 3, 2, 900.00, 'Fan, Shared Bathroom, Study Table, Wardrobe', 'Available'),
(2, '205', 'Double', 2, 0, 1200.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Available'),
-- Unity Co-ed Hostel
(3, '301', 'Single', 1, 1, 1600.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(3, '302', 'Double', 2, 2, 1100.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(3, '303', 'Double', 2, 1, 1100.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Available'),
(3, '304', 'Quad', 4, 4, 800.00, 'Fan, Shared Bathroom, Study Table, Wardrobe', 'Occupied'),
(3, '305', 'Triple', 3, 2, 950.00, 'AC, Shared Bathroom, Study Table, Wardrobe', 'Available'),
-- Phoenix Graduate Hostel
(6, '601', 'Single', 1, 1, 2200.00, 'AC, Attached Bathroom, Study Table, Wardrobe, Kitchenette', 'Occupied'),
(6, '602', 'Single', 1, 1, 2200.00, 'AC, Attached Bathroom, Study Table, Wardrobe, Kitchenette', 'Occupied'),
(6, '603', 'Double', 2, 2, 1800.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Occupied'),
(6, '604', 'Single', 1, 0, 2200.00, 'AC, Attached Bathroom, Study Table, Wardrobe, Kitchenette', 'Available'),
(6, '605', 'Double', 2, 1, 1800.00, 'AC, Attached Bathroom, Study Table, Wardrobe', 'Available');

INSERT INTO hostel_allocations (student_id, room_id, allocation_date, checkout_date, monthly_rent, security_deposit, status) VALUES
(1, 1, '2021-08-20', NULL, 1200.00, 2400.00, 'Active'),
(2, 1, '2021-08-20', NULL, 1200.00, 2400.00, 'Active'),
(9, 3, '2022-08-20', NULL, 1800.00, 3600.00, 'Active'),
(13, 4, '2023-08-20', NULL, 900.00, 1800.00, 'Active'),
(3, 6, '2021-08-20', NULL, 1200.00, 2400.00, 'Active'),
(7, 7, '2021-08-20', NULL, 1800.00, 3600.00, 'Active'),
(14, 8, '2023-08-20', NULL, 1200.00, 2400.00, 'Active'),
(5, 11, '2021-08-20', NULL, 1600.00, 3200.00, 'Active'),
(6, 12, '2021-08-20', NULL, 1100.00, 2200.00, 'Active'),
(8, 12, '2021-08-20', NULL, 1100.00, 2200.00, 'Active'),
(10, 13, '2022-08-20', NULL, 1100.00, 2200.00, 'Active'),
(11, 16, '2020-08-20', NULL, 2200.00, 4400.00, 'Active'),
(12, 17, '2020-08-20', NULL, 2200.00, 4400.00, 'Active'),
(4, 18, '2021-08-20', NULL, 1800.00, 3600.00, 'Active'),
(15, 3, '2019-08-20', '2023-05-15', 1800.00, 3600.00, 'Checked Out');

INSERT INTO audit_log (table_name, operation_type, record_id, old_values, new_values, changed_by, change_timestamp, ip_address) VALUES
('students', 'INSERT', 1, NULL, '{"student_number": "STU2021001", "first_name": "Alice", "last_name": "Johnson", "status": "Active"}', 'admin', '2021-08-20 10:30:00', '192.168.1.100'),
('students', 'UPDATE', 1, '{"email": "alice.johnson@temp.edu"}', '{"email": "alice.johnson@student.edu"}', 'registrar', '2021-08-21 14:15:00', '192.168.1.101'),
('enrollments', 'INSERT', 1, NULL, '{"student_id": 1, "section_id": 1, "enrollment_status": "Enrolled"}', 'advisor', '2024-08-20 09:00:00', '192.168.1.102'),
('enrollments', 'UPDATE', 1, '{"grade": null}', '{"grade": "A", "grade_points": 4.00}', 'instructor', '2024-12-15 16:45:00', '192.168.1.103'),
('student_fees', 'INSERT', 1, NULL, '{"student_id": 1, "fee_id": 1, "amount_due": 11150.00, "payment_status": "Pending"}', 'finance', '2024-08-20 11:00:00', '192.168.1.104'),
('student_fees', 'UPDATE', 1, '{"payment_status": "Pending", "amount_paid": 0.00}', '{"payment_status": "Paid", "amount_paid": 11150.00}', 'finance', '2024-09-10 13:30:00', '192.168.1.104'),
('book_borrowings', 'INSERT', 1, NULL, '{"student_id": 1, "book_id": 1, "status": "Borrowed"}', 'librarian', '2024-09-15 10:15:00', '192.168.1.105'),
('book_borrowings', 'UPDATE', 1, '{"status": "Borrowed", "return_date": null}', '{"status": "Returned", "return_date": "2024-10-12"}', 'librarian', '2024-10-12 14:20:00', '192.168.1.105'),
('hostel_allocations', 'INSERT', 1, NULL, '{"student_id": 1, "room_id": 1, "status": "Active"}', 'warden', '2021-08-20 15:45:00', '192.168.1.106'),
('faculty', 'UPDATE', 9, '{"salary": 55000.00}', '{"salary": 58000.00}', 'hr', '2024-01-01 09:00:00', '192.168.1.107'),
('courses', 'INSERT', 1, NULL, '{"course_code": "CSE101", "course_name": "Introduction to Programming", "status": "Active"}', 'admin', '2023-05-15 11:30:00', '192.168.1.108'),
('departments', 'UPDATE', 1, '{"budget": 2300000.00}', '{"budget": 2500000.00}', 'admin', '2024-07-01 10:00:00', '192.168.1.100');

-- Create some helpful views for common queries
CREATE VIEW student_enrollment_summary AS
SELECT 
    s.student_id,
    s.student_number,
    CONCAT(s.first_name, ' ', s.last_name) as student_name,
    s.email,
    d.dept_name,
    s.program_type,
    COUNT(e.enrollment_id) as total_enrollments,
    AVG(e.grade_points) as gpa,
    AVG(e.attendance_percentage) as avg_attendance
FROM students s
LEFT JOIN departments d ON s.dept_id = d.dept_id
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE s.status = 'Active'
GROUP BY s.student_id, s.student_number, s.first_name, s.last_name, s.email, d.dept_name, s.program_type;

CREATE VIEW course_enrollment_stats AS
SELECT 
    c.course_id,
    c.course_code,
    c.course_name,
    d.dept_name,
    cs.section_number,
    CONCAT(f.first_name, ' ', f.last_name) as instructor,
    cs.max_enrollment,
    cs.current_enrollment,
    (cs.current_enrollment / cs.max_enrollment * 100) as enrollment_percentage
FROM courses c
JOIN course_sections cs ON c.course_id = cs.course_id
JOIN departments d ON c.dept_id = d.dept_id
LEFT JOIN faculty f ON cs.faculty_id = f.faculty_id
WHERE cs.status = 'Open';

SELECT 
    s.student_id,
    s.student_number,
    CONCAT(s.first_name, ' ', s.last_name) as student_name,
    fs.academic_year,
    fs.semester_name,
    fs.total_fee,
    sf.amount_paid,
    (fs.total_fee - sf.amount_paid) as balance_due,
    sf.payment_status,
    sf.late_fee_applied
FROM students s
JOIN student_fees sf ON s.student_id = sf.student_id
JOIN fee_structure fs ON sf.fee_id = fs.fee_id
WHERE s.status = 'Active';

SELECT 'Sample data inserted successfully! Database is ready for use.' as Status;
