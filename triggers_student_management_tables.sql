USE student_management_system;

DELIMITER //

-- Update current enrollment when student enrolls
CREATE TRIGGER tr_enrollment_insert
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    UPDATE course_sections 
    SET current_enrollment = current_enrollment + 1
    WHERE section_id = NEW.section_id;
END //

-- Update current enrollment when enrollment is deleted
CREATE TRIGGER tr_enrollment_delete
AFTER DELETE ON enrollments
FOR EACH ROW
BEGIN
    UPDATE course_sections 
    SET current_enrollment = current_enrollment - 1
    WHERE section_id = OLD.section_id;
END //

-- Update enrollment status and capacity
CREATE TRIGGER tr_enrollment_status_update
AFTER UPDATE ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.enrollment_status != OLD.enrollment_status THEN
        IF NEW.enrollment_status = 'Dropped' AND OLD.enrollment_status = 'Enrolled' THEN
            UPDATE course_sections 
            SET current_enrollment = current_enrollment - 1
            WHERE section_id = NEW.section_id;
        ELSEIF NEW.enrollment_status = 'Enrolled' AND OLD.enrollment_status = 'Dropped' THEN
            UPDATE course_sections 
            SET current_enrollment = current_enrollment + 1
            WHERE section_id = NEW.section_id;
        END IF;
    END IF;
END //

-- Calculate grade points automatically when grade is assigned
CREATE TRIGGER tr_calculate_grade_points
BEFORE UPDATE ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade IS NOT NULL THEN
        CASE NEW.grade
            WHEN 'A+' THEN SET NEW.grade_points = 4.0;
            WHEN 'A' THEN SET NEW.grade_points = 4.0;
            WHEN 'A-' THEN SET NEW.grade_points = 3.7;
            WHEN 'B+' THEN SET NEW.grade_points = 3.3;
            WHEN 'B' THEN SET NEW.grade_points = 3.0;
            WHEN 'B-' THEN SET NEW.grade_points = 2.7;
            WHEN 'C+' THEN SET NEW.grade_points = 2.3;
            WHEN 'C' THEN SET NEW.grade_points = 2.0;
            WHEN 'C-' THEN SET NEW.grade_points = 1.7;
            WHEN 'D+' THEN SET NEW.grade_points = 1.3;
            WHEN 'D' THEN SET NEW.grade_points = 1.0;
            WHEN 'F' THEN SET NEW.grade_points = 0.0;
            ELSE SET NEW.grade_points = NULL;
        END CASE;
    END IF;
END //

-- Update book availability when borrowed
CREATE TRIGGER tr_book_borrow
AFTER INSERT ON book_borrowings
FOR EACH ROW
BEGIN
    UPDATE library_books 
    SET available_copies = available_copies - 1
    WHERE book_id = NEW.book_id AND available_copies > 0;
END //

-- Update book availability when returned
CREATE TRIGGER tr_book_return
AFTER UPDATE ON book_borrowings
FOR EACH ROW
BEGIN
    IF NEW.status = 'Returned' AND OLD.status IN ('Borrowed', 'Overdue') THEN
        UPDATE library_books 
        SET available_copies = available_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END //

-- Calculate fine for overdue books
CREATE TRIGGER tr_calculate_fine
BEFORE UPDATE ON book_borrowings
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date > NEW.due_date THEN
        SET NEW.fine_amount = DATEDIFF(NEW.return_date, NEW.due_date) * 2.00; -- $2 per day
    END IF;
END //

-- Update hostel room occupancy when allocated
CREATE TRIGGER tr_hostel_allocation_insert
AFTER INSERT ON hostel_allocations
FOR EACH ROW
BEGIN
    UPDATE hostel_rooms 
    SET current_occupancy = current_occupancy + 1,
        status = CASE 
            WHEN current_occupancy + 1 >= max_occupancy THEN 'Occupied'
            ELSE status
        END
    WHERE room_id = NEW.room_id;
    
    -- Update hostel occupied rooms count
    UPDATE hostels h
    JOIN hostel_rooms hr ON h.hostel_id = hr.hostel_id
    SET h.occupied_rooms = (
        SELECT COUNT(*) 
        FROM hostel_rooms 
        WHERE hostel_id = h.hostel_id AND current_occupancy > 0
    )
    WHERE hr.room_id = NEW.room_id;
