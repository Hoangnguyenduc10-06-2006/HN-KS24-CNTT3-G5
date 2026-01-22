CREATE DATABASE TrainingManagement;
USE TrainingManagement;

-- CLASS
CREATE TABLE Class (
    class_id VARCHAR(10) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    school_year INT NOT NULL
);

-- STUDENT
CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    class_id VARCHAR(10),
    FOREIGN KEY (class_id)
        REFERENCES Class(class_id)
        ON DELETE SET NULL
);

-- TEACHER
CREATE TABLE Teacher (
    teacher_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- SUBJECT
CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    teacher_id VARCHAR(10),
    FOREIGN KEY (teacher_id)
        REFERENCES Teacher(teacher_id)
        ON DELETE SET NULL
);

-- ENROLLMENT (N - N)
CREATE TABLE Enrollment (
    student_id VARCHAR(10),
    subject_id VARCHAR(10),
    enroll_date DATE NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
        ON DELETE CASCADE
);
-- SCORE
CREATE TABLE Score (
    student_id VARCHAR(10),
    subject_id VARCHAR(10),
    process_score DECIMAL(4,2) CHECK (process_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
        ON DELETE CASCADE
);
