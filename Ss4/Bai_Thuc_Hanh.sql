CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Instructor (
    instructor_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Course (
    course_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    sessions INTEGER NOT NULL CHECK (sessions > 0)
);

CREATE TABLE Enrollment (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id VARCHAR(20) NOT NULL,
    course_id VARCHAR(20) NOT NULL,
    enrollment_date DATE NOT NULL,
    instructor_id VARCHAR(20),
    UNIQUE(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id) ON DELETE SET NULL
);

CREATE TABLE Result (
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id VARCHAR(20) NOT NULL,
    course_id VARCHAR(20) NOT NULL,
    midterm_score DECIMAL(3,1) CHECK (midterm_score BETWEEN 0 AND 10),
    final_score DECIMAL(3,1) CHECK (final_score BETWEEN 0 AND 10),
    UNIQUE(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE
);

INSERT INTO Student (student_id, full_name, birth_date, email) VALUES
('SV001', 'Nguyễn Văn An', '2003-05-15', 'an.nguyen@example.com'),
('SV002', 'Trần Thị Bình', '2002-11-20', 'binh.tran@example.com'),
('SV003', 'Lê Văn Cường', '2003-08-10', 'cuong.le@example.com'),
('SV004', 'Phạm Thị Dung', '2004-03-25', 'dung.pham@example.com'),
('SV005', 'Hoàng Văn Em', '2002-07-30', 'em.hoang@example.com');

INSERT INTO Instructor (instructor_id, full_name, email) VALUES
('GV001', 'Đỗ Thị Hoa', 'hoa.do@example.com'),
('GV002', 'Nguyễn Văn Khánh', 'khanh.nguyen@example.com'),
('GV003', 'Trần Văn Long', 'long.tran@example.com'),
('GV004', 'Lê Thị Mai', 'mai.le@example.com'),
('GV005', 'Phạm Văn Nam', 'nam.pham@example.com');

INSERT INTO Course (course_id, title, description, sessions) VALUES
('KH001', 'Lập trình Python', 'Khóa học cơ bản về Python', 30),
('KH002', 'Cơ sở dữ liệu', 'Học SQL và NoSQL', 45),
('KH003', 'Machine Learning', 'Giới thiệu ML với Python', 60),
('KH004', 'Web Development', 'HTML, CSS, JavaScript', 50),
('KH005', 'Toán rời rạc', 'Cơ bản toán cho CNTT', 40);

INSERT INTO Enrollment (student_id, course_id, enrollment_date, instructor_id) VALUES
('SV001', 'KH001', '2025-09-01', 'GV001'),
('SV001', 'KH002', '2025-09-02', 'GV002'),
('SV002', 'KH001', '2025-09-01', 'GV001'),
('SV002', 'KH003', '2025-09-03', 'GV003'),
('SV003', 'KH002', '2025-09-02', 'GV002'),
('SV003', 'KH004', '2025-09-04', 'GV004'),  
('SV004', 'KH003', '2025-09-03', 'GV003'),
('SV004', 'KH005', '2025-09-05', 'GV005'),
('SV005', 'KH001', '2025-09-01', 'GV001'),
('SV005', 'KH004', '2025-09-04', 'GV004');

INSERT INTO Result (student_id, course_id, midterm_score, final_score) VALUES
('SV001', 'KH001', 8.5, 9.0),
('SV001', 'KH002', 7.0, 8.5),
('SV002', 'KH001', 9.0, 9.5),
('SV002', 'KH003', 6.5, 7.0),
('SV003', 'KH002', 8.0, 8.5),
('SV004', 'KH003', 9.5, 10.0);

UPDATE Student SET email = 'an.new@example.com' WHERE student_id = 'SV001';

UPDATE Course SET description = 'Khóa học nâng cao về Python và ứng dụng' WHERE course_id = 'KH001';

UPDATE Result SET final_score = 9.5 WHERE student_id = 'SV001' AND course_id = 'KH001';

DELETE FROM Result WHERE student_id = 'SV003' AND course_id = 'KH004';

DELETE FROM Enrollment WHERE student_id = 'SV003' AND course_id = 'KH004';

SELECT * FROM Student;

SELECT * FROM Instructor;

SELECT * FROM Course;

SELECT 
    e.enrollment_id,
    e.student_id,
    s.full_name AS student_name,
    e.course_id,
    c.title AS course_title,
    e.enrollment_date,
    e.instructor_id
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
ORDER BY e.enrollment_date;

SELECT 
    r.result_id,
    r.student_id,
    s.full_name AS student_name,
    r.course_id,
    c.title AS course_title,
    r.midterm_score,
    r.final_score
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Course c ON r.course_id = c.course_id;