END //

-- Update hostel room occupancy on checkout
CREATE TRIGGER tr_hostel_allocation_update
AFTER UPDATE ON hostel_allocations
FOR EACH ROW
BEGIN
    IF NEW.status = 'Checked Out' AND OLD.status = 'Active' THEN
        UPDATE hostel_rooms 
        SET current_occupancy = current_occupancy - 1,
            status = CASE 
                WHEN current_occupancy - 1 = 0 THEN 'Available'
                ELSE status
            END
        WHERE room_id = NEW.room_id;
        
        -- Update hostel occupied rooms count
        UPDATE hostels h
        JOIN hostel_rooms hr ON h.hostel_id = hr.hostel_id
        SET h.occupied_rooms = (
            SELECT COUNT(*) 
            FROM hostel_rooms 
            WHERE hostel_id = h.hostel_id AND current_occupancy > 0
        )
        WHERE hr.room_id = NEW.room_id;
    END IF;
END //

-- Audit trail for student updates
CREATE TRIGGER tr_student_audit
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation_type, record_id, old_values, new_values, changed_by)
    VALUES (
        'students', 
        'UPDATE', 
        NEW.student_id,
        JSON_OBJECT(
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'email', OLD.email,
            'status', OLD.status
        ),
        JSON_OBJECT(
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'email', NEW.email,
            'status', NEW.status
        ),
        USER()
    );
END //

-- Prevent enrollment in full sections
CREATE TRIGGER tr_prevent_overenrollment
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    DECLARE section_capacity INT;
    DECLARE current_count INT;
    
    SELECT max_enrollment, current_enrollment 
    INTO section_capacity, current_count
    FROM course_sections 
    WHERE section_id = NEW.section_id;
    
    IF current_count >= section_capacity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot enroll: Section is at maximum capacity';
    END IF;
END //

-- Validate course section scheduling
CREATE TRIGGER tr_validate_section_schedule
BEFORE INSERT ON course_sections
FOR EACH ROW
BEGIN
    DECLARE schedule_conflict INT DEFAULT 0;
    
    -- Check for scheduling conflicts with same room
    SELECT COUNT(*) INTO schedule_conflict
    FROM course_sections cs
    JOIN academic_calendar ac1 ON cs.calendar_id = ac1.calendar_id
    JOIN academic_calendar ac2 ON NEW.calendar_id = ac2.calendar_id
    WHERE cs.room_number = NEW.room_number
    AND cs.schedule_days = NEW.schedule_days
    AND cs.start_time < NEW.end_time
    AND cs.end_time > NEW.start_time
    AND ac1.academic_year = ac2.academic_year
    AND ac1.semester_name = ac2.semester_name
    AND cs.status = 'Open';
    
    IF schedule_conflict > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Schedule conflict: Room is already booked for this time slot';
    END IF;
END //

-- Update fee total when components change
CREATE TRIGGER tr_calculate_total_fee
BEFORE INSERT ON fee_structure
FOR EACH ROW
BEGIN
    SET NEW.total_fee = COALESCE(NEW.tuition_fee, 0) + 
                       COALESCE(NEW.lab_fee, 0) + 
                       COALESCE(NEW.library_fee, 0) + 
                       COALESCE(NEW.sports_fee, 0) + 
                       COALESCE(NEW.hostel_fee, 0) + 
                       COALESCE(NEW.other_fees, 0);
END //

CREATE TRIGGER tr_update_total_fee
BEFORE UPDATE ON fee_structure
FOR EACH ROW
BEGIN
    SET NEW.total_fee = COALESCE(NEW.tuition_fee, 0) + 
                       COALESCE(NEW.lab_fee, 0) + 
                       COALESCE(NEW.library_fee, 0) + 
                       COALESCE(NEW.sports_fee, 0) + 
                       COALESCE(NEW.hostel_fee, 0) + 
                       COALESCE(NEW.other_fees, 0);
