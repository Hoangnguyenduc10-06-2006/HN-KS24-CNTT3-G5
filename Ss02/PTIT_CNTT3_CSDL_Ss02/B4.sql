CREATE TABLE Teacher (
    teacher_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE Subject
ADD teacher_id VARCHAR(10);
ALTER TABLE Subject
ADD CONSTRAINT fk_subject_teacher
FOREIGN KEY (teacher_id)
REFERENCES Teacher(teacher_id);
ALTER TABLE Subject
DROP FOREIGN KEY fk_subject_teacher;

ALTER TABLE Subject
ADD CONSTRAINT fk_subject_teacher
FOREIGN KEY (teacher_id)
REFERENCES Teacher(teacher_id)
ON DELETE SET NULL;
UPDATE Subject
SET teacher_id = 'GV99'
WHERE subject_id = 'MH01';
