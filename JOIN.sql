--JOIN Keyword


SELECT usn, student_name, prof_name
From cbstudent
JOIN professor ON cbstudent.prof_id = professor.prof_id;

--normal join == inner join

--inner join: returns records that have matching values in both tables.
SELECT usn, student_name, prof_name
From cbstudent
Inner JOIN professor ON cbstudent.prof_id = professor.prof_id;

--LEFT join: returns records that have matching values along with left table also
SELECT usn, student_name, prof_name
From cbstudent
LEFT JOIN professor ON cbstudent.prof_id = professor.prof_id;

--RIGHT join: returns records that have matching values along with right table also
SELECT usn, student_name, prof_name
From cbstudent
RIGHT JOIN professor ON cbstudent.prof_id = professor.prof_id;

--FULL OUTER join: returns records that have matching values along with left and right table also
SELECT usn, student_name, prof_name
From cbstudent
FULL OUTER JOIN professor ON cbstudent.prof_id=professor.prof_id

--CROSS join: returns the Cartesian product of both tables
SELECT usn, student_name, prof_name
From cbstudent
CROSS JOIN professor