END //

-- Set due date for book borrowings
CREATE TRIGGER tr_set_book_due_date
BEFORE INSERT ON book_borrowings
FOR EACH ROW
BEGIN
    IF NEW.due_date IS NULL THEN
        SET NEW.due_date = DATE_ADD(NEW.borrow_date, INTERVAL 14 DAY); -- 2 weeks default
    END IF;
END //

-- Update attendance percentage in enrollments
CREATE TRIGGER tr_update_attendance_percentage
AFTER INSERT ON attendance
FOR EACH ROW
BEGIN
    UPDATE enrollments 
    SET attendance_percentage = (
        SELECT (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*))
        FROM attendance 
        WHERE student_id = NEW.student_id 
        AND section_id = NEW.section_id
    )
    WHERE student_id = NEW.student_id 
    AND section_id = NEW.section_id;
END //

-- Update attendance percentage when attendance is modified
CREATE TRIGGER tr_update_attendance_percentage_on_update
AFTER UPDATE ON attendance
FOR EACH ROW
BEGIN
    UPDATE enrollments 
    SET attendance_percentage = (
        SELECT (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*))
        FROM attendance 
        WHERE student_id = NEW.student_id 
        AND section_id = NEW.section_id
    )
    WHERE student_id = NEW.student_id 
    AND section_id = NEW.section_id;
END //

-- Audit trail for faculty updates
CREATE TRIGGER tr_faculty_audit
AFTER UPDATE ON faculty
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation_type, record_id, old_values, new_values, changed_by)
    VALUES (
        'faculty', 
        'UPDATE', 
        NEW.faculty_id,
        JSON_OBJECT(
            'employee_id', OLD.employee_id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'email', OLD.email,
            'salary', OLD.salary,
            'status', OLD.status
        ),
        JSON_OBJECT(
            'employee_id', NEW.employee_id,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'email', NEW.email,
            'salary', NEW.salary,
            'status', NEW.status
        ),
        USER()
    );
END //

-- Prevent double allocation of same room
CREATE TRIGGER tr_prevent_double_allocation
BEFORE INSERT ON hostel_allocations
FOR EACH ROW
BEGIN
    DECLARE room_availability INT;
    DECLARE current_occupants INT;
    DECLARE max_capacity INT;
    
    SELECT current_occupancy, max_occupancy 
    INTO current_occupants, max_capacity
    FROM hostel_rooms 
    WHERE room_id = NEW.room_id;
    
    IF current_occupants >= max_capacity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot allocate: Room is at maximum capacity';
    END IF;
    
    -- Check if student already has active allocation
    SELECT COUNT(*) INTO room_availability
    FROM hostel_allocations 
    WHERE student_id = NEW.student_id 
    AND status = 'Active';
    
    IF room_availability > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot allocate: Student already has an active room allocation';
    END IF;
END //

-- Validate book borrowing limits
CREATE TRIGGER tr_validate_book_limit
BEFORE INSERT ON book_borrowings
FOR EACH ROW
BEGIN
    DECLARE current_books INT;
    DECLARE book_limit INT DEFAULT 5; -- Maximum 5 books per student
    
    SELECT COUNT(*) INTO current_books
    FROM book_borrowings 
    WHERE student_id = NEW.student_id 
    AND status = 'Borrowed';
    
    IF current_books >= book_limit THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot borrow: Student has reached maximum book limit';
    END IF;
END //

-- Update payment status based on amount paid
CREATE TRIGGER tr_update_payment_status
BEFORE UPDATE ON student_fees
FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10,2);
    
    SELECT total_fee INTO total_amount
    FROM fee_structure 
    WHERE fee_id = NEW.fee_id;
    
    IF NEW.amount_paid >= total_amount THEN
        SET NEW.payment_status = 'Paid';
    ELSEIF NEW.amount_paid > 0 THEN
        SET NEW.payment_status = 'Partial';
    ELSE
        SET NEW.payment_status = 'Pending';
    END IF;
END //

DELIMITER ;


SELECT 'All triggers created successfully!' as Status;