--! dispaly the table that contains the list of student along with their respective professor's name.




CREATE TABLE professor(
    prof_id SERIAL NOT NULL UNIQUE,
    prof_name VARCHAR(50) NOT NULL
);

CREATE TABLE cbstudent(
    usn SERIAL NOT NULL UNIQUE,
    student_name VARCHAR(50) NOT NULL,
    prof_id INT REFERENCES professor(prof_id)
);

ALTER TABLE cbstudent
ADD COLUMN assignment_id INT REFERENCES assignment(assignment_id);

CREATE TABLE assignment(
    assignment_id SERIAL NOT NULL UNIQUE,
    assignment_name VARCHAR(50) NOT NULL,
    student_usn INT REFERENCES cbstudent(usn)
);



INSERT INTO professor(prof_name) VALUES('Dr. Smith'), ('Dr. Johnson'), ('Dr. Williams');

SELECT * FROM professor;

INSERT INTO cbstudent(student_name, prof_id) VALUES('Alice', 1), ('Bob', 2), ('Charlie', 3);
INSERT INTO cbstudent(student_name) VALUES('Alice'), ('Bob'), ('Charlie');

INSERT INTO assignment(assignment_name, student_usn) VALUES('Math Assignment', 1), ('Science Assignment', 2);

UPDATE cbstudent
SET assignment_id = 1
WHERE usn = 1;

UPDATE cbstudent
SET assignment_id = 2
WHERE usn = 2;

SELECT * FROM cbstudent;
SELECT * FROM assignment;

-- Solution: To display the list of students along with their respective professor's name, we can use an INNER JOIN between the cbstudent and professor tables based on the prof_id.



SELECT *
From cbstudent
JOIN professor ON cbstudent.prof_id = professor.prof_id;

SELECT usn, student_name, prof_name
From cbstudent
JOIN professor ON cbstudent.prof_id = professor.prof_id;



--Display the list of student who have not submitted the assignment
SELECT s.usn, s.student_name, a.assignment_id, a.assignment_name
From cbstudent AS s
LEFT JOIN assignment AS a ON s.assignment_id = a.assignment_id
WHERE a.assignment_id IS NULL;