--Class
CREATE TABLE Class (
    class_id VARCHAR(10) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    school_year INT NOT NULL
);

--Student
CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    class_id VARCHAR(10),

    CONSTRAINT fk_student_class
        FOREIGN KEY (class_id)
        REFERENCES Class(class_id)
);
