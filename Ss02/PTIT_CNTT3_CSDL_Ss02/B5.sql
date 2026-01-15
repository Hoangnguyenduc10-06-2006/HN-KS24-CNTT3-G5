CREATE TABLE Score (
    student_id VARCHAR(10),
    subject_id VARCHAR(10),
    process_score DECIMAL(4,2),
    final_score DECIMAL(4,2),

    PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_score_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_process_score
        CHECK (process_score BETWEEN 0 AND 10),

    CONSTRAINT chk_final_score
        CHECK (final_score BETWEEN 0 AND 10)
);
INSERT INTO Score VALUES
('SV01', 'MH01', 7.5, 8.0),
('SV01', 'MH02', 6.0, 7.0),
('SV02', 'MH01', 8.0, 9.0);
