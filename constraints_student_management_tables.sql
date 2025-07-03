USE student_management_system;

-- Credit hours constraint (1-6 credit hours)
ALTER TABLE courses 
ADD CONSTRAINT chk_credit_hours 
CHECK (credit_hours > 0 AND credit_hours <= 6);

-- Enrollment capacity constraint
ALTER TABLE course_sections 
ADD CONSTRAINT chk_enrollment_capacity 
CHECK (current_enrollment <= max_enrollment);

-- Attendance percentage constraint (0-100%)
ALTER TABLE enrollments 
ADD CONSTRAINT chk_attendance_percentage 
CHECK (attendance_percentage >= 0 AND attendance_percentage <= 100);

-- Payment amount constraint - allowing for overpayment scenarios
ALTER TABLE student_fees 
ADD CONSTRAINT chk_payment_amount 
CHECK (amount_paid >= 0 AND amount_paid <= amount_due + late_fee_applied + 1000); 

-- Book borrowing dates constraint
ALTER TABLE book_borrowings 
ADD CONSTRAINT chk_borrow_dates 
CHECK (due_date > borrow_date); 

-- Hostel allocation dates constraint
ALTER TABLE hostel_allocations 
ADD CONSTRAINT chk_allocation_dates 
CHECK (checkout_date IS NULL OR checkout_date >= allocation_date);

-- Course section time constraint
ALTER TABLE course_sections 
ADD CONSTRAINT chk_section_times 
CHECK (start_time < end_time);

-- Positive amounts constraint for student fees
ALTER TABLE student_fees 
ADD CONSTRAINT chk_positive_amounts 
CHECK (amount_due >= 0 AND amount_paid >= 0 AND late_fee_applied >= 0);

-- Academic calendar dates constraint
ALTER TABLE academic_calendar
ADD CONSTRAINT chk_calendar_dates
CHECK (start_date < end_date AND registration_start_date <= registration_end_date);

-- Faculty salary constraint (reasonable salary range)
ALTER TABLE faculty 
ADD CONSTRAINT chk_faculty_salary 
CHECK (salary >= 30000 AND salary <= 200000);

-- Department budget constraint (positive budget)
ALTER TABLE departments 
ADD CONSTRAINT chk_department_budget 
CHECK (budget > 0);

-- Course max capacity constraint
ALTER TABLE courses 
ADD CONSTRAINT chk_course_capacity 
CHECK (max_capacity > 0 AND max_capacity <= 200);

-- Hostel room occupancy constraint
ALTER TABLE hostel_rooms 
ADD CONSTRAINT chk_room_occupancy 
CHECK (current_occupancy >= 0 AND current_occupancy <= max_occupancy);

-- Hostel monthly rent constraint (positive rent)
ALTER TABLE hostel_rooms 
ADD CONSTRAINT chk_monthly_rent 
CHECK (monthly_rent > 0);

-- Book copies constraint
ALTER TABLE library_books 
ADD CONSTRAINT chk_book_copies 
CHECK (available_copies >= 0 AND available_copies <= total_copies);

-- Fine amount constraint (non-negative)
ALTER TABLE book_borrowings 
ADD CONSTRAINT chk_fine_amount 
CHECK (fine_amount >= 0);

-- Security deposit constraint (positive amount)
ALTER TABLE hostel_allocations 
ADD CONSTRAINT chk_security_deposit 
CHECK (security_deposit >= 0);

-- Fee structure amounts constraint (all positive)
ALTER TABLE fee_structure 
ADD CONSTRAINT chk_fee_amounts 
CHECK (tuition_fee >= 0 AND lab_fee >= 0 AND library_fee >= 0 AND 
       sports_fee >= 0 AND hostel_fee >= 0 AND other_fees >= 0 AND 
       total_fee >= 0 AND late_fee >= 0);

-- Faculty experience constraint (non-negative)
ALTER TABLE faculty 
ADD CONSTRAINT chk_experience_years 
CHECK (experience_years >= 0);

-- Student program type constraint (valid program types)
ALTER TABLE students 
ADD CONSTRAINT chk_program_type 
CHECK (program_type IN ('Undergraduate', 'Graduate', 'Postgraduate', 'Diploma'));

-- Course level constraint (valid levels)
ALTER TABLE courses 
ADD CONSTRAINT chk_course_level 
CHECK (level IN ('Beginner', 'Intermediate', 'Advanced'));

-- Gender constraint (valid values)
ALTER TABLE students 
ADD CONSTRAINT chk_gender 
CHECK (gender IN ('Male', 'Female', 'Other'));

-- Blood group constraint (valid blood groups)
ALTER TABLE students 
ADD CONSTRAINT chk_blood_group 
CHECK (blood_group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'));

-- Enrollment status constraint
ALTER TABLE enrollments 
ADD CONSTRAINT chk_enrollment_status 
CHECK (enrollment_status IN ('Enrolled', 'Completed', 'Dropped', 'Withdrawn'));

-- Payment status constraint
ALTER TABLE student_fees 
ADD CONSTRAINT chk_payment_status 
CHECK (payment_status IN ('Pending', 'Paid', 'Partial', 'Overdue', 'Cancelled'));

-- Attendance status constraint
ALTER TABLE attendance 
ADD CONSTRAINT chk_attendance_status 
CHECK (status IN ('Present', 'Absent', 'Late', 'Excused'));

-- Hostel type constraint
ALTER TABLE hostels 
ADD CONSTRAINT chk_hostel_type 
CHECK (hostel_type IN ('Boys', 'Girls', 'Co-ed'));

-- Room type constraint
ALTER TABLE hostel_rooms 
ADD CONSTRAINT chk_room_type 
CHECK (room_type IN ('Single', 'Double', 'Triple', 'Quad'));

SELECT 'All constraints added successfully! Database is ready for use.' as Status;