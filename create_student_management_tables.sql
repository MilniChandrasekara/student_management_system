CREATE DATABASE student_management_system;

USE student_management_system;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    dept_code VARCHAR(10) NOT NULL UNIQUE,
    head_of_department VARCHAR(100),
    established_year YEAR,
    budget DECIMAL(15,2),
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    dept_id INT,
    designation ENUM('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer', 'Lab Assistant'),
    qualification VARCHAR(200),
    experience_years INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    status ENUM('Active', 'Inactive', 'On Leave') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL,
    INDEX idx_faculty_dept (dept_id),
    INDEX idx_faculty_status (status)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    blood_group VARCHAR(5),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(15),
    dept_id INT,
    program_type ENUM('Undergraduate', 'Graduate', 'Postgraduate'),
    admission_date DATE,
    expected_graduation_date DATE,
    status ENUM('Active', 'Inactive', 'Graduated', 'Suspended', 'Transferred') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL,
    INDEX idx_students_dept (dept_id),
    INDEX idx_students_status (status),
    INDEX idx_students_email (email),
    INDEX idx_students_number (student_number)
);

CREATE TABLE academic_calendar (
    calendar_id INT PRIMARY KEY AUTO_INCREMENT,
    academic_year VARCHAR(10) NOT NULL,
    semester_name VARCHAR(20) NOT NULL,
    semester_number INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    registration_start_date DATE,
    registration_end_date DATE,
    exam_start_date DATE,
    exam_end_date DATE,
    status ENUM('Active', 'Completed', 'Upcoming') DEFAULT 'Upcoming',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_calendar_year (academic_year),
    INDEX idx_calendar_status (status)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(200) NOT NULL,
    course_description TEXT,
    credit_hours INT NOT NULL,
    dept_id INT,
    course_type ENUM('Core', 'Elective', 'Lab', 'Project'),
    level ENUM('Beginner', 'Intermediate', 'Advanced'),
    max_capacity INT DEFAULT 50,
    prerequisites TEXT,
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL,
    INDEX idx_courses_dept (dept_id),
    INDEX idx_courses_code (course_code),
    INDEX idx_courses_status (status)
);

CREATE TABLE course_sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    calendar_id INT,
    section_number VARCHAR(10),
    faculty_id INT,
    schedule_days VARCHAR(20), -- 'MWF', 'TTh', etc.
    start_time TIME,
    end_time TIME,
    room_number VARCHAR(20),
    max_enrollment INT DEFAULT 50,
    current_enrollment INT DEFAULT 0,
    status ENUM('Open', 'Closed', 'Cancelled') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (calendar_id) REFERENCES academic_calendar(calendar_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL,
    INDEX idx_sections_course (course_id),
    INDEX idx_sections_faculty (faculty_id),
    INDEX idx_sections_calendar (calendar_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    section_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    enrollment_status ENUM('Enrolled', 'Dropped', 'Completed', 'Failed') DEFAULT 'Enrolled',
    grade ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'F', 'I', 'W'),
    grade_points DECIMAL(3,2),
    attendance_percentage DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(section_id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (student_id, section_id),
    INDEX idx_enrollments_student (student_id),
    INDEX idx_enrollments_section (section_id),
    INDEX idx_enrollments_status (enrollment_status)
);

CREATE TABLE fee_structure (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    program_type ENUM('Undergraduate', 'Graduate', 'Postgraduate'),
    dept_id INT,
    academic_year VARCHAR(10),
    semester_name VARCHAR(20),
    tuition_fee DECIMAL(10,2),
    lab_fee DECIMAL(10,2),
    library_fee DECIMAL(10,2),
    sports_fee DECIMAL(10,2),
    hostel_fee DECIMAL(10,2),
    other_fees DECIMAL(10,2),
    total_fee DECIMAL(10,2),
    due_date DATE,
    late_fee DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    INDEX idx_fee_program (program_type),
    INDEX idx_fee_dept (dept_id)
);

CREATE TABLE student_fees (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    fee_id INT,
    amount_due DECIMAL(10,2),
    amount_paid DECIMAL(10,2) DEFAULT 0,
    payment_date DATE,
    payment_method ENUM('Cash', 'Card', 'Bank Transfer', 'Cheque', 'Online'),
    transaction_id VARCHAR(100),
    payment_status ENUM('Pending', 'Partial', 'Paid', 'Overdue') DEFAULT 'Pending',
    late_fee_applied DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (fee_id) REFERENCES fee_structure(fee_id),
    INDEX idx_fees_student (student_id),
    INDEX idx_fees_status (payment_status)
);

CREATE TABLE library_books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(200),
    publisher VARCHAR(100),
    publication_year YEAR,
    category VARCHAR(50),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    location VARCHAR(50),
    status ENUM('Available', 'Maintenance', 'Lost', 'Damaged') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_books_title (title),
    INDEX idx_books_author (author),
    INDEX idx_books_category (category)
);

CREATE TABLE book_borrowings (
    borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    borrow_date DATE DEFAULT (CURRENT_DATE),
    due_date DATE,
    return_date DATE,
    fine_amount DECIMAL(8,2) DEFAULT 0,
    status ENUM('Borrowed', 'Returned', 'Overdue', 'Lost') DEFAULT 'Borrowed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES library_books(book_id),
    INDEX idx_borrowings_student (student_id),
    INDEX idx_borrowings_book (book_id),
    INDEX idx_borrowings_status (status)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    section_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent', 'Late', 'Excused') DEFAULT 'Present',
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(section_id) ON DELETE CASCADE,
    UNIQUE KEY unique_attendance (student_id, section_id, attendance_date),
    INDEX idx_attendance_student_section (student_id, section_id),
    INDEX idx_attendance_date (attendance_date)
);

CREATE TABLE hostels (
    hostel_id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_name VARCHAR(100) NOT NULL,
    hostel_type ENUM('Boys', 'Girls', 'Co-ed'),
    total_rooms INT,
    occupied_rooms INT DEFAULT 0,
    warden_name VARCHAR(100),
    warden_contact VARCHAR(15),
    address TEXT,
    facilities TEXT,
    status ENUM('Active', 'Maintenance', 'Closed') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_hostels_type (hostel_type),
    INDEX idx_hostels_status (status)
);

CREATE TABLE hostel_rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_id INT,
    room_number VARCHAR(10),
    room_type ENUM('Single', 'Double', 'Triple', 'Quad'),
    max_occupancy INT,
    current_occupancy INT DEFAULT 0,
    monthly_rent DECIMAL(8,2),
    facilities TEXT,
    status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id) ON DELETE CASCADE,
    INDEX idx_rooms_hostel (hostel_id),
    INDEX idx_rooms_status (status)
);

CREATE TABLE hostel_allocations (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    room_id INT,
    allocation_date DATE DEFAULT (CURRENT_DATE),
    checkout_date DATE,
    monthly_rent DECIMAL(8,2),
    security_deposit DECIMAL(8,2),
    status ENUM('Active', 'Checked Out', 'Terminated') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES hostel_rooms(room_id),
    INDEX idx_allocations_student (student_id),
    INDEX idx_allocations_room (room_id)
);

CREATE TABLE audit_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50),
    operation_type ENUM('INSERT', 'UPDATE', 'DELETE'),
    record_id INT,
    old_values JSON,
    new_values JSON,
    changed_by VARCHAR(100),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    INDEX idx_audit_table (table_name),
    INDEX idx_audit_timestamp (change_timestamp)
);

SELECT 'All tables created successfully!' as Status